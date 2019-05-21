class CnabsController < ApplicationController
  def new
    @cnab = Cnab.new
  end

  def upload
    cnab = Cnab.new(file: cnab_params)

    if cnab.save
      CnabParserJob.perform_later(cnab.id)
      flash[:success] = 'Cnab salvo, iremos processa-lo em instantes'
    else
      flash[:error] = "Falha no upload do arquivo. Favor verifica-lo e tentar novamente"
    end
    redirect_to :new_cnab
  end

  private

  def cnab_params
    File.read(params.require('cnab').permit('file')['file'].path)
  end
end
