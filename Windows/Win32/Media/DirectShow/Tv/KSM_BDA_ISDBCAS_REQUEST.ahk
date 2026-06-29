#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk
#Include ..\..\KernelStreaming\KSM_NODE.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_ISDBCAS_REQUEST extends Win32Struct {
    static sizeof => 48

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
    ulRequestID {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulIsdbCommandSize {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    argbIsdbCommandData {
        get {
            if(!this.HasProp("__argbIsdbCommandDataProxyArray"))
                this.__argbIsdbCommandDataProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__argbIsdbCommandDataProxyArray
        }
    }
}
