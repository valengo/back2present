//
//  SceneLocalSource.swift
//  back2present
//
//  Created by Andressa Valengo on 27/04/19.
//  Copyright © 2019 Andressa Valengo. All rights reserved.
//

import Foundation

final class SceneLocalSource {
    
    private enum SceneIds: String {
        case root, hospital, secretLab
        case exploreRoom, leaveRoom
        case turnOnTV, leaveRoomAfterExploring
        case watchJournal, watchMovie
        case sisterArrival
        case callDoctor, keepTalking
        case theEnd
    }
    
    private enum FieldNames {
        static let Previous = "PreviousScene"
        static let Next = "NextScenes"
        static let Title = "SceneTitle"
        static let Text = "SceneText"
    }
    
    private var sceneTitles = [
        SceneIds.root: "Onde estou?",
        SceneIds.hospital: "No hospital",
        SceneIds.secretLab: "No laboratório secreto",
        SceneIds.exploreRoom: "Explorando o quarto",
        SceneIds.leaveRoom: "O que há la fora?",
        SceneIds.turnOnTV: "Que dia é hoje?",
        SceneIds.watchJournal: "Notícias do dia...",
        SceneIds.watchMovie: "Tubarão",
        SceneIds.sisterArrival: "Algém conhecido",
        SceneIds.callDoctor: "Especialista",
        SceneIds.keepTalking: "O que aconteceu?",
        SceneIds.theEnd: "FIM"
    ]
    
    private var sceneTexts = [
        SceneIds.root: "\tA luz do sol entra pela janela e você começa a despertar, estava tão bom dormindo... foram vários sonhos e alguns pesadelos e ao abrir os olhos você percebe que talvez tenha dormido tempo demais...\n\n\tVocê percebe que não está no seu quarto! Mas, calma, como é o seu quarto mesmo?! Qual o seu nome?! Você se senta rapidamente na cama e começa a olhar ao redor...  Você está numa cama em um quarto bem claro e limpo e existem várias flores e caixas bonitas ao lado de uma poltrona… você se dá conta que está em:",
        
        SceneIds.hospital: "\tFaz sentido! Você enfim percebe que existem alguns equipamentos conectados a você e que um monitor cardíaco parece até cantarolar em virtude da sua aparente ansiedade. Você decide remover os equipamentos e levantar.\n\n\tMas como você foi parar ali? Você então decide...",
        
        SceneIds.secretLab: "No laboratório secreto",
        
        SceneIds.exploreRoom: "\tVocê resolve explorar um pouco as caixas e as flores ao lado da poltrona marrom. Afinal, estes presentes devem ser para você. As flores parecem ter sido colhidas muito recentemente e são muito bonitas e amarelas. Embora você não se lembre do seu próprio nome, sabe que são girassóis. Como num pulo, você percebe que existe um cartão junto às flores e uma sensação de ânimo enche seu peito. Será que seu nome estaria escrito nele? Você resolve ler e o nome que está escrito é:\n\n\tAgora você já sabe o seu nome! Mas como foi parar ali? Que dia é hoje? Explorando um pouco mais os presentes, percebe que são várias caixas de chocolates e alguns livros. Olhando um pouco mais a sua volta, nota que existe uma pequena televisão no canto da parede. Você decide:",
        
        SceneIds.leaveRoom: "O que há la fora?",
        
        SceneIds.turnOnTV: "\tVocê liga a TV e está passando…",
        
        SceneIds.watchJournal: "Notícias do dia...",
        
        SceneIds.watchMovie: "\tO filme está naquela cena em que o prefeito está proibindo que a praia seja interditada em virtude dos ataques de tubarões. A justificativa seria de que a vinda de turistas é fundamental para o mercado local. Embora você sinta que gosta desse filme e estranhamente lembra muito bem dele, decide que precisa mudar de canal para tentar descobrir que dia é hoje. Quando de repente a porta do quarto se abre…",
        
        SceneIds.sisterArrival: "\t- <nome>! - Exclama uma moça enquanto derruba o lanche que estava trazendo e corre para te abraçar - você acordou!\n" +
            "\t- Acho que sim - Você responde com certo atordoamento.\n\n" +
        "\tDepois de algum tempo ela se afasta e pergunta - Como você está se sentindo? Nossa, eu estava tão preocupada... precisamos ligar para o resto da família...\n" +
        "\t- Família? - Você diz - Como vim parar aqui?\n" +
        "\t- Você não se lembra? - Indaga sua irmã" +
        "\t- Não, não sabia nem o meu nome até instantes atrás! Aliás, não sei o seu! - Você retruca.\n" +
        "\t- Bom... - Ela começa a falar um pouco apreensiva - Eu me chamo Marjorie, eu sou um pouco mais nova do que você e você tem... - Ela faz uma expressão de quem acabou de lembrar de alguma coisa - Eu acho que eu deveria chamar a médica responsável pelo seu caso, mas imagino que você queira saber mais coisas… muito estranho você esquecer as coisas, por essa eu não esperava! Bom, o que você prefere? De repente você recebe alta logo e eu te conto as coisas melhor em casa...",
        SceneIds.callDoctor: "Especialista",
        
        SceneIds.keepTalking: "\tVocê sente confiança na sua irmã e sente também uma certa ansiedade em saber o que aconteceu com você. Então pergunta:\n" +
        "\t- Como vim parar aqui?!\n" +
        "\t- Bom... - Ela parece um pouco pensativa - Você estava indo para o trabalho de bicicleta quando um carro te atropelou.\n\n" +
        "\tSua irmã sempre foi mesmo muito lógica e direta. Você se surpreende com essa lembrança!\n\n" +
        "\t- Nossa! Lembrei uma coisa de você, mana! - Parece que você está lembrando mais coisas na verdade... de onde veio esse \"mana\"? - Você se pergunta.\n" +
        "\t- Hahahaha - sua irmã ri e te dá um tapinha no braço - só você mesmo para mudar de assunto desse jeito\n",
        SceneIds.theEnd: ""
    ]
    
    private var sceneOptions = [
        SceneIds.root: ["Um hospital!", "Um laboratório secreto!"],
        SceneIds.hospital: ["Explorar as coisas que existem pelo quarto.",
                            "Sair do quarto e tentar falar com alguém."],
        SceneIds.secretLab: ["No laboratório secreto."],
        SceneIds.exploreRoom: ["Ligar a televisão.", "Sair do quarto e tentar falar com alguém."],
        SceneIds.leaveRoom: ["", ""],
        SceneIds.turnOnTV: ["Um filme", "Um telejornal."],
        SceneIds.watchJournal: ["Continuar", nil],
        SceneIds.watchMovie: ["Continuar", nil],
        SceneIds.sisterArrival: ["Me conte um pouco agora...", "Acho melhor chamar a médica."],
        SceneIds.callDoctor: ["Option a)", "Option b)"],
        SceneIds.keepTalking: ["Option a)", "Option b)"],
        SceneIds.theEnd: ["Home", nil]
    ]
    
    private var sceneGraph = [
        SceneIds.root: [
            FieldNames.Next: [SceneIds.hospital, SceneIds.secretLab]
        ],
        
        SceneIds.hospital : [
            
            FieldNames.Previous: SceneIds.root,
            FieldNames.Next: [SceneIds.exploreRoom, SceneIds.leaveRoom]
        ],
        
        SceneIds.exploreRoom: [
            FieldNames.Previous: SceneIds.hospital,
            FieldNames.Next: [SceneIds.turnOnTV, SceneIds.leaveRoomAfterExploring]
        ],
        
        SceneIds.turnOnTV: [
            FieldNames.Previous: SceneIds.exploreRoom,
            FieldNames.Next: [SceneIds.watchMovie, SceneIds.watchJournal]
        ],
        SceneIds.watchMovie: [
            FieldNames.Previous: SceneIds.turnOnTV,
            FieldNames.Next: [SceneIds.sisterArrival]
        ],
        
        SceneIds.watchJournal: [
            FieldNames.Previous: SceneIds.turnOnTV,
            FieldNames.Next: [SceneIds.sisterArrival]
        ],
        
        SceneIds.sisterArrival: [
            FieldNames.Previous: SceneIds.watchMovie,
            FieldNames.Next: [SceneIds.keepTalking, SceneIds.callDoctor]
        ],
        
        SceneIds.keepTalking: [
            FieldNames.Previous: SceneIds.sisterArrival,
        ],
        
        SceneIds.secretLab: [
            FieldNames.Previous: SceneIds.root
        ],
        
        SceneIds.leaveRoom: [
            FieldNames.Previous: SceneIds.hospital
        ],
        
        SceneIds.leaveRoomAfterExploring: [
            FieldNames.Previous: SceneIds.exploreRoom
        ],
        
        SceneIds.callDoctor: [
            FieldNames.Previous: SceneIds.sisterArrival
        ]
        
    ]
    
    func getSceneById(id: String) -> Scene? {
        guard let sceneId = SceneIds(rawValue: id) else {
            return nil
        }
        guard let sceneNode = sceneGraph[sceneId] else {
            return nil
        }
        
        let previousNode = sceneNode[FieldNames.Previous] as? SceneIds
        let prevScene = previousNode?.rawValue
        
        var nextScenes: [String]? = nil
        let nextNodes = sceneNode[FieldNames.Next] as? [SceneIds]
        if nextNodes != nil {
            nextScenes = [String]()
            for node in nextNodes! {
                nextScenes?.append(node.rawValue)
            }
        }
        let scene = Scene(id: id,
                          title: sceneTitles[sceneId],
                          text: sceneTexts[sceneId],
                          prevScenes: prevScene,
                          nextScenes: nextScenes,
                          firstOption: sceneOptions[sceneId]?.first ?? nil,
                          secondOption: sceneOptions[sceneId]?.last ?? nil)
        return scene
    }
    
    func getRootScene() -> Scene {
        return getSceneById(id: SceneIds.root.rawValue)!
    }
    
    func getTheEnd() -> Scene {
        return Scene(id: SceneIds.theEnd.rawValue,
                     title: sceneTitles[SceneIds.theEnd],
                     text: sceneTexts[SceneIds.theEnd],
                     prevScenes: nil,
                     nextScenes: nil,
                     firstOption: sceneOptions[SceneIds.theEnd]?.first ?? nil,
                     secondOption: sceneOptions[SceneIds.theEnd]?.last ?? nil)
    }
}
