#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores the association of text and its writing system script, as well as some display attributes.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_script_analysis
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_SCRIPT_ANALYSIS extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>UINT16</b>
     * 
     * The zero-based index representation of writing system script.
     * @type {Integer}
     */
    script {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/dwrite/ne-dwrite-dwrite_script_shapes">DWRITE_SCRIPT_SHAPES</a></b>
     * 
     * A value that indicates additional shaping requirement of text.
     * @type {Integer}
     */
    shapes {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }
}
