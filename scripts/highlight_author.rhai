import "scripts/config" as cfg;
let authors = params[0];

let result = "";

for (author, index) in authors {
    let highlighted = author;

    for key in cfg::authors_array {
        let authors_rg = RegexCaseInsensitive(`(?P<key>(${key}))`);
        highlighted = authors_rg.replace_all(highlighted, "<span class=\"highlight-author\">$key</span>");
    }

    if index == 0 {
        result = highlighted;
    } else {
        result += ", " + highlighted;
    }
}

result
