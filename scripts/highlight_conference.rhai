import "scripts/config" as cfg;
let comment = params[0];

fn contains_ignore_case(text, needle) {
    text.to_lower().contains(needle.to_lower())
}

if comment != () {
    let conference = "";

    for key in cfg::conferences {
        if contains_ignore_case(comment, key) {
            conference = key;
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
