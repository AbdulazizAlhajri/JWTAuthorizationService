package com.mobily.loyalty.authorization.data;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "role")
@Getter
@Setter
public class Role implements Serializable {

	@Id
	private Integer id;

	@Column(name = "name")
	private String name;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "permission_role", joinColumns = {@JoinColumn(name = "role_id", referencedColumnName = "id") }, inverseJoinColumns = {@JoinColumn(name = "permission_id", referencedColumnName = "id") })
	private List<Permission> permissions;


	public Role() {
	}

	public Role(Integer id, String name, List<Permission> permissions) {

		this.id = id;
		this.name = name;
		this.permissions = permissions;
	}
}
