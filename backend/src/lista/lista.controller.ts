import { Controller, Post, Body, Get, Put, Delete, Param } from '@nestjs/common';
import { ListaService } from './lista.service';
import { ListaTarefa } from './lista.entity';

@Controller('listaTarefa')
export class ListaController {

  constructor(private service: ListaService) { }

  @Post()
  async criarTarefa(@Body('descricao') descricao: string) {
    return await this.service.save(descricao);
  }

  @Get()
  async listarTarefa() {
    return await this.service.findAll();
  }

  @Put()
  async atualizarTarefa(@Body() lista: ListaTarefa) {
    return await this.service.update(lista);
  }

  @Delete(':cod')
  async removerTarefa(@Param('cod') cod: number) {
    return await this.service.remove(cod);
  }

}
