import { Component } from '@angular/core';
import {Http, Response} from '@angular/http';


class Character {
	id: number;
	name: string;
	role: string;
	image_url: string;
	health: number;
	organization: number;
}

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
	newCharacter: Character = new Character();
	selectedCharacter: Character = new Character();
	characters: Character[] = [];


	baseURL: string = 'http://localhost:9393/';

	constructor(private http: Http){

		//grab all heroes from the API and set them to our heroes array
		this.getCharacter();
	}

	setCharacter(character){
		this.selectedCharacter = character;
	}


	getCharacter(){
		var self = this;
		this.http.get(this.baseURL + 'characters').subscribe(function(response){
			console.log(response)
			self.characters = response.json();
		})
	}

	postCharacter(){
		var self = this;
		this.http.post(this.baseURL + 'characters', this.newCharacter).subscribe(function(response){
			self.characters.push(response.json());
		})
	}

	patchCharacter(character){
		var self = this;
		this.http.patch(this.baseURL + 'characters/' + this.selectedCharacter.id, this.selectedCharacter).subscribe(function(response){
			self.characters = response.json();
		})
	}

	deleteCharacter(character){
		var self = this;
		this.http.delete(this.baseURL + 'characters/' + character.id).subscribe(function(response){
			self.characters = response.json();
		})
	}

}
