#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Stores the token binding information.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/sspi/ns-sspi-sec_token_binding
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SEC_TOKEN_BINDING extends Win32Struct
{
    static sizeof => 6

    static packingSize => 2

    /**
     * The supported major version of the Token Binding protocol.
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * The supported minor version of the Token Binding protocol.
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * The size (in bytes) of the Token Binding key parameter IDs array.
     * @type {Integer}
     */
    KeyParametersSize {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The Token Binding key parameter IDs, most preferred first.
     * @type {Array<Byte>}
     */
    KeyParameters{
        get {
            if(!this.HasProp("__KeyParametersProxyArray"))
                this.__KeyParametersProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__KeyParametersProxyArray
        }
    }
}
