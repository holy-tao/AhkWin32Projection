#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_COPPCommand extends Win32Struct {
    static sizeof => 4080

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    macKDI {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    guidCommandID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwSequence {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbSizeData {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    CommandData {
        get {
            if(!this.HasProp("__CommandDataProxyArray"))
                this.__CommandDataProxyArray := Win32FixedArray(this.ptr + 24, 4056, Primitive, "char")
            return this.__CommandDataProxyArray
        }
    }
}
