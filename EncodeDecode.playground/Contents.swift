import UIKit
//: # Encode && Decode

//: ## Decode

/*: ```json
 
 ####  JSON significa Javascript Object Notation
 
 [
     {
         "nome": "Giovanna",
         "idade": 21,
         "profissao": "Desenvolvedora"
     },
     {
         "nome": "Ana",
         "idade": 25,
         "profissao": "Designer"
     }
 ]
 
```
 */

/*:
  1. - Precisamos de estruturas para fazer o decode.
 
  2. - Precisamos conformar a nossa struct com o protocolo Codable para poder utilizar o método `decode` de decoder.decode
 
  3. - Precisamos converter essa variável json em um objeto do tipo Data(), porque é com isso que os decodificadores do tipo Codable funcionam.
    Basicamente, o tipo Data é usado para interagir com dados binários brutos.
 */

struct Pessoa: Codable {
    var nome: String
    var idade: Int
    var profissao: String
}

struct Person: Codable {
    var name: String
    var year: Int
    var job: String
}



let json = """
  [
      {
          "nome": "Giovanna",
          "idade": 21,
          "profissao": "Desenvolvedora"
      },
      {
          "nome": "Ana",
          "idade": 25,
          "profissao": "Designer"
      }
  ]
"""


let data = Data(json.utf8)


// ## Decode


let decoder = JSONDecoder()


// SUCCESSS

do {
    let objetoDecodificado = try decoder.decode([Pessoa].self, from: data)
    print(objetoDecodificado[0].nome) // "Giovanna"
} catch {
    print("Não foi possível decodificar o JSON")
}


// FAILURE


do {
    let objetoDecodificado = try decoder.decode([Person].self, from: data)
    print(objetoDecodificado[0].name) // "Giovanna"
} catch {
    print("Não foi possível decodificar o JSON")
}




//: ## Encode

let encoder = JSONEncoder()

let pessoa = Pessoa(nome: "Giovanna", idade: 21, profissao: "Desenvolvedora")

print("Printa pra gente um Json ? ", pessoa)

do {
    let pessoaJSON = try encoder.encode(pessoa)
    print(String(data: pessoaJSON, encoding: .utf8) ?? "")
} catch {
    print("Não foi possível realizar a codificação!")
}




// DICA FINAL -> https://app.quicktype.io, ele gera para você as structs de decode



/*: #### Referências https://www.alura.com.br/artigos/ios-swift-conversao-dados-codable-encodable-decodable
 
 */
