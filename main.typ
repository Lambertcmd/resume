#import "chicv.typ": *

#show: chicv

#let private_info = json("resume-private/private_info.json")
#let resume_name = private_info.name_cn
#let resume_phone = private_info.phone


= #redact(alter: "roife")[#resume_name] #box(width: 376pt) #box(baseline: 5%,width: 80pt,std.image("1c1.jpg"))
  #fa[#phone] #redact(mark: true)[#resume_phone] |
  #fa[#envelope] penguinqiee\@gmail.com |
  #fa[#github] #link("https://github.com/Lambertcmd")[Lambert]
  #fa[#globe] #link("https://tomoe-gozen.vercel.app/")[tomoe-gozen.vercel.app]

  == #fa[#briefcase] 工作经历

    
    #cventry(
        tl: [深圳开思时代科技有限公司],
        bl: [前台业务开发部],
        br: [Java开发工程师],
        tr: [2023.06 - 至今]
    )[
        - 参与商家组、会员组、库存组的项目开发，包含商家工作台、管理中心、集成系统的功能迭代与优化：
          - 主导ERP库存对接从0到1的项目开发，现已对接450个ERP系统，进行库存对接的商家达3000+；
          - 参与库存管理、采购管理项目的开发，优化查询慢SQL达10余个，针对300w数据量的库存数据导入由5分钟优化至80s左右；
          - v24.9.19 *二级事故救火*：在新版本发布后客户分组开放至全国，DBA反馈数据库CPU暴涨、客服反馈系统异常和页面空白等问题。本人在 10 分钟内通过网关追踪定位到问题接口，发现该接口进行了全量数据查询涉及26万+维修厂，紧急限流SQL查询并设计新方案进行热修发布，该紧急修复控制了事故影响范围，避免了影响全国范围的维修厂客户。
    ]

    #cventry(
        tl: [深圳智能屋电子科技有限公司],
        bl: [研发部],
        br: [Java开发实习生],
        tr: [2022.07 - 2023.04]
    )[
        - 主要参与小猫管家公寓管理系统项目的功能设计和代码编写以及其余已上线项目的功能迭代与优化；
        - 负责搭建内部 CI/CD 流水线工程，实现项目的自动化部署。
    ]

  //== #fa[#trophy] 奖项荣誉

  //- 2022 年本科生*国家奖学金*（该学年成绩排名 1/195）；北京航空航天大学优秀毕业生；
  //- 2021 年全国大学生计算机系统能力大赛 · *编译系统设计赛*（华为毕昇杯）*一等奖*，总排名第二；
  //- 蓝桥杯 C++ 程序设计竞赛 A 组北京赛区一等奖、国赛三等奖；
  //- 另获其他各类省级奖项、校级奖项、奖学金共*十余次*。

  == #fa[#project-diagram] 项目经历

    #cventry(
        tl: [ERP库存对接管理系统],
        bl: [外部ERP调用开思标准化接口或主动获取ERP数据实现库存对接 · 2024年开思金马团队奖],
        br: [Java / SpringCloud],
        //tr: [#ghrepo("roife/vizsla") (WIP)],
    )[
        - 实现了一套异构数据-数据清洗-价格库存调整-商品上架并报价自动化的库存对接系统；
        - 基于*责任链模式+命令模式*设计并实现了一套数据处理的规则链，责任链模式负责组织和传递规则链，命令模式负责具体规则的条件判断与执行，大大提高了规则的可配置性和可扩展性；
        - 基于*分布式任务调度中心XXL-JOB*的每日定时调用ERP系统的接口主动获取全量和变量数据，保证了数据实时性；
        - 依据*Redis缓存多请求多批次的数据以及Elasticsearch*中临时存储原始数据、非标数据、标准数据以及数据对接结果，目前ES的数据量达百万级别；
    ]

    #cventry(
         tl: [商家工作台-库存管理],
         bl: [提升商家库存管理的便利性，包含库存、入库、出库、安全库存、库位、盘点、调拨、移位管理],
         br: [Java / SpringCloud],
         //tr: ghrepo("No-SF-Work/ayame"),
    )[
        - 针对入库列表、出库列表、库存查询均治理过慢SQL优化，查询效率由2s优化提升至100ms；
        - 基于*DDD*领域驱动设计 + 流程处理管理器（基于策略模式+模板方法实现）处理复杂的长流程实现，如创建入库单流程、安全库存批量导入；
        - 基于EasyExcel实现了一套复用型的导出工具，以边读边写的方式防止内存溢出问题，最大可支持导出300w数据。
    ]

    #cventry(
         tl: [商家工作台-采购管理],
         bl: [为商家库存管理提效而设，包含库存、入库、出库、库位、盘点、调拨、移位管理],
         br: [Java / LLVM-IR / ARM],
         tr: ghrepo("No-SF-Work/ayame"),
     )[
         - 合作项目，个人主要负责编写面向 Machine IR 和体系结构的后端优化和代码生成，完成了基于图着色的*迭代寄存器合并*算法、*指令调度*、*死代码删除*、窥孔优化等，同时参与了部分语法树模块的编写；
         - 同时负责项目的测试和 DevOps，利用 docker 和 GitLab CI 搭建了测试评估流程，并编写了 Python 脚本自动分析测试结果；
         - 项目从零开始，完成了从语法解析到代码生成的完整编译器 pipeline，编写了大量 SSA IR 与 Machine IR 上的优化，最终在比赛中获一等奖。本项目在比赛中总排名第二，在*近一半样例上排名第一*，并在 1/3 的样例上优化效果超越 `gcc -O3` 与 `clang -O3`。
    ]

    #cventry(
        tl: [商家工作台-库存管理],
        bl: [],
        br: [C++ / LLVM-IR],
        tr: ghrepo("roife/llvm-lite"),
    )[
        - 课题旨在利用端侧推理设备已知的形状信息，对深度学习算子进行*二次编译优化*，以减少算子运行时的时空开销；
        - 项目包含运行在推理设备的 LLVM IR *轻量编译器*和对 LLVM Codegen 模块的*裁剪工作*。针对目标 workloads，优化器选择性实现了*SCCP*、*DCE*等优化，裁剪工作移除了无关支持，且只保留必要优化，从而以最小的开销取得最好的优化结果；
        - 毕业设计获得*优秀*评价。成功将 conv2d 算子和 softmax 算子的推理时间降低 *6%*，并将生成的二进制目标文件减小 *38%*；
    ]

    #cventry(
        tl: [其他个人项目],
    )[
        - #ghrepo("Lambertcmd/super_u_edu") (SpringCloud/Vue，独立完成) 疫情期间个人独立完成在线教育系统项目，支持 Web 端；
    ]

    #cventry(
        tl: [#fa[#code.branch] 开源社区贡献],
    )[
        - *#fa[#rust]* 负责维护官方 IDE（语言服务器）#ghrepo("rust-lang/rust-analyzer")；在 rust 社区也贡献过 #ghrepo("rust-lang/rust")，#ghrepo("rust-lang/rust-clippy")，#ghrepo("rust-lang/rustup")，#ghrepo("rust-lang/rust-mode") 等项目；
        - #ghrepo("llvm/llvm-project")，#ghrepo("clangd/vscode-clangd")，#ghrepo("MikePopoloski/slang"), #ghrepo("google/autocxx")，#ghrepo("yuin/goldmark"), #ghrepo("moonbitlang/tree-sitter-moonbit")，更多项目见 #link("https://github.com/roife")[GitHub]。
    ]

  == #fa[#graduation-cap] 教育背景

    #cventry(
        tl: [深圳大学],
        tr: [2022.09 - 2025.06（预计）],
    )[
      本科，计算机科学与技术
    ]
    #cventry(
        tl: [广东工贸职业技术学院],
        tr: [2020.09 - 2023.06],
    )[
        专科，计算机应用技术｜一等奖学金，第17届技能节德特杯科技互联网大赛第一名。 #linebreak()
        助教工作：*Java语言程序设计*（2021 春），#link("https://mcareu.com/")[*北大深圳医院宫颈癌筛查基地*]（2022 春｜[极客工作室]，与工作室导师协同进行公益项目的*系统开发*）
    ]

  == #fa[#laptop.code] 专业技能

    #grid(
        columns: (auto, auto),
        align: (right, left),
        row-gutter: 11pt,
        gutter: 8pt,
        [*编程语言*], [扎实的Java基础，熟悉常用的Java API和Java8新特性],
        [*数据库*], [#list(marker: [‣],
            [熟练使用MySQL关系型数据库；熟悉SQL语句优化；],
            [熟悉JDBC API优化批处理性能，减少数据库交互；],
            [熟练Redis，了解底层持久化技术，针对缓存问题 ( 数据一致性 / 缓存击穿等 ) 有线上解决经验；],
        )],
        [*应用开发*], [
            #list(marker: [‣],
                [SpringBoot, SpringCloud, Mybatis-Plus等后端框架和RabbitMQ/Kafka消息中间件；],
                [Elasticsearch存储引擎的使用和设计；Docker 和 CI/CD 配置等 DevOps 工作；],
                [了解Camuda自动化流程引擎；]
            )],     
        [*开发环境*], [熟悉 IntelliJ IDEA 与 VS Code，习惯在 Windows 下工作；能简单使用生成式 AI 工具提高工作效率（如MCP）；],
    )

  == #fa[#th.list] 其他

    - *社团工作*：曾担任北航开放原子开源社团的社长，组织过多次技术分享和企业交流活动；
    - *技术博客*：#link("https://roife.github.io")[roife.github.io] 创作时间超 5 年，主要内容为理论计算机和课程笔记，曾帮助大量同学完成 lab，月访问量逾 1.5k；
    - *外语*：英语。