#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains a portion of a Unicode string, that is, an &quot;item&quot;.
 * @remarks
 * This structure is filled by <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> or <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a>, each of which breaks a Unicode string into individually shapeable items. Neither function accesses the <b>SCRIPT_ANALYSIS</b> structure directly. Each function handles an array of <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_item">SCRIPT_ITEM</a> structures, each of which has a member defining a <b>SCRIPT_ANALYSIS</b> structure.
  * 
  * Applications that use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemizeopentype">ScriptItemizeOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptitemize">ScriptItemize</a> should also use <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshapeopentype">ScriptShapeOpenType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplaceopentype">ScriptPlaceOpenType</a> instead of <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptshape">ScriptShape</a> and <a href="https://docs.microsoft.com/windows/desktop/api/usp10/nf-usp10-scriptplace">ScriptPlace</a>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Intl/displaying-text-with-uniscribe">Displaying Text with Uniscribe</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usp10/ns-usp10-script_analysis
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class SCRIPT_ANALYSIS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/usp10/ns-usp10-script_state">SCRIPT_STATE</a> structure containing a copy of the Unicode algorithm state.
     * @type {Integer}
     */
    s {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
