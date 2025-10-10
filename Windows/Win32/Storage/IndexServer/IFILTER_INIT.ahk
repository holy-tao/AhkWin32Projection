#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags that control the filtering process.
 * @remarks
 * 
  * Generally, text output by the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-gettext">IFilter::GetText</a> method should match exactly the actual text of the document. However, in order to achieve maximum interoperability, some standardization of common features is desirable. These features include paragraph breaks, line breaks, hyphens and spaces. <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface servers can also embed null characters in text, which are nearly ignored by clients. That is, Unicode character 0x0000 is completely ignored and 0x0001 is treated as a word break.
  * 
  * Four flags control text standardization: IFILTER_INIT_CANON_PARAGRAPHS, IFILTER_INIT_HARD_LINE_BREAKS, IFILTER_INIT_CANON_HYPHENS, and IFILTER_INIT_CANON_SPACES.
  * 
  * Different clients of the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface want different views of an object. Three flags, IFILTER_INIT_APPLY_INDEX_ATTRIBUTES, IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES, and IFILTER_INIT_APPLY_OTHER_ATTRIBUTES, control the set of properties that should be applied to chunks. In addition, specific properties can be requested in calls to the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-init">IFilter::Init</a> method as an array of size cAttributes, stored in aAttributes.
  * 
  * 
  * 
  * 
  * <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface implementations need to store some chunk information when operations other than content indexing occur. IFILTER_INIT_INDEXING_ONLY optimizes the filter for indexing.
  * 
  * For viewing purposes, it can be desirable to search across links as well as in the document and any objects it embeds. IFILTER_INIT_SEARCH_LINKS specifies recursively searching all links.
  * 
  * Certain <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> interface implementations might generate property values during the content indexing process, and IFILTER_INIT_FILTER_OWNED_VALUE_OK indicates that it is OK to return these values.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//filter/ne-filter-ifilter_init
 * @namespace Windows.Win32.Storage.IndexServer
 * @version v4.0.30319
 */
class IFILTER_INIT{

    /**
     * Paragraph breaks should be marked with the Unicode PARAGRAPH SEPARATOR (0x2029).
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_CANON_PARAGRAPHS => 1

    /**
     * Soft returns, such as the newline character in Word, should be replaced by hard returns?LINE SEPARATOR (0x2028). Existing hard returns can be doubled. A carriage return (0x000D), line feed (0x000A), or the carriage return and line feed in combination should be considered a hard return. The intent is to enable pattern-expression matches that match against observed line breaks.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_HARD_LINE_BREAKS => 2

    /**
     * Various word-processing programs have forms of hyphens that are not represented in the host character set, such as optional hyphens (appearing only at the end of a line) and nonbreaking hyphens. This flag indicates that optional hyphens are to be converted to nulls, and non-breaking hyphens are to be converted to normal hyphens (0x2010), or HYPHEN-MINUSES (0x002D).
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_CANON_HYPHENS => 4

    /**
     * Just as the IFILTER_INIT_CANON_HYPHENS flag standardizes hyphens, this one standardizes spaces. All special space characters, such as nonbreaking spaces, are converted to the standard space character (0x0020).
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_CANON_SPACES => 8

    /**
     * Indicates that the client wants text split into chunks representing internal value-type properties.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_INDEX_ATTRIBUTES => 16

    /**
     * Any properties not covered by the IFILTER_INIT_APPLY_INDEX_ATTRIBUTES and IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES flags should be emitted.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_OTHER_ATTRIBUTES => 32

    /**
     * Indicates that the client wants text split into chunks representing properties determined during the indexing process.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_APPLY_CRAWL_ATTRIBUTES => 256

    /**
     * Optimizes <a href="https://docs.microsoft.com/windows/desktop/api/filter/nn-filter-ifilter">IFilter</a> for indexing because the client calls the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-init">IFilter::Init</a> method only once and does not call <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-bindregion">IFilter::BindRegion</a>. This eliminates the possibility of accessing a chunk both before and after accessing another chunk.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_INDEXING_ONLY => 64

    /**
     * The text extraction process must recursively search all linked objects within the document. If a link is unavailable, the <a href="https://docs.microsoft.com/windows/desktop/api/filter/nf-filter-ifilter-getchunk">IFilter::GetChunk</a> call that would have obtained the first chunk of the link should return FILTER_E_LINK_UNAVAILABLE.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_SEARCH_LINKS => 128

    /**
     * The content indexing process can return property values set by the filter.
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_FILTER_OWNED_VALUE_OK => 512

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_FILTER_AGGRESSIVE_BREAK => 1024

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_DISABLE_EMBEDDED => 2048

    /**
     * TBD
     * @type {Integer (Int32)}
     */
    static IFILTER_INIT_EMIT_FORMATTING => 4096
}
