import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { ListaTarefa } from './lista.entity';
import { Repository } from 'typeorm';

@Injectable()
export class ListaService {

    constructor(
        @InjectRepository(ListaTarefa)
        private repository: Repository<ListaTarefa>,
    ) { }

    async findAll(): Promise<ListaTarefa[]> {
        return await this.repository.find({ order: { cod: "DESC" } });
    }

    async findOne(cod: number): Promise<ListaTarefa> {
        return await this.repository.findOne(cod);
    }

    async save(descricao: string): Promise<ListaTarefa> {
        return await this.repository.save(new ListaTarefa(descricao));
    }

    async update(lista: ListaTarefa): Promise<any> {
        lista.check = lista.check + '' == 'true';
        return await this.repository.update(lista.cod, lista);
    }

    async remove(id: number): Promise<void> {
        await this.repository.delete(id);
    }

}
