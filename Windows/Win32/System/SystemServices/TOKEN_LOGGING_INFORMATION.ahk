#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\TOKEN_ELEVATION.ahk
#Include ..\..\Security\PSID.ahk
#Include ..\..\Security\SID_AND_ATTRIBUTES.ahk
#Include ..\..\Foundation\LUID.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TOKEN_LOGGING_INFORMATION extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Integer}
     */
    TokenType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {TOKEN_ELEVATION}
     */
    TokenElevation{
        get {
            if(!this.HasProp("__TokenElevation"))
                this.__TokenElevation := TOKEN_ELEVATION(this.ptr + 4)
            return this.__TokenElevation
        }
    }

    /**
     * @type {Integer}
     */
    TokenElevationType {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ImpersonationLevel {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    IntegrityLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {SID_AND_ATTRIBUTES}
     */
    User{
        get {
            if(!this.HasProp("__User"))
                this.__User := SID_AND_ATTRIBUTES(this.ptr + 24)
            return this.__User
        }
    }

    /**
     * @type {PSID}
     */
    TrustLevelSid{
        get {
            if(!this.HasProp("__TrustLevelSid"))
                this.__TrustLevelSid := PSID(this.ptr + 40)
            return this.__TrustLevelSid
        }
    }

    /**
     * @type {Integer}
     */
    SessionId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    AppContainerNumber {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * @type {LUID}
     */
    AuthenticationId{
        get {
            if(!this.HasProp("__AuthenticationId"))
                this.__AuthenticationId := LUID(this.ptr + 56)
            return this.__AuthenticationId
        }
    }

    /**
     * @type {Integer}
     */
    GroupCount {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * @type {Integer}
     */
    GroupsLength {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Pointer<SID_AND_ATTRIBUTES>}
     */
    Groups {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }
}
