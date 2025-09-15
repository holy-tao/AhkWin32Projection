#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRIVERSTATUS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SENDCMDOUTPARAMS extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cBufferSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {DRIVERSTATUS}
     */
    DriverStatus{
        get {
            if(!this.HasProp("__DriverStatus"))
                this.__DriverStatus := DRIVERSTATUS(this.ptr + 8)
            return this.__DriverStatus
        }
    }

    /**
     * @type {Array<Byte>}
     */
    bBuffer{
        get {
            if(!this.HasProp("__bBufferProxyArray"))
                this.__bBufferProxyArray := Win32FixedArray(this.ptr + 20, 1, Primitive, "char")
            return this.__bBufferProxyArray
        }
    }
}
