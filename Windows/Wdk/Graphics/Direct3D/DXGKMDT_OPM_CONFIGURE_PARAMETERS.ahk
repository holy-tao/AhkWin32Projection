#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGKMDT_OPM_CONFIGURE_PARAMETERS extends Win32Struct {
    static sizeof => 4088

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    omac {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    guidSetting {
        get {
            if(!this.HasProp("__guidSetting"))
                this.__guidSetting := Guid(8, this)
            return this.__guidSetting
        }
    }

    /**
     * @type {Integer}
     */
    ulSequenceNumber {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    cbParametersSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Integer>}
     */
    abParameters {
        get {
            if(!this.HasProp("__abParametersProxyArray"))
                this.__abParametersProxyArray := Win32FixedArray(this.ptr + 32, 4056, Primitive, "char")
            return this.__abParametersProxyArray
        }
    }
}
