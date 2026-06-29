#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_GET_INFO_PARAMETERS extends Win32Struct {
    static sizeof => 4096

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    omac {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    rnRandomNumber {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Guid}
     */
    guidInformation {
        get {
            if(!this.HasProp("__guidInformation"))
                this.__guidInformation := Guid(16, this)
            return this.__guidInformation
        }
    }

    /**
     * @type {Integer}
     */
    ulSequenceNumber {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cbParametersSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    abParameters {
        get {
            if(!this.HasProp("__abParametersProxyArray"))
                this.__abParametersProxyArray := Win32FixedArray(this.ptr + 40, 4056, Primitive, "char")
            return this.__abParametersProxyArray
        }
    }
}
