#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk

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
     * @type {Integer}
     */
    hasQueryText {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    invokeSucceeded {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
