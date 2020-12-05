import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class ListaTarefa {

    constructor(desc: string) {
        this.descricao = desc;
    }

    @PrimaryGeneratedColumn()
    cod: number;

    @Column()
    descricao: string;

    @Column({ default: false })
    check: boolean

}
