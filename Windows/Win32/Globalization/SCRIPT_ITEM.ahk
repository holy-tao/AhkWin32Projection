#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCRIPT_ANALYSIS.ahk" { SCRIPT_ANALYSIS }
#Import ".\SCRIPT_STATE.ahk" { SCRIPT_STATE }

/**
 * Contains a script item, including a SCRIPT_ANALYSIS structure with the string offset of the first character of the item.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item
 * @namespace Windows.Win32.Globalization
 */
export default struct SCRIPT_ITEM {
    #StructPack 4

    /**
     * Offset from the beginning of the itemized string to the first character of the item, counted in Unicode code points (WCHAR values).
     */
    iCharPos : Int32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis">SCRIPT_ANALYSIS</a> structure containing the analysis of the item.
     */
    a : SCRIPT_ANALYSIS

}
