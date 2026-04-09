#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DRIVERSTATUS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class SENDCMDOUTPARAMS extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

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
    DriverStatus {
        get {
            if(!this.HasProp("__DriverStatus"))
                this.__DriverStatus := DRIVERSTATUS(4, this)
            return this.__DriverStatus
        }
    }

    /**
     * @type {Array<Integer>}
     */
    bBuffer {
        get {
            if(!this.HasProp("__bBufferProxyArray"))
                this.__bBufferProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__bBufferProxyArray
        }
    }
}
