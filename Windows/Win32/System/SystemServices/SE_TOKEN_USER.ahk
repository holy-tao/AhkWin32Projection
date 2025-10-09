#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\SID_AND_ATTRIBUTES.ahk
#Include ..\..\Security\TOKEN_USER.ahk
#Include ..\..\Security\SID_IDENTIFIER_AUTHORITY.ahk
#Include ..\..\Security\SID.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class SE_TOKEN_USER extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {TOKEN_USER}
     */
    TokenUser{
        get {
            if(!this.HasProp("__TokenUser"))
                this.__TokenUser := TOKEN_USER(this.ptr + 0)
            return this.__TokenUser
        }
    }

    /**
     * @type {SID_AND_ATTRIBUTES}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := SID_AND_ATTRIBUTES(this.ptr + 0)
            return this.__User
        }
    }

    /**
     * @type {SID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := SID(this.ptr + 16)
            return this.__Sid
        }
    }

    /**
     * @type {Array<Byte>}
     */
    Buffer{
        get {
            if(!this.HasProp("__BufferProxyArray"))
                this.__BufferProxyArray := Win32FixedArray(this.ptr + 16, 68, Primitive, "char")
            return this.__BufferProxyArray
        }
    }
}
