#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * Defines the CF_HDROP clipboard format. The data that follows is a double null-terminated list of file names.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-dropfiles
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DROPFILES extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The offset of the file list from the beginning of this structure, in bytes.
     * @type {Integer}
     */
    pFiles {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a></b>
     * 
     * The drop point. The coordinates depend on <b>fNC</b>.
     * @type {POINT}
     */
    pt{
        get {
            if(!this.HasProp("__pt"))
                this.__pt := POINT(8, this)
            return this.__pt
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A nonclient area flag. If this member is <b>TRUE</b>, <b>pt</b> specifies the screen coordinates of a point in a window's nonclient area. If it is <b>FALSE</b>, <b>pt</b> specifies the client coordinates of a point in the client area.
     * @type {BOOL}
     */
    fNC {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * A value that indicates whether the file contains ANSI or Unicode characters. If the value is zero, the file contains ANSI characters. Otherwise, it contains Unicode characters.
     * @type {BOOL}
     */
    fWide {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }
}
