#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about text that the word breaker will process.
 * @remarks
 * Windows Search populates the members of this structure when the word breaker is invoked and initialized. <a href="https://docs.microsoft.com/windows/desktop/api/indexsrv/nf-indexsrv-iwordbreaker-breaktext">IWordBreaker::BreakText</a> gets a pointer to a <b>TEXT_SOURCE</b> structure and calls PFNFILLTEXTBUFFER, the function pointed to by the <b>pfnFillTextBuffer</b> member, to refill <b>awcBuffer</b> until all text from the source is processed. The <b>PFNFILLTEXTBUFFER</b> function returns an <b>HRESULT</b> that includes both filtering and word-breaking return values.
  * 
  * The filtering return values are the following:
  * 
  * <ul>
  * <li>FILTER_E_NO_MORE_VALUES</li>
  * <li>FILTER_E_NO_TEXT</li>
  * <li>FILTER_E_NO_VALUES</li>
  * <li>FILTER_E_NO_MORE_TEXT</li>
  * <li>FILTER_E_END_OF_CHUNKS</li>
  * </ul>
  * For more information about these return values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/filter-interface-values">Filter-Interface Values</a>.
  * 
  * The word-breaking return value is WBREAK_E_END_OF_TEXT. For more information about word-breaking return values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/indexsrv/word-breaking-values">Word-Breaking Values</a>.
 * @see https://learn.microsoft.com/windows/win32/api/indexsrv/ns-indexsrv-text_source
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class TEXT_SOURCE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>PFNFILLTEXTBUFFER</b>
     * 
     * Pointer to a function, <b>PFNFILLTEXTBUFFER</b> that refills the <b>awcBuffer</b> with text from the source document.
     * @type {Pointer<PFNFILLTEXTBUFFER>}
     */
    pfnFillTextBuffer {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>WCHAR*</b>
     * 
     * Pointer to a buffer that contains text from the source document for the word breaker to parse.
     * @type {Pointer<Char>}
     */
    awcBuffer {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Position of the last character in <b>awcBuffer</b>.
     * @type {Integer}
     */
    iEnd {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Position of the first character in <b>awcBuffer</b>.
     * @type {Integer}
     */
    iCur {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
