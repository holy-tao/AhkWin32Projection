#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates wildcard options on search terms. Used by ISearchQueryHelper::get_QueryTermExpansion and ISearchQueryHelper::put_QueryTermExpansion methods.
 * @remarks
 * While the <b>SEARCH_TERM_EXPANSION</b> enumerated type lets you specify stem expansion, Windows Search does not currently support its use with the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/ne-searchapi-search_term_expansion
 * @namespace Windows.Win32.System.Search
 */
export default struct SEARCH_TERM_EXPANSION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No expansion is applied to search terms.
     * @type {Integer (Int32)}
     */
    static SEARCH_TERM_NO_EXPANSION => 0

    /**
     * All search terms are expanded.
     * @type {Integer (Int32)}
     */
    static SEARCH_TERM_PREFIX_ALL => 1

    /**
     * Stem expansion is applied to all terms.
     * @type {Integer (Int32)}
     */
    static SEARCH_TERM_STEM_ALL => 2
}
