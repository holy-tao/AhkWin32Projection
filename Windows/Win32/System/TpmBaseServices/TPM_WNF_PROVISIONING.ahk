#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.TpmBaseServices
 * @version v4.0.30319
 */
class TPM_WNF_PROVISIONING extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * @type {Integer}
     */
    status {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    message{
        get {
            if(!this.HasProp("__messageProxyArray"))
                this.__messageProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__messageProxyArray
        }
    }
}
