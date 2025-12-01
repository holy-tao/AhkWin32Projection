#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The RTM_ENTITY_METHOD_INPUT structure is used to pass information to a client when invoking its method.
 * @see https://learn.microsoft.com/windows/win32/api/rtmv2/ns-rtmv2-rtm_entity_method_input
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class RTM_ENTITY_METHOD_INPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Specifies the method.
     * @type {Integer}
     */
    MethodType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the size, in bytes, of <b>InputData</b>.
     * @type {Integer}
     */
    InputSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Buffer for input data for the method.
     * @type {Array<Byte>}
     */
    InputData{
        get {
            if(!this.HasProp("__InputDataProxyArray"))
                this.__InputDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__InputDataProxyArray
        }
    }
}
