#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include ..\..\Credentials\SecHandle.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class KERB_SETPASSWORD_EX_REQUEST extends Win32Struct
{
    static sizeof => 152

    static packingSize => 8

    /**
     * @type {Integer}
     */
    MessageType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(4, this)
            return this.__LogonId
        }
    }

    /**
     * @type {SecHandle}
     */
    CredentialsHandle{
        get {
            if(!this.HasProp("__CredentialsHandle"))
                this.__CredentialsHandle := SecHandle(16, this)
            return this.__CredentialsHandle
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    AccountRealm{
        get {
            if(!this.HasProp("__AccountRealm"))
                this.__AccountRealm := LSA_UNICODE_STRING(40, this)
            return this.__AccountRealm
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    AccountName{
        get {
            if(!this.HasProp("__AccountName"))
                this.__AccountName := LSA_UNICODE_STRING(56, this)
            return this.__AccountName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(72, this)
            return this.__Password
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ClientRealm{
        get {
            if(!this.HasProp("__ClientRealm"))
                this.__ClientRealm := LSA_UNICODE_STRING(88, this)
            return this.__ClientRealm
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    ClientName{
        get {
            if(!this.HasProp("__ClientName"))
                this.__ClientName := LSA_UNICODE_STRING(104, this)
            return this.__ClientName
        }
    }

    /**
     * @type {BOOLEAN}
     */
    Impersonating {
        get => NumGet(this, 120, "char")
        set => NumPut("char", value, this, 120)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    KdcAddress{
        get {
            if(!this.HasProp("__KdcAddress"))
                this.__KdcAddress := LSA_UNICODE_STRING(128, this)
            return this.__KdcAddress
        }
    }

    /**
     * @type {Integer}
     */
    KdcAddressType {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }
}
