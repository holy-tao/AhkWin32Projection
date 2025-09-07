#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DCICMD.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DCICREATEINPUT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {DCICMD}
     */
    cmd{
        get {
            if(!this.HasProp("__cmd"))
                this.__cmd := DCICMD(this.ptr + 0)
            return this.__cmd
        }
    }

    /**
     * @type {Integer}
     */
    dwCompression {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwMask{
        get {
            if(!this.HasProp("__dwMaskProxyArray"))
                this.__dwMaskProxyArray := Win32FixedArray(this.ptr + 24, 4, Primitive, "uint")
            return this.__dwMaskProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    dwDCICaps {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * @type {Integer}
     */
    dwBitCount {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpSurface {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
