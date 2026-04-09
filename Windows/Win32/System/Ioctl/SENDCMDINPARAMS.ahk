#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IDEREGS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SENDCMDINPARAMS extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    cBufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {IDEREGS}
     */
    irDriveRegs {
        get {
            if(!this.HasProp("__irDriveRegs"))
                this.__irDriveRegs := IDEREGS(4, this)
            return this.__irDriveRegs
        }
    }

    /**
     * @type {Integer}
     */
    bDriveNumber {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    bReserved {
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 13, 3, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    dwReserved {
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 16, 4, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    bBuffer {
        get {
            if(!this.HasProp("__bBufferProxyArray"))
                this.__bBufferProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__bBufferProxyArray
        }
    }
}
