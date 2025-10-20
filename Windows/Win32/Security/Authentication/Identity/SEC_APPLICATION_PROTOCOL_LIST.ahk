#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_application_protocol_list
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_APPLICATION_PROTOCOL_LIST extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ProtoNegoExt {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ProtocolListSize {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    ProtocolList{
        get {
            if(!this.HasProp("__ProtocolListProxyArray"))
                this.__ProtocolListProxyArray := Win32FixedArray(this.ptr + 6, 1, Primitive, "char")
            return this.__ProtocolListProxyArray
        }
    }
}
