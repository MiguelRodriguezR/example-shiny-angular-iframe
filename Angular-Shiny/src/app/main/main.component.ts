import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-main',
  templateUrl: './main.component.html',
  styleUrls: ['./main.component.scss']
})
export class MainComponent implements OnInit {

  constructor() { }

  ngOnInit(): void {
  }

  enviar(s: String, type: string, graphX = '', graphfill = '', graphType = '') {
    const wn: HTMLIFrameElement = document.getElementById('ifrm') as HTMLIFrameElement;
    const enviar = {
      id: 'archivo',
      csvName: s,
      type,
      graphX,
      graphfill,
      graphType
    };
    wn.contentWindow.postMessage(enviar, '*');
  }
}
