#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class SECURE_BUFFER_INFO extends Win32Struct {
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Guid}
     */
    guidBufferIdentifier {
        get {
            if(!this.HasProp("__guidBufferIdentifier"))
                this.__guidBufferIdentifier := Guid(0, this)
            return this.__guidBufferIdentifier
        }
    }

    /**
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    cbCaptured {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Integer>}
     */
    ullReserved {
        get {
            if(!this.HasProp("__ullReservedProxyArray"))
                this.__ullReservedProxyArray := Win32FixedArray(this.ptr + 24, 16, Primitive, "uint")
            return this.__ullReservedProxyArray
        }
    }
}
