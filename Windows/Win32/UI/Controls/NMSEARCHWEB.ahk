#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMSEARCHWEB extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {NMHDR}
     */
    hdr{
        get {
            if(!this.HasProp("__hdr"))
                this.__hdr := NMHDR(this.ptr + 0)
            return this.__hdr
        }
    }

    /**
     * @type {Integer}
     */
    entrypoint {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * @type {BOOL}
     */
    hasQueryText{
        get {
            if(!this.HasProp("__hasQueryText"))
                this.__hasQueryText := BOOL(this.ptr + 28)
            return this.__hasQueryText
        }
    }

    /**
     * @type {BOOL}
     */
    invokeSucceeded{
        get {
            if(!this.HasProp("__invokeSucceeded"))
                this.__invokeSucceeded := BOOL(this.ptr + 32)
            return this.__invokeSucceeded
        }
    }
}
