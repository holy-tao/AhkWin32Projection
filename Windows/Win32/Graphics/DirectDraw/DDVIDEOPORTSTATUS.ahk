#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk
#Include .\DDVIDEOPORTCONNECT.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDVIDEOPORTSTATUS extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {BOOL}
     */
    bInUse{
        get {
            if(!this.HasProp("__bInUse"))
                this.__bInUse := BOOL(this.ptr + 4)
            return this.__bInUse
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {DDVIDEOPORTCONNECT}
     */
    VideoPortType{
        get {
            if(!this.HasProp("__VideoPortType"))
                this.__VideoPortType := DDVIDEOPORTCONNECT(this.ptr + 16)
            return this.__VideoPortType
        }
    }

    /**
     * @type {Pointer}
     */
    dwReserved2 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    dwReserved3 {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
