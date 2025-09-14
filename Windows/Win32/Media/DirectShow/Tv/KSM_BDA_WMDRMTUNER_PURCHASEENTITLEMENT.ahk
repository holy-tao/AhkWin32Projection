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
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod{
        get {
            if(!this.HasProp("__NodeMethod"))
                this.__NodeMethod := KSM_NODE(this.ptr + 0)
            return this.__NodeMethod
        }
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Array<SByte>}
     */
    cLanguage{
        get {
            if(!this.HasProp("__cLanguageProxyArray"))
                this.__cLanguageProxyArray := Win32FixedArray(this.ptr + 20, 12, Primitive, "char")
            return this.__cLanguageProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulPurchaseTokenLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Byte>}
     */
    argbDataBuffer{
        get {
            if(!this.HasProp("__argbDataBufferProxyArray"))
                this.__argbDataBufferProxyArray := Win32FixedArray(this.ptr + 36, 1, Primitive, "char")
            return this.__argbDataBufferProxyArray
        }
    }
}
