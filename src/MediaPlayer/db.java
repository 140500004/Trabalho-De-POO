package MediaPlayer;

import java.sql.*;
import javax.swing.JOptionPane;

public class db {
	
	//M�todo para Conectar ao Banco de Dados Local chamado 'cadastro', usu�rio 'root' e senha em branco!
	public static Connection conectar() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection c = DriverManager.getConnection("jdbc:mysql://localhost/mediaplayer", "root", "");
			return(c);
		} catch (ClassNotFoundException e) {
			System.out.println("Problema na configura��o do Driver do MySQL!");
                        JOptionPane.showMessageDialog(null, "Problema na configura��o do Driver do MySQL!");
		} catch (SQLException e) {
                        JOptionPane.showMessageDialog(null, "Problema na conexão com o banco de dados!");
			System.out.println("Problema na conex�o com o banco de dados!");
		}
		return(null);
	}
	
	public static ResultSet Pesquisa(String busca, String tipo) {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT Musica.Nome as Musica, Artista.Nome as Artista, Album.Nome as Album FROM Musica, Artista, Album WHERE( "+ tipo +".Nome like '" +busca+"%' AND Musica.FK_Album = Album.id AND Album.FK_Artista = Artista.id);"));
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Problema Pesquisar!");
            }
            return(null);
	}
                
	public static ResultSet Lista() {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT mu.Nome as Musica, al.Nome as Album, ar.Nome As Artista, ge.Nome as Genero, mu.Nota as Nota from musica mu, album al, artista ar, genero ge where( ge.id= ar.FK_Genero AND ar.id = al.FK_Artista AND al.id = mu.FK_Album);"));
            } catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Problema Listagem! de registro");
            }
            return(null);
	}
        
        public static int id_FK(String tabela, String campo, String FK){
           ResultSet res;
           Connection con = conectar();
           Statement st;
           try {
               st = con.createStatement();
               res = (st.executeQuery("SELECT id FROM " + tabela + " WHERE (" + campo + " = '" + FK + "' );"));
                try {
                    while(res.next()) {
                        return(res.getInt("id"));
                    }
		} catch (SQLException e) {
                    JOptionPane.showMessageDialog(null, "Problema para exibir registros!");
		}
           }catch (SQLException e) {
               JOptionPane.showMessageDialog(null, "Problema para exibir registros!");
           }
           return(0);
        }
        
        public static int inserirArtista(String Nome, String Banda, String FK_Genero){
            int fk;
            fk = id_FK("genero", "Nome", FK_Genero);
            
            System.out.println("Classe Artista");
            System.out.println("Nome "+Nome);
            System.out.println("Banda "+Banda);
            System.out.println("Genero "+FK_Genero);
            System.out.println("Id Genero "+fk);
            
            String insercao = "INSERT INTO artista (Nome, Banda, FK_Genero) VALUES ('"+Nome+"', '"+Banda+"', "+fk+");";
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeUpdate(insercao));
            }catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Problema na inserção de Artista!!");
            }
           return(0);
        }
        
        public static int inserirAlbum(String Nome, int Ano, int Faixa, String Fk_Artista){
           int fk;
           fk = id_FK("artista", "Nome", Fk_Artista);
           
           String insercao = "INSERT INTO album (Nome, Ano, Faixa, Fk_Artista) VALUES ('"+Nome+"', "+Ano+", "+Faixa+", "+fk+");";
           Connection con = conectar();
           Statement st;
           try {
               st = con.createStatement();
               return(st.executeUpdate(insercao));
           }catch (SQLException e) {
               JOptionPane.showMessageDialog(null, "Problema na inserção de Album!");
           }
           return(0);
        }
                
	public static int inserirMusica(String Nome, float Tempo, int Ano, int Nota, String FK_Album){
           int fk;
           fk = id_FK("album", "Nome", FK_Album);
           
           String insercao = "INSERT INTO musica (Nome, Tempo, Ano, Nota, FK_Album) VALUES ('"+Nome+"', "+Tempo+", "+Ano+", "+Nota+", "+fk+");";
           Connection con = conectar();
           Statement st;
           try {
               st = con.createStatement();
               return(st.executeUpdate(insercao));
           }catch (SQLException e) {
               JOptionPane.showMessageDialog(null, "Problema na inserção de Musica!!");
           }
           return(0);
        }
        
        public static int inserirGenero(String Nome){
           String insercao = "INSERT INTO genero (Nome) VALUES ('"+Nome+"');";
           Connection con = conectar();
           Statement st;
           try {
               st = con.createStatement();
               return(st.executeUpdate(insercao));
           }catch (SQLException e){
               JOptionPane.showMessageDialog(null, "Problema na inserção de Genero!");
           }
           return(0);
        }
        
        public static ResultSet ListaGenero() {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT Nome FROM genero;"));
            }catch (SQLException e) {
                JOptionPane.showMessageDialog(null, "Problema na consulta a tabela Genero!");
            }
            return(null);
	}
        
        public static ResultSet ListaAlbum() {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT Nome FROM Album;"));
            }catch (SQLException e) {
		JOptionPane.showMessageDialog(null, "Problema na consulta a tabela Album!");
            }
            return(null);
	}
        
        public static ResultSet ListaArtista() {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT Nome FROM Artista;"));
            }catch (SQLException e) {
		JOptionPane.showMessageDialog(null, "Problema na consulta a tabela Artista!");
            }
            return(null);
	}
         
        public static ResultSet ListaMusica() {
            Connection con = conectar();
            Statement st;
            try {
                st = con.createStatement();
                return(st.executeQuery("SELECT Nome FROM Musica;"));
            }catch (SQLException e) {
		JOptionPane.showMessageDialog(null, "Problema na consulta a tabela Musica!");
            }
            return(null);
	}
        
}
