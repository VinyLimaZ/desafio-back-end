class CnabsController < ApplicationController
  def new
    @cnab = Cnab.new
  end

  def upload
    cnab = Cnab.new(file: cnab_params)

    if cnab.save
      flash[:success] = 'Mensagem de sucesso'
    else
      flash[:error] = 'Menmsagem de falha'
    end
    redirect_to :new_cnab
  end

  private

  def cnab_params
    File.read(params.require('cnab').permit('file')['file'].path)
  end
end
