#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies values used by IAutoComplete2::GetOptions and IAutoComplete2::SetOptions for options surrounding autocomplete.
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/ne-shldisp-autocompleteoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class AUTOCOMPLETEOPTIONS extends Win32Enum{

    /**
     * 0x0000. Do not autocomplete.
     * @type {Integer (Int32)}
     */
    static ACO_NONE => 0

    /**
     * 0x0001. Enable the autosuggest drop-down list.
     * @type {Integer (Int32)}
     */
    static ACO_AUTOSUGGEST => 1

    /**
     * 0x0002. Enable autoappend.
     * @type {Integer (Int32)}
     */
    static ACO_AUTOAPPEND => 2

    /**
     * 0x0004. Add a search item to the list of completed strings. When the user selects this item, it launches a search engine.
     * @type {Integer (Int32)}
     */
    static ACO_SEARCH => 4

    /**
     * 0x0008. Do not match common prefixes, such as "www." or "http://".
     * @type {Integer (Int32)}
     */
    static ACO_FILTERPREFIXES => 8

    /**
     * 0x0010. Use the TAB key to select an item from the drop-down list.
     * @type {Integer (Int32)}
     */
    static ACO_USETAB => 16

    /**
     * 0x0020. Use the UP ARROW and DOWN ARROW keys to display the autosuggest drop-down list.
     * @type {Integer (Int32)}
     */
    static ACO_UPDOWNKEYDROPSLIST => 32

    /**
     * 0x0040. Normal windows display text left-to-right (LTR). Windows can be mirrored to display languages such as Hebrew or Arabic that read right-to-left (RTL). Typically, control text is displayed in the same direction as the text in its parent window. If <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/ne-shldisp-autocompleteoptions">ACO_RTLREADING</a> is set, the text reads in the opposite direction from the text in the parent window.
     * @type {Integer (Int32)}
     */
    static ACO_RTLREADING => 64

    /**
     * 0x0080. <b>Windows Vista and later</b>. If set, the autocompleted suggestion is treated as a phrase for search purposes. The suggestion, <i>Microsoft Office</i>, would be treated as <i>"Microsoft Office"</i> (where both <i>Microsoft</i> AND <i>Office</i> must appear in the search results).
     * @type {Integer (Int32)}
     */
    static ACO_WORD_FILTER => 128

    /**
     * 0x0100. <b>Windows Vista and later</b>. Disable prefix filtering when displaying the autosuggest dropdown. Always display all suggestions.
     * @type {Integer (Int32)}
     */
    static ACO_NOPREFIXFILTERING => 256
}
