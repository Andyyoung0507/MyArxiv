import "scripts/config" as cfg;
let comment = params[0];

if comment != () {
    let conference = "";

    for key in cfg::conferences {
        let conferences_rg = Regex(`(?P<key>(${key})([\\s'-]*\\d+)?)`);
        let matched = conferences_rg.find(comment);

        if matched != () {
            conference = matched.text;
        }

        if conference != "" {
            break;
        }
    }

    if conference != "" {
        "<span class=\"chip\">" + conference + "</span>"
    } else {
        ""
    }
} else {
    ""
}
