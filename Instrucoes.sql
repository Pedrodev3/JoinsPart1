

--
-- select simples
--
select	id_estado,
		nm_estado,
		sg_estado
from 	t_rhstu_estado
order by sg_estado;


--
-- Ambiguously column
--
select	sg_estado,
		nm_estado,		
		id_estado,
		id_cidade,
		nm_cidade,
		cd_ibge,
		nr_ddd
from 	t_rhstu_estado,
		t_rhstu_cidade
order by sg_estado;


--
-- Produto cartesiano
--
select	e.sg_estado,
		e.nm_estado,		
		e.id_estado,
		c.id_estado,
		c.id_cidade,
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e,
		t_rhstu_cidade c
order by e.sg_estado;


--
-- Inner Join padrão SQL 99
--
select	e.sg_estado,
		e.nm_estado,		
		e.id_estado,
		c.id_estado,
		c.id_cidade,
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e inner join t_rhstu_cidade c
on (e.id_estado = c.id_estado)
order by e.sg_estado;


--
-- Padrão Oracle inner join
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e,
		t_rhstu_cidade c
where   e.id_estado = c.id_estado
order by e.sg_estado;


--
-- Left Join padrão SQL 99
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e left join t_rhstu_cidade c   
on (e.id_estado = c.id_estado)
order by e.sg_estado;

--
-- Right Join padrão SQL 99
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_cidade c  right join t_rhstu_estado e
on (e.id_estado = c.id_estado)
order by e.sg_estado;



--
-- Left Join padrão SQL 99
-- Exiba somente os Estados que não tenham Cidade
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e left join t_rhstu_cidade c   
on (e.id_estado = c.id_estado)
where  c.id_estado is null
order by e.sg_estado;


--
-- Padrão Oracle outer join
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd
from 	t_rhstu_estado e,
		t_rhstu_cidade c
where   e.id_estado = c.id_estado(+)
order by e.sg_estado;

--
-- Join 1TDSVJ padrão SQL 99
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd,
		b.nm_bairro,
		b.nm_zona_bairro,
		l.nm_logradouro,
		l.nr_cep,
		lp.nr_logradouro,
		lp.ds_complemento_numero,
		lp.ds_ponto_referencia,
		lp.dt_inicio,
		lp.dt_fim,
		p.nm_paciente,
		p.nr_cpf,
		p.dt_nascimento,
		p.ds_estado_civil
from 	t_rhstu_estado e left join t_rhstu_cidade c   
on (e.id_estado = c.id_estado) left join t_rhstu_bairro b
on (c.id_cidade = b.id_cidade)  left join t_rhstu_logradouro l
on (b.id_bairro = l.id_bairro) left join t_rhstu_endereco_paciente lp
on (l.id_logradouro = lp.id_logradouro) left join t_rhstu_paciente p
on (lp.id_paciente = p.id_paciente)
order by e.sg_estado, c.nm_cidade, b.nm_bairro, l.nm_logradouro, p.nm_paciente;


--
-- Inner Join 1TDSVJ padrão SQL 99
--
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd,
		b.nm_bairro,
		b.nm_zona_bairro,
		l.nm_logradouro,
		l.nr_cep,
		lp.nr_logradouro,
		lp.ds_complemento_numero,
		lp.ds_ponto_referencia,
		lp.dt_inicio,
		lp.dt_fim,
		p.nm_paciente,
		p.nr_cpf,
		p.dt_nascimento,
		p.ds_estado_civil
from 	t_rhstu_estado e inner join t_rhstu_cidade c   
on (e.id_estado = c.id_estado) inner join t_rhstu_bairro b
on (c.id_cidade = b.id_cidade)  inner join t_rhstu_logradouro l
on (b.id_bairro = l.id_bairro) inner join t_rhstu_endereco_paciente lp
on (l.id_logradouro = lp.id_logradouro) inner join t_rhstu_paciente p
on (lp.id_paciente = p.id_paciente)
order by e.sg_estado, c.nm_cidade, b.nm_bairro, l.nm_logradouro, p.nm_paciente;	

--
-- Conferindo
--
select count(*) from t_rhstu_paciente;

--
-- Criando uma view logica
--
create or replace view v_dados_rhstu_paciente as		
select	e.sg_estado,
		e.nm_estado,		
		c.nm_cidade,
		c.cd_ibge,
		c.nr_ddd,
		b.nm_bairro,
		b.nm_zona_bairro,
		l.nm_logradouro,
		l.nr_cep,
		lp.nr_logradouro,
		lp.ds_complemento_numero,
		lp.ds_ponto_referencia,
		lp.dt_inicio,
		lp.dt_fim,
		p.nm_paciente,
		p.nr_cpf,
		p.dt_nascimento,
		p.ds_estado_civil
from 	t_rhstu_estado e inner join t_rhstu_cidade c   
on (e.id_estado = c.id_estado) inner join t_rhstu_bairro b
on (c.id_cidade = b.id_cidade)  inner join t_rhstu_logradouro l
on (b.id_bairro = l.id_bairro) inner join t_rhstu_endereco_paciente lp
on (l.id_logradouro = lp.id_logradouro) inner join t_rhstu_paciente p
on (lp.id_paciente = p.id_paciente)
order by e.sg_estado, c.nm_cidade, b.nm_bairro, l.nm_logradouro, p.nm_paciente;	

--
-- Exibir dados a partir de uma view logica
--
select * from v_dados_rhstu_paciente;
