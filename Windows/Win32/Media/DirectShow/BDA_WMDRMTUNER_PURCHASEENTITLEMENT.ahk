#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class BDA_WMDRMTUNER_PURCHASEENTITLEMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    lResult {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ulDescrambleStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ulCaptureTokenLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Array<Byte>}
     */
    argbCaptureTokenBuffer{
        get {
            if(!this.HasProp("__argbCaptureTokenBufferProxyArray"))
                this.__argbCaptureTokenBufferProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__argbCaptureTokenBufferProxyArray
        }
    }
}
