import "scripts/config" as cfg;

fn contains_ignore_case(text, needle) {
    text.to_lower().contains(needle.to_lower())
}

fn highlight_title_keywords(text) {
    for key in cfg::titles {
        if contains_ignore_case(text, key) {
            return "<span class=\"highlight-title\">" + text + "</span>";
        }
    }

    text
}

fn has_highlight_author(authors) {
    for author in authors {
        for key in cfg::authors_array {
            if contains_ignore_case(author, key) {
                return true;
            }
        }
    }

    false
}

let title = params[0];
let authors = params[1];

title.trim();
let title = highlight_title_keywords(title);

let title = if has_highlight_author(authors) {
    "<span class=\"highlight-title\">&#9733;</span> " + title
} else {
    "&#9734; " + title
};

title
