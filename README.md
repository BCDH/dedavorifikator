# Дедаворификатор

Дедаворификатор је XSLT трансформација помоћу које се текстови писани у Ворду такозваним „Даворовим фонтом” конвертују у стандардни Уникод.

## Шта је то Даворов фонт?

„Даворов фонт” је за потребе Института за српски језик САНУ  направио Давор Палчић. Фонт је коришћен за писање и штампање институтских публикација - речника (Речник САНУ и Етимолошки речник српског језика), монографија и часописа, током више од две деценије.

Ради технолошког унапређења процеса рада неопходан је прелазак на стандардне Уникод фонтове, па сарадници Института за српски језик САНУ користе и ову прилику да се захвале Давору Палчићу на фонту који их је све ове године савршено служио.

## Куцање у Уникоду

За куцање у Уникоду (укључујући основну и проширену ћирилицу, латиницу и комбиноване дијакритике) на рачунарима са оперативним системом Windows препоручујемо [проширену српску тастатуру](https://github.com/BCDH/extended-serbian-keyboard).

## Употреба

### Инсталација

1. Преузети фолдер са GitHub репозиторијума BCDH/dedavorifikator преко следећег линка: [https://github.com/BCDH/dedavorifikator](https://github.com/BCDH/dedavorifikator) и то десним кликом на зелено дугме *Clone or download*:
  ![](https://i.imgur.com/nUqyLY9.jpg)
**(слика 1)**
- уколико користите апликацију GitHub Desktop, изаберите опцију *Open in desktop* или копирајте URL па клонирајте репозиторијум у GitHub Desktop-у и изаберите место на свом рачунару где желите да клон буде сачуван.
- ако не користите GitHub Desktop, кликните на Download ZIP, па распакујте зиповани фолдер
![](https://i.imgur.com/ebOwc0e.jpg)
**(слика 2)**



### Ажурирање

- Ако користите апликацију GitHub Desktop, ажурирајте репозиторијум преко команде Pull origin
- Ако не користите апликацију GitHub Desktop, и даље можете да скинете [новије верзије](https://github.com/BCDH/dedavorifikator/releases) дедаворификатора као зиповани фолдер и да замените старију верзију на свом рачунару.

### Конверзија

#### Подешавање сценарија за конверзију

Приликом прве конверзије неопходно је подесити сценарио за конверзију. Сваки следећи пут, конверзија ће бити далеко лакша и бржа.

1. Фајл за дедаворификацију отворити у Ворду и сачувати га као *.xml* тако што ћете:
    - у главном менију кликнути на *File*
    - потом на *Save as*
    - у прозору који се отвори одабрати опцију *Word XML document (.xml)* из падајућег менија који је понуђен у делу *Save as type*
    - кликнути на дугме *Save* у доњем десном углу прозора![](https://i.imgur.com/eciuc8S.jpg)
**(слика 3)**
2. Отворити XML фајл који смо управо направили у оХygen XML Editor-у (или неком другом програму који даје могућност XSLT трансформације XML фајлова)
3. На полици са алаткама изабрати иконицу за подешавања у облику француског кључа (слика 4)![](https://i.imgur.com/zwAMNOl.jpg)
**(слика 4)**
4. Када се отвори прозор за подешавање сценарија за трансформацију:
    - кликнути на дугме *New* и изабрати опцију *XML transformation with XSLT* (прва опција) из падајућег менија![](https://i.imgur.com/7ywMyY4.jpg)
**(слика 5)**
5. У новом прозору за подешавања (слика 6):
    - уписати име под којим желимо да сачувамо сценарио, нпр. дедаворификатор (аутоматски ту пише име фајла који је тренутно отворен у Oxygen-у)
    - изабрати опцију *Global options* да бисмо могли да користимо сценарио и кад отворимо друге фајлове, иначе ћемо сваки пут морати поново да подешавамо сценарио за трансформацију
    - у картици XSLT  подесити параметре тако што ћете најпре унети локацију XSL сценарија (фајл који смо скинули са GitHub-а) у део предвиђен за *XSL URL*, то можете урадити и левим кликом на иконицу жуте фасикле (слика 6)
![](https://)![](https://i.imgur.com/0bquhxZ.jpg)
**(слика 6)**
    -  ту треба пронаћи и изабрати XSL фајл (слика 7)![](https://i.imgur.com/GSuHUYP.jpg)
**(слика 7)**
    - затим треба обавезно променити *Transformer* у *Saxon-HE 9.6.0.7* (претходно се ту налазио *Saxon 6.5.5*) (слика 6)
6. У картици *Output* означити опцију *Save as* и изабрати локацију где ће се фајл(ови) чувати (слика 8)
![](https://)![](https://i.imgur.com/2Jn2DKJ.jpg)
**(слика 8)**
    - локацију можемо унети ручно или копирати из насловног дела фолдера у ком желимо да се фајлови чувају (кликом на црну стрелицу која иде надоле појављује се локација)![](https://i.imgur.com/a1iaKu4.jpg)
**(слика 9)**
    - можемо и унапред направити нови фолдер на Desktop-у са именом *Дедаворификовано*, на пример, и унети његову локацију
    - име трансформисаног фајла контролише се кликом на иконицу са зеленом стрелицом (слика 8), где бирамо опцију *${cfn} the current file name without extension* из падајућег менија који ће се појавити
    - одабраној опцији треба додати завршетак, на пример *.dedavorifikovan.xml*, после имена фајла у наставку локације (слика 8)

Уколико се оригинални фајл зове *abc.xml*, после трансформације са овде поменутим подешавањима, нови фајл ће се звати *abc.dedavorifikovan.xml*

7. На крају треба кликнути на дугме *ОК* да бисмо сачували подешавања сценарија (слика 8)
8. Сада остаје отворен само почетни прозор за подешавање сценарија у коме се види нови сценарио за трансформацију (слика 10):
    - у њему треба штриклирати поље испред сценарија који смо направили
    - потом кликнути на дугме *Apply associated* у дну прозора
![](https://)![](https://i.imgur.com/UncNEVT.jpg)
**(слика 10)**

Овим се добија нови, трансформисани XML фајл на месту које смо у подешавањима предвидели.

10. Отворити новодобијени XML фајл у Word-у и сачувати га као *Word document* са екстензијом *.doc* или *.docx* на жељеном месту (упутство у кораку 1).

Овим се добија тражени дедаворификовани Word фајл.

#### Употреба постојећег сценарија за конверзију

1. Сачувати Word фајл као *.xml*
2. Отворити *.xml* фајл у oXygen-у
3. Трансформисати *.xml* фајл са претходно подешеним сценариом
4. Трансформисани фајл отворити у Word-у
5. Сачувати Word фајл као *.doc* или *.docx* фајл.

### Подешавање фонтова

*dedavorifikator.xsl* по дифолту мапира ћирилична, латинична и грчка слова из Даворовог фонта у одоговарајућа слова по Уникоду у фонту Cambria. Старословенска ћирилица се мапира у фонт Bukyvede.

Уколико немате фонт Bukyvede, можете га скинути са ове странице: https://kodeks.uni-bamberg.de/AKSL/Schrift/BukyVede.htm

Избор фонтова можете подесити на почекту фајла dedavorifikator.xsl:

```xml        
    <!--font mapping for Cyrillic, Latin and Greek-->
    <xsl:variable name="mainFont">Cambria</xsl:variable>
    <!--font mapping for Old Cyrillic-->
    <xsl:variable name="OCSFont">Bukyvede</xsl:variable>
```


#### Пример текста у „Даворовом фонту”
![](https://i.imgur.com/7vfwNzN.jpg)


#### Пример „дедаворификованог” текста
![](https://i.imgur.com/MLPe4Un.png)

## Аутор

[Тома Тасовац](https://twitter.com/ttasovac), Центар за дигиталне хуманистичке науке.    
