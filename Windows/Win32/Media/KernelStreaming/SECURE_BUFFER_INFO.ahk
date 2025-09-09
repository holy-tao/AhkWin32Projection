#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class SECURE_BUFFER_INFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
     */
    guidBufferIdentifier {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    cbBufferSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    cbCaptured {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<UInt64>}
     */
    ullReserved{
        get {
            if(!this.HasProp("__ullReservedProxyArray"))
                this.__ullReservedProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "uint")
            return this.__ullReservedProxyArray
        }
    }
}
