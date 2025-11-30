#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class MSV1_0_GETUSERINFO_RESPONSE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PSID}
     */
    UserSid {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {UNICODE_STRING}
     */
    UserName{
        get {
            if(!this.HasProp("__UserName"))
                this.__UserName := UNICODE_STRING(16, this)
            return this.__UserName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    LogonDomainName{
        get {
            if(!this.HasProp("__LogonDomainName"))
                this.__LogonDomainName := UNICODE_STRING(32, this)
            return this.__LogonDomainName
        }
    }

    /**
     * @type {UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := UNICODE_STRING(48, this)
            return this.__LogonServer
        }
    }

    /**
     * @type {Integer}
     */
    LogonType {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }
}
