#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_COPPCommand extends Win32Struct {
    static sizeof => 4096

    static packingSize => 4

    /**
     * @type {Guid}
     */
    macKDI {
        get {
            if(!this.HasProp("__macKDI"))
                this.__macKDI := Guid(0, this)
            return this.__macKDI
        }
    }

    /**
     * @type {Guid}
     */
    guidCommandID {
        get {
            if(!this.HasProp("__guidCommandID"))
                this.__guidCommandID := Guid(16, this)
            return this.__guidCommandID
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
    CommandData {
        get {
            if(!this.HasProp("__CommandDataProxyArray"))
                this.__CommandDataProxyArray := Win32FixedArray(this.ptr + 40, 4056, Primitive, "char")
            return this.__CommandDataProxyArray
        }
    }
}
