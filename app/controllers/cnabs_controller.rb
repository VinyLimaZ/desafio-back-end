class CnabsController < ApplicationController
  def new
    @cnab = Cnab.new
  end

  def upload
    cnab = Cnab.new(file: cnab_params)

    if cnab.save
      CnabParserJob.perform_now(cnab.id)
      flash[:success] = 'Mensagem de sucesso'
    else
      flash[:error] = 'Mensagem de falha'
    end
    redirect_to :new_cnab
  end

  private

  def cnab_params
    File.read(params.require('cnab').permit('file')['file'].path)
  end
end
