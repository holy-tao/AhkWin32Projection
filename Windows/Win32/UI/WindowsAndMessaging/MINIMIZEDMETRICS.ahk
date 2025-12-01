#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the scalable metrics associated with minimized windows.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-minimizedmetrics
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class MINIMIZEDMETRICS extends Win32Struct
{
    static sizeof => 20

    static packingSize => 4

    /**
     * The size of the structure, in bytes. The caller must set this to <c>sizeof(MINIMIZEDMETRICS)</c>.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The width of minimized windows, in pixels.
     * @type {Integer}
     */
    iWidth {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The horizontal space between arranged minimized windows, in pixels.
     * @type {Integer}
     */
    iHorzGap {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * The vertical space between arranged minimized windows, in pixels.
     * @type {Integer}
     */
    iVertGap {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    iArrange {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 20
    }
}
