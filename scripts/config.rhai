let titles_type = ["Dataset", "Survey", "Review", "Overview"];
let titles_method = ["Grasp", "Manipulation", "Articulate", "Robo", "Affordance", "Neural Field", "Descriptor", "Diffusion", "Reinforcement Learning", "Behaviour Cloning"];
let titles_platform = ["Robots", "Robot", "Gripper"];
let titles_sensor = ["RGBD", "LiDAR", "Visual", "Vision", "Camera"];
let titles = titles_method + titles_type + titles_sensor + titles_platform;
let authors_array = ["Hao Su", "Hao Dong", "Cewu Lu", "Yao Mu", "Shuran Song", "Li Yi", "Huaze Xu", "Sergey Levine", "Chelsea Finn", "Lin Shao", "Agrawal Pulkit", "He Wang", "Haoshu Fang", "Guijin Wang", "Shengjin Wang", "Haoxiang Ma"];

let conferences = [
    // AI
    "AAAI", "AAMAS", "ACM MM", "AISTATS", "ALT", "CEC", "ECAI", "FUZZ IEEE", "GECCO", "ICANN", "ICAPS", "ICCBR", "ICONIP", "ICRA", "ICTAI", "IJCAI", "IJCNN", "IROS", "KR", "KSEM", "SIGGRAPH", "STOC", "UAI", "PPSN", "PRICAI", "TAAI",
    // CV
    "3DV", "ACCV", "ACM MM", "BMVC", "CVPR", "ECCV", "ICCV", "ICDAR", "ICIP", "ICME", "ICPR", "IEEE VIS", "MICCAI", "SIGGRAPH", "WACV",
    // DM
    "AKBC", "APWeb", "CIKM", "DASFAA", "ECML-PKDD", "ICDE", "ICDM", "ICDT", "KDD", "LREC", "MDM", "PAKDD", "PODS", "RecSys", "SDM", "SIGMOD", "VLDB", "WSDM", "WWW", "EDBT", "CIDR",
    // IR
    "ECIR", "ESWC", "ICMR", "ICTIR", "ISWC", "SIGIR",
    // ML
    "ACML", "AISTATS", "ECML", "ICLR", "ICML", "ML4H", "NeurIPS", "NIPS", "UAI",
    // NLP
    "AACL", "ACL", "CCL", "COLING", "COLT", "CoNLL", "EACL", "EMNLP", "ICASSP", "ICDAR", "ICONIP", "INTERSPEECH", "LREC", "NAACL", "NLPCC", "RepL4NLP", "SIGDIAL", "SemEval", "WANLP", "WASSA", "WOAH",
    // Arch
    "ASPLOS", "ATC", "DATE", "EuroSys", "FAST", "HPCA", "ISCA", "MICRO", "PPoPP", "SC", "SoCC",
    // System
    "FSE/ESEC", "ICSE", "ISSTA", "OSDI", "SOSP",
    // Security
    "ACSA", "AsiaCCS", "CCS", "DSN", "ESORICS", "EuroS&P", "ICICS", "NDSS", "RAID", "SP", "USENIX Security",
    // Robotics
    "ICRA", "IROS", "RSS"
];

export titles;
export authors_array;
export conferences;
