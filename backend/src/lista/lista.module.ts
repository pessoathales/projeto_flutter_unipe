import { Module } from '@nestjs/common';
import { ListaService } from './lista.service';
import { ListaController } from './lista.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ListaTarefa } from './lista.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([ListaTarefa]),
  ],
  providers: [ListaService],
  controllers: [ListaController]
})
export class ListaModule {}
