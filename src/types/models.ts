export interface TicketType {
    id: number;
    weight: number;
    priority: 'Comum' | 'Prioritário';
    status: 'Pendente' | 'Chamando' | 'Atendendo' | 'Finalizado';
    created_at: Date;
    type: '1' | '2' | '3';
}

export interface AttendantType {
    document: string;
    name: string;
    role: 'Atendente' | 'Supervisor';
}