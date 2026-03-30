import "scripts/config" as cfg;

fn highlight_title_keywords(text) {
    let result = text;

    for key in cfg::titles {
        let title_rg = RegexCaseInsensitive(`(?P<key>(${key}))`);
        result = title_rg.replace_all(result, "<span class=\"highlight-title\">$key</span>");
    }

    result
}

fn has_highlight_author(authors) {
    for author in authors {
        for key in cfg::authors_array {
            let author_rg = RegexCaseInsensitive(`(${key})`);

            if author_rg.is_match(author) {
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
    "&#9733; " + title
};

title
