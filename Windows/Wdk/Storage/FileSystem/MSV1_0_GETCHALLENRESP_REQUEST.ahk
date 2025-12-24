#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class MSV1_0_GETCHALLENRESP_REQUEST extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ParameterControl {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(8, this)
            return this.__LogonId
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := UNICODE_STRING(16, this)
            return this.__Password
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ChallengeToClient{
        get {
            if(!this.HasProp("__ChallengeToClientProxyArray"))
                this.__ChallengeToClientProxyArray := Win32FixedArray(this.ptr + 32, 8, Primitive, "char")
            return this.__ChallengeToClientProxyArray
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := UNICODE_STRING(40, this)
            return this.__UserName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := UNICODE_STRING(56, this)
            return this.__LogonDomainName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    ServerName{
        get {
            if(!this.HasProp("__ServerName"))
                this.__ServerName := UNICODE_STRING(72, this)
            return this.__ServerName
        }
    }
}
