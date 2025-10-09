#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_CAS_CAPTURETOKEN extends Win32Struct
{
    static sizeof => 32

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
    ulTokenLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Array<Byte>}
     */
    argbToken{
        get {
            if(!this.HasProp("__argbTokenProxyArray"))
                this.__argbTokenProxyArray := Win32FixedArray(this.ptr + 28, 1, Primitive, "char")
            return this.__argbTokenProxyArray
        }
    }
}
