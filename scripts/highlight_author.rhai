import "scripts/config" as cfg;
let authors = params[0];

fn contains_ignore_case(text, needle) {
    text.to_lower().contains(needle.to_lower())
}

let result = "";
let first = true;

for author in authors {
    let highlighted = author;

    for key in cfg::authors_array {
        if contains_ignore_case(author, key) {
            highlighted = "<span class=\"highlight-author\">" + author + "</span>";
            break;
        }
    }

    if first {
        result = highlighted;
        first = false;
    } else {
        result += ", " + highlighted;
    }
}

result
