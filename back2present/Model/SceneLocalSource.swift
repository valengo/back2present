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
        case doctorArrival, doctorArrivalAfterTalking
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
        SceneIds.secretLab: "Imaginacão fértil",
        SceneIds.exploreRoom: "Explorando o quarto",
        SceneIds.leaveRoom: "O que há lá fora?",
        SceneIds.leaveRoomAfterExploring: "O que há lá fora?",
        SceneIds.turnOnTV: "Que dia é hoje?",
        SceneIds.watchJournal: "Coisas não esquecidas...",
        SceneIds.watchMovie: "Tubarão",
        SceneIds.sisterArrival: "Algém conhecido",
        SceneIds.callDoctor: "Especialista",
        SceneIds.keepTalking: "O que aconteceu?",
        SceneIds.doctorArrival: "Perspectivas",
        SceneIds.theEnd: "FIM"
    ]
    
    private var sceneTexts = [
        SceneIds.root: "\tA luz do sol entra pela janela e você começa a despertar, estava tão bom dormindo... foram vários sonhos e alguns pesadelos e ao abrir os olhos você percebe que talvez tenha dormido tempo demais...\n\n\tVocê percebe que não está no seu quarto! Mas, calma, como é o seu quarto mesmo?! Qual o seu nome?! Você se senta rapidamente na cama e começa a olhar ao redor...  Você está numa cama em um quarto bem claro e limpo e existem várias flores e caixas bonitas ao lado de uma poltrona… você se dá conta que está em:",
        
        SceneIds.hospital: "\tFaz sentido! Você enfim percebe que existem alguns equipamentos conectados a você e que um monitor cardíaco parece até cantarolar em virtude da sua aparente ansiedade. Você decide remover os equipamentos e levantar.\n\n\tMas como você foi parar ali? Você então decide...",
        
        SceneIds.secretLab: "Realmente poderia ser. Mas não, você está num hospital mesmo. O orçamento está curto e não poderíamos pagar pelos efeitos especiais. Quem sabe na próxima edição.",
        
        SceneIds.exploreRoom: "\tVocê resolve explorar um pouco as caixas e as flores ao lado da poltrona marrom. Afinal, estes presentes devem ser para você. As flores parecem ter sido colhidas muito recentemente e são muito bonitas e amarelas. Embora você não se lembre do seu próprio nome, sabe que são girassóis. Como num pulo, você percebe que existe um cartão junto às flores e uma sensação de ânimo enche seu peito. Será que seu nome estaria escrito nele? Você resolve ler e o nome que está escrito é:\n\n\tAgora você já sabe o seu nome! Mas como foi parar ali? Que dia é hoje? Explorando um pouco mais os presentes, percebe que são várias caixas de chocolates e alguns livros. Olhando um pouco mais a sua volta, nota que existe uma pequena televisão no canto da parede. Você decide:",
        
        SceneIds.leaveRoomAfterExploring: "Com a decisão de sair e tentar achar alguém você se direciona até a porta, mas alguém a abre antes de você...",
        
        SceneIds.leaveRoom: "\tVocê abre a porta e se depara com um corredor com várias outras portas. Não acha adequado entrar em outros quartos… de repente, no final do corredor aparece uma enfermeira! Ela reconhece você como um paciente e se assusta ao ver você andando por aí e diz:\n" +
        "\t- Senhor? O que você está fazendo fora do seu quarto?\n" +
        "\t- Desculpe, não sei o que estou fazendo aqui...\n" +
        "\t- Qual é o seu quarto? Eu comecei a trabalhar aqui há pouco tempo...\n" +
        "\t- Você leva a enfermeira, Gabriela, ao quarto. Ela chega e já olha no seu prontuário - nesse momento você pensa que deveria ter explorado mais o quarto - e lá está escrito o seu nome...\n" +
        "\t- Então, <nome>, eu vou chamar a médica para que ela possa dar uma olhada em você, logo volto.\n" +
        "\tA enfermeira sai e você fica só no quarto. Ainda com muitas dúvidas, você fica em pé pensando...\n\n" +
        "\tAté que a porta do quarto abre novamente...",
        
        SceneIds.turnOnTV: "\tQue alívio. Parece que não passou tanto tempo assim. Ao assistir a reportagem sobre como aplicativos para celular podem ajudar as pessoas a desenvolverem hábitos melhores, você percebe que as pessoas parecem usar roupas e cortes de cabelo que são familiares para você. Engraçado, parece que algumas coisas estão bem claras na sua cabeça...\n\n" +
        "\tA porta abre...",
        
        SceneIds.watchJournal: "\tQue alívio. Parece que não passou tanto tempo assim. Ao assistir a reportagem sobre como aplicativos para celular podem ajudar as pessoas a desenvolverem hábitos melhores, você percebe que as pessoas parecem usar roupas e cortes de cabelo que são familiares para você. Engraçado, parece que algumas coisas estão bem claras na sua cabeça...\n\n" +
        "\tA porta abre...",
        
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
        "\t- Hahahaha - sua irmã ri e te dá um tapinha no braço - só você mesmo para mudar de assunto desse jeito.\n\n" +
        "\tA porta abre novamente...",
        
        SceneIds.doctorArrival: "\tA médica chega. Ela não ficou surpresa que você havia esquecido várias coisas sobre sua própria vida. Ela também contou que as perspectivas eram boas e que você em breve deve recuperar toda a memória. Sua irmã ligou para o resto da família e vocês combinaram de encontrar com todos na casa da sua irmã. No caminho de volta para a casa você percebe que as coisas não mudaram tanto assim...",
        
        SceneIds.theEnd: ""
    ]
    
    private var sceneOptions = [
        SceneIds.root: ["Um hospital!", "Um laboratório secreto!"],
        SceneIds.hospital: ["Explorar as coisas que existem pelo quarto.",
                            "Sair do quarto e tentar falar com alguém."],
        SceneIds.secretLab: ["Voltar para a realidade", nil],
        SceneIds.exploreRoom: ["Ligar a televisão.", "Sair do quarto e tentar falar com alguém."],
        SceneIds.leaveRoom: ["Continuar", nil],
        SceneIds.leaveRoomAfterExploring: ["Continuar", nil],
        SceneIds.turnOnTV: ["Um filme.", "Um telejornal."],
        SceneIds.watchJournal: ["Continuar", nil],
        SceneIds.watchMovie: ["Continuar", nil],
        SceneIds.sisterArrival: ["Me conte um pouco agora...", "Acho melhor chamar a médica."],
        SceneIds.callDoctor: ["Continuar", nil],
        SceneIds.keepTalking: ["Continuar", nil],
        SceneIds.doctorArrival: ["Continuar", ""],
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
        
        SceneIds.leaveRoomAfterExploring: [
            FieldNames.Previous: SceneIds.exploreRoom,
            FieldNames.Next: [SceneIds.sisterArrival]
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
            FieldNames.Next: [SceneIds.keepTalking, SceneIds.doctorArrival]
        ],
        
        SceneIds.keepTalking: [
            FieldNames.Previous: SceneIds.sisterArrival,
            FieldNames.Next: [SceneIds.doctorArrival]
        ],
        
        SceneIds.doctorArrival: [
            FieldNames.Previous : SceneIds.keepTalking
        ],
        
        SceneIds.secretLab: [
            FieldNames.Previous: SceneIds.root,
            FieldNames.Next: [SceneIds.hospital]
        ],
        
        SceneIds.leaveRoom: [
            FieldNames.Previous: SceneIds.hospital,
            FieldNames.Next: [SceneIds.sisterArrival]
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
