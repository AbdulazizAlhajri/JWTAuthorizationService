package com.mobily.loyalty.authorization.data;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "permission")
@Getter
@Setter
public class Permission implements Serializable {

	@Id
	private Integer id;

	@Column(name = "name")
	private String name;


	public Permission() {
	}

	public Permission(Integer id, String name) {

		this.id = id;
		this.name = name;
	}
}
