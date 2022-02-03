

package br.com.elginI9;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Scanner;
import java.util.Timer;

import com.fazecast.jSerialComm.SerialPort;

/**
 * @author bruno.cruz
 * Descrição: Este codigo tem como objetivo reproduzir o cupom fiscal do McDonalds
 */
public class ExecComand {
	
	private static String porta;
	private static OpenPort oP;
	private static SerialPort com;


	public static void main(String[] args) throws InterruptedException {
		
		
//		defini a porta e a abre
		definePort();
						
//		inicializar a impressora - comando ESCPOS em Hexadecimal
		byte[] command = new byte[]{0x1B,0x40};
		executeCommand(command);
		
//		definindo a centralização do texto comando em decimal
		command = new byte[]{27, 97, 1};
		executeCommand(command);
		
		//seleciona o minifont atraves do comando 27, 33
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		executeCommand("Elgin Manaus \n".getBytes());
		executeCommand("Elgin/SA \n".getBytes());
		executeCommand("Rua Abiura, 579 Distrito Industrial Manaus - AM \n\n".getBytes());
		executeCommand("CNPJ 14.200.166/0001-66 IE 111.111.111.111 IM\n".getBytes());
		
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------".getBytes());
		
//		Definindo o comando para pular linha - comando ESCPOS em decimal
		command = new byte[]{10};
		executeCommand(command);
		
//		Define fonte como negrito
		command = new byte[]{27,69,1};
		executeCommand(command);
		
		executeCommand("Extrato No. 002046\nCUPOM FISCAL ELETRÔNICO - SAT\n".getBytes());
		
		//cancela fonte negrito
		command = new byte[]{27,69,0};
		executeCommand(command);
		
//		definindo justificação a esquerda do texto comando em decimal
		command = new byte[]{27, 97, 0};
		executeCommand(command);
		
		executeCommand("-----------------------------------------------\n".getBytes());
		
		//seleciona o minifont 
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		executeCommand("CPF/CNPJ consumidor:\n".getBytes());
		
		//cancela o minifont 
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		
		executeCommand("-----------------------------------------------\n".getBytes());

		//seleciona o minifont
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		executeCommand("# | COD | DESC | QTD | UN | VL UN R$ | (VL TR R$)* | VL ITEM R$".getBytes());
		
		//cancela o minifont
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------\n".getBytes());

		//seleciona o minifont 
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		String teste = "1 1000016 IMPRESSORA NAO FISCAL I9 3,449 U 2.899 (3.84)  100.00\n"
                + "Total R$                                                 100.00\n"
                + "Dinheiro                                                 100.00\n"
                + "Troco                                                      0.00\n";
		
		executeCommand(teste.getBytes());
				
		//cancela o minifont 
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------\n".getBytes());
		
		//seleciona o minifont 
		command = new byte[]{27, 33, 1};
		executeCommand(command);		
		
		executeCommand("Tributos totais (Lei Fed. 12.741/12)R$                     3.85\n".getBytes());

		//cancela o minifont 
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------\n".getBytes());
		
		//seleciona o minifont 
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		teste = "R$ 3.84 R$3.84 Trib Aprox R$ 1.35 Fed R$2.50 Est\n"
                + "Fonte: IBPT/FECOMERCIO(R$) 9oi3aC\n\n"
                + "-\n";
		
		executeCommand(teste.getBytes());
		
		//cancela o minifont 
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------\n".getBytes());
		
		//seleciona o minifont
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		executeCommand("*Valor aproximado dos tributos do item\n".getBytes());
		
		//cancela o minifont
		command = new byte[]{27, 33, 0};
		executeCommand(command);
		executeCommand("-----------------------------------------------\n".getBytes());
		
		//centraliza texto
		command = new byte[]{27, 97, 1};
		executeCommand(command);
		
		//fonte negrito
		command = new byte[]{27,69,1};
		executeCommand(command);
		
		executeCommand("SAT No. 90000123\n".getBytes());
		
		//Cancela fonte negrito
		command = new byte[]{27,69,0};
		executeCommand(command);
		
		//seleciona o minifont 
		command = new byte[]{27, 33, 1};
		executeCommand(command);
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss");		
		executeCommand(format.format(new Date()).getBytes());
		executeCommand("\n\n".getBytes());
		
/* ***************************************************************************************************
 * 
* Codigo de impressão do Code128
*  
*************************************************************************************************** */
		
		// Definindo justificação centralizada do texto comando em decimal
		command = new byte[]{27, 97, 1};
		executeCommand(command);
		
		//1D 68 n >>>>> define altura do code128
		command = new byte[]{0x1D, 0x68, 70};
		executeCommand(command);
		
		//1D 48 n >> define posição do HRI
		command = new byte[]{0x1D, 0x48, 2};
		executeCommand(command);
		
		//1D 77 n >>>> define largura do codigo
		command = new byte[]{0x1D, 0x77, 1};
		executeCommand(command);
		
		//1D 6B m n d1...dn >> imprime o code128
		String code128 = "{B35150661099008000141593515066109900800014159";
		int size = code128.length();
		command = new byte[]{0x1D, 0x6B, 0x49, (byte)size};
		executeCommand(command);
		executeCommand(code128.getBytes());
		command = new byte[]{0xA, 0xA};
		executeCommand(command);
		
		 		
/* **************************************************************************************************
 * 
 * Codigo de impressão do QR Code
 *  
 *************************************************************************************************** */		

		int tamanho;
		int tamI;
		int tamF;
		
		String qrcod = "mjBNoBoQVihMwTzUA+IBlgU12si36ipyVC2L+W5PhCvvqx1xVF/moy4wIzGTfWYpqsMa0641ZBFJFWnWIo78YBBE4m2GwGen84VTPz9iwvs4QkAQdijCiX6TA3wWSjIdiYhqyDroH0IBGnIOWug8ModehDreQFyDdnvAUVItszFVKW12/1JFhu9nxneAAKlJYecY46W3LcOOQSvt1yOcJzM74l+BsmlcYZZVi4I1mEazoj7YzG3Rx64444444";
		tamanho = qrcod.length()+3;
		
		if (tamanho>=256) {
			tamI = tamanho-256;
			tamF = tamanho/256;
		}else{
			tamI = tamanho;
			tamF = 0;
		}

		command = new byte[]{27, 97, 49};// centraliza o conteudo
		executeCommand(command);
		command = new byte[]{29, 40, 107, 3, 0, 49, 67, 4}; //defini o tamanho do modulo pg 616
		executeCommand(command);
		command = new byte[]{29, 40, 107, 3, 0, 49, 69, 48}; // Selecione o nível de correção de erros pg 618
		executeCommand(command);
		command = new byte[]{29, 40, 107};// armazenamendo dos dados do codigo
		executeCommand(command);
		command = new byte[]{(byte)tamI,(byte) tamF,49,80,48};// armazenamendo dos dados do codigo
		executeCommand(command);
		command = qrcod.getBytes();// armazenamendo dos dados do codigo
		executeCommand(command);
		command = new byte[]{29, 40, 107, 3, 0, 49, 81, 48};//imprime dados do qrcode armazenado na area de armazenagem de símbolos
		executeCommand(command);
		
/* ***************************************************************************************************
 * 
 * Código para obter status
 * 
*************************************************************************************************** */		
		com.setComPortTimeouts(SerialPort.TIMEOUT_READ_BLOCKING, 0, 0);// define o tempo limite de espera para resposta
		command = new byte[]{0x1D, 0x61, 0x04}; // comando para obter status da impressora
		byte [] commando = new byte[4]; // array para armazenar dados de retorno
		try{
			for(int j=0;j<1; j++)
			{
				executeCommand(command);
				
				int io = com.readBytes(commando, commando.length);
				System.out.println("Numero de bytes lidos: "+io);
				System.out.print(Integer.toHexString(commando[0]));
				System.out.print(Integer.toHexString(commando[1]));
				System.out.print(Integer.toHexString(commando[2]));
				System.out.println(Integer.toHexString(commando[3]));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		command = new byte[] { '\n', '\n', 0x1D, 0x56, 0x48, 0x1D, 0x56, 0x42, 0x00 }; // comando de corte de papel
		executeCommand(command);
/* ***************************************************************************************************
 * 
 * Código para abrir gaveta
 * 
*************************************************************************************************** */		
		command = new byte []{'\n', 27, 112, 48, 10, 5};//abre gaveta
		executeCommand(command);
		
		com.closePort();//fecha porta de comunicação
	}
	
	public static void executeCommand(byte[] cod){
		
		try {
			OutputStream dao = (OutputStream) com.getOutputStream();//verificar erro aqui nessa linha de comando
		
			if (dao != null) {
				System.out.println(convertHex(cod));
				dao.write(cod);
				dao.close();
			}else{
				System.out.println("erro na impressão");//verificar erro aqui nessa linha de comando
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
	}
	
	public static void definePort(){
		Scanner s = new Scanner(System.in);
		System.out.println("Informe a porta com");
		System.out.print(">> ");
		porta = s.next();
		
		oP = new OpenPort();
		com = oP.openPort(porta);
	}
	
	public static String convertHex(byte[] dados){
		String dadosSTR = "";
		
		for(byte b : dados){
			dadosSTR = dadosSTR + Integer.toHexString(b)+" ";
		}
		
		return dadosSTR;
	}	
}

