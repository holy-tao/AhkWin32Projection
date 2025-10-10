#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The PARAM_BUFFER structure describes the format of the parameter buffer that can be included in the CONTROL_SERVICE structure.
 * @see https://docs.microsoft.com/windows/win32/api//qossp/ns-qossp-param_buffer
 * @namespace Windows.Win32.NetworkManagement.QoS
 * @version v4.0.30319
 */
class PARAM_BUFFER extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Parameter ID, as defined by INTSERV.
     * @type {Integer}
     */
    ParameterId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Length of the entire <b>PARAM_BUFFER</b> structure.
     * @type {Integer}
     */
    Length {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Buffer containing the parameter.
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
