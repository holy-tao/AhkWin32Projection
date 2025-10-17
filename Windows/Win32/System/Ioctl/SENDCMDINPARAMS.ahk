#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\IDEREGS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SENDCMDINPARAMS extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

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
    irDriveRegs{
        get {
            if(!this.HasProp("__irDriveRegs"))
                this.__irDriveRegs := IDEREGS(8, this)
            return this.__irDriveRegs
        }
    }

    /**
     * @type {Integer}
     */
    bDriveNumber {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Array<Byte>}
     */
    bReserved{
        get {
            if(!this.HasProp("__bReservedProxyArray"))
                this.__bReservedProxyArray := Win32FixedArray(this.ptr + 17, 3, Primitive, "char")
            return this.__bReservedProxyArray
        }
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserved{
        get {
            if(!this.HasProp("__dwReservedProxyArray"))
                this.__dwReservedProxyArray := Win32FixedArray(this.ptr + 20, 4, Primitive, "uint")
            return this.__dwReservedProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bBuffer{
        get {
            if(!this.HasProp("__bBufferProxyArray"))
                this.__bBufferProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__bBufferProxyArray
        }
    }
}
