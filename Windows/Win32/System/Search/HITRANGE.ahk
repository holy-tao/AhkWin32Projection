#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the range of matching data when query search conditions match indexed data.
 * @remarks
 * The <b>HITRANGE</b> structure is useful for identifying where a search term matches the content from returned results, and for hit highlighting in user interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ns-structuredquery-hitrange
 * @namespace Windows.Win32.System.Search
 */
export default struct HITRANGE {
    #StructPack 4

    /**
     * Type: <b>ULONG</b>
     * 
     * The beginning of the hit range.
     */
    iPosition : UInt32

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the hit range.
     */
    cLength : UInt32

}
