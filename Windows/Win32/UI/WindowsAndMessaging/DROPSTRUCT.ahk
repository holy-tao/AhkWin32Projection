#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 * @version v4.0.30319
 */
class DROPSTRUCT extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hwndSource{
        get {
            if(!this.HasProp("__hwndSource"))
                this.__hwndSource := HWND(this.ptr + 0)
            return this.__hwndSource
        }
    }

    /**
     * @type {HWND}
     */
    hwndSink{
        get {
            if(!this.HasProp("__hwndSink"))
                this.__hwndSink := HWND(this.ptr + 8)
            return this.__hwndSink
        }
    }

    /**
     * @type {Integer}
     */
    wFmt {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    dwData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {POINT}
     */
    ptDrop{
        get {
            if(!this.HasProp("__ptDrop"))
                this.__ptDrop := POINT(this.ptr + 32)
            return this.__ptDrop
        }
    }

    /**
     * @type {Integer}
     */
    dwControlData {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }
}
