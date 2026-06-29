#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_COPPStatusInput extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * @type {Guid}
     */
    rApp {
        get {
            if(!this.HasProp("__rApp"))
                this.__rApp := Guid(0, this)
            return this.__rApp
        }
    }

    /**
     * @type {Guid}
     */
    guidStatusRequestID {
        get {
            if(!this.HasProp("__guidStatusRequestID"))
                this.__guidStatusRequestID := Guid(16, this)
            return this.__guidStatusRequestID
        }
    }

    /**
     * @type {Integer}
     */
    dwSequence {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    StatusData {
        get {
            if(!this.HasProp("__StatusDataProxyArray"))
                this.__StatusDataProxyArray := Win32FixedArray(this.ptr + 40, 4056, Primitive, "char")
            return this.__StatusDataProxyArray
        }
    }
}
