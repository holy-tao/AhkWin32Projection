#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_WMDRMTUNER_PURCHASEENTITLEMENT extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod{
        get {
            if(!this.HasProp("__NodeMethod"))
                this.__NodeMethod := KSM_NODE(0, this)
            return this.__NodeMethod
        }
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 28, 11, "UTF-16")
        set => StrPut(value, this.ptr + 28, 11, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ulPurchaseTokenLength {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {Array<Byte>}
     */
    argbDataBuffer{
        get {
            if(!this.HasProp("__argbDataBufferProxyArray"))
                this.__argbDataBufferProxyArray := Win32FixedArray(this.ptr + 56, 1, Primitive, "char")
            return this.__argbDataBufferProxyArray
        }
    }
}
