#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\NMHDR.ahk

/**
 * Contains object position information.
 * @remarks
 * This is used in the <a href="https://msdn.microsoft.com/1965185f-8a13-4989-8574-af8b9b30f6b0">EN_OBJECTPOSITIONS</a> notification.
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-objectpositions
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class OBJECTPOSITIONS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * The <b>code</b> member of this structure identifies the notification code being sent.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(0, this)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a></b>
     * 
     * Number of object positions.
     * @type {Integer}
     */
    cObjectCount {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LONG</a>*</b>
     * 
     * The object positions.
     * @type {Pointer<Integer>}
     */
    pcpPositions {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
