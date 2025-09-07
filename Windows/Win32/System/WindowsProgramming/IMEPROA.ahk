#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DATETIME.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 * @charset ANSI
 */
class IMEPROA extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * @type {Pointer<Ptr>}
     */
    hWnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DATETIME}
     */
    InstDate{
        get {
            if(!this.HasProp("__InstDate"))
                this.__InstDate := DATETIME(this.ptr + 8)
            return this.__InstDate
        }
    }

    /**
     * @type {Integer}
     */
    wVersion {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    szDescription{
        get {
            if(!this.HasProp("__szDescriptionProxyArray"))
                this.__szDescriptionProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__szDescriptionProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    szName{
        get {
            if(!this.HasProp("__szNameProxyArray"))
                this.__szNameProxyArray := Win32FixedArray(this.ptr + 74, 1, Primitive, "char")
            return this.__szNameProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    szOptions{
        get {
            if(!this.HasProp("__szOptionsProxyArray"))
                this.__szOptionsProxyArray := Win32FixedArray(this.ptr + 154, 1, Primitive, "char")
            return this.__szOptionsProxyArray
        }
    }
}
