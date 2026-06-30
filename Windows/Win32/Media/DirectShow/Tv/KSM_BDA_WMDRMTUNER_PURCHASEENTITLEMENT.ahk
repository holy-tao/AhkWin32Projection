#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_WMDRMTUNER_PURCHASEENTITLEMENT extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {KSM_NODE}
     */
    NodeMethod {
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
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 36, 11, "UTF-8")
        set => StrPut(value, this.ptr + 36, 11, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    ulPurchaseTokenLength {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Array<Integer>}
     */
    argbDataBuffer {
        get {
            if(!this.HasProp("__argbDataBufferProxyArray"))
                this.__argbDataBufferProxyArray := Win32FixedArray(this.ptr + 52, 1, Primitive, "char")
            return this.__argbDataBufferProxyArray
        }
    }
}
