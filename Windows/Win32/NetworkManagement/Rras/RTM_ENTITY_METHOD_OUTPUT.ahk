#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_ENTITY_METHOD_OUTPUT structure is used to pass information to the calling client when the routing table manager invokes a method.
 * @see https://docs.microsoft.com/windows/win32/api//rtmv2/ns-rtmv2-rtm_entity_method_output
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ENTITY_METHOD_OUTPUT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Specifies the method identifier.
     * @type {Integer}
     */
    MethodType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Receives the status of the method after execution.
     * @type {Integer}
     */
    MethodStatus {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the size, in bytes, of <b>OutputData</b>.
     * @type {Integer}
     */
    OutputSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Buffer for data returned by the method.
     * @type {Array<Byte>}
     */
    OutputData{
        get {
            if(!this.HasProp("__OutputDataProxyArray"))
                this.__OutputDataProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__OutputDataProxyArray
        }
    }
}
