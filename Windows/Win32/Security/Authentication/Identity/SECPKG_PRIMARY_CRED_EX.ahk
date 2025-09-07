#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\LUID.ahk
#Include .\LSA_UNICODE_STRING.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SECPKG_PRIMARY_CRED_EX extends Win32Struct
{
    static sizeof => 224

    static packingSize => 8

    /**
     * @type {LUID}
     */
    LogonId{
        get {
            if(!this.HasProp("__LogonId"))
                this.__LogonId := LUID(this.ptr + 0)
            return this.__LogonId
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DownlevelName{
        get {
            if(!this.HasProp("__DownlevelName"))
                this.__DownlevelName := LSA_UNICODE_STRING(this.ptr + 8)
            return this.__DownlevelName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DomainName{
        get {
            if(!this.HasProp("__DomainName"))
                this.__DomainName := LSA_UNICODE_STRING(this.ptr + 24)
            return this.__DomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Password{
        get {
            if(!this.HasProp("__Password"))
                this.__Password := LSA_UNICODE_STRING(this.ptr + 40)
            return this.__Password
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    OldPassword{
        get {
            if(!this.HasProp("__OldPassword"))
                this.__OldPassword := LSA_UNICODE_STRING(this.ptr + 56)
            return this.__OldPassword
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    UserSid {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    DnsDomainName{
        get {
            if(!this.HasProp("__DnsDomainName"))
                this.__DnsDomainName := LSA_UNICODE_STRING(this.ptr + 88)
            return this.__DnsDomainName
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Upn{
        get {
            if(!this.HasProp("__Upn"))
                this.__Upn := LSA_UNICODE_STRING(this.ptr + 104)
            return this.__Upn
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    LogonServer{
        get {
            if(!this.HasProp("__LogonServer"))
                this.__LogonServer := LSA_UNICODE_STRING(this.ptr + 120)
            return this.__LogonServer
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Spare1{
        get {
            if(!this.HasProp("__Spare1"))
                this.__Spare1 := LSA_UNICODE_STRING(this.ptr + 136)
            return this.__Spare1
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Spare2{
        get {
            if(!this.HasProp("__Spare2"))
                this.__Spare2 := LSA_UNICODE_STRING(this.ptr + 152)
            return this.__Spare2
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Spare3{
        get {
            if(!this.HasProp("__Spare3"))
                this.__Spare3 := LSA_UNICODE_STRING(this.ptr + 168)
            return this.__Spare3
        }
    }

    /**
     * @type {LSA_UNICODE_STRING}
     */
    Spare4{
        get {
            if(!this.HasProp("__Spare4"))
                this.__Spare4 := LSA_UNICODE_STRING(this.ptr + 184)
            return this.__Spare4
        }
    }

    /**
     * @type {Pointer}
     */
    PackageId {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {LUID}
     */
    PrevLogonId{
        get {
            if(!this.HasProp("__PrevLogonId"))
                this.__PrevLogonId := LUID(this.ptr + 208)
            return this.__PrevLogonId
        }
    }

    /**
     * @type {Integer}
     */
    FlagsEx {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }
}
