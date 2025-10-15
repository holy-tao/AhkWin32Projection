#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * ENHANCED_STORAGE_PASSWORD_SILO_INFORMATION structure contains data that defines the capabilities and requirements of a password silo.
 * @see https://docs.microsoft.com/windows/win32/api//ehstorextensions/ns-ehstorextensions-enhanced_storage_password_silo_information
 * @namespace Windows.Win32.Storage.EnhancedStorage
 * @version v4.0.30319
 */
class ENHANCED_STORAGE_PASSWORD_SILO_INFORMATION extends Win32Struct
{
    static sizeof => 72

    static packingSize => 4

    /**
     * This is the current number of consecutive unsuccessful authentication attempts using administrator password. This value is reset to 0 after a successful authentication.
     * @type {Integer}
     */
    CurrentAdminFailures {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * This is the current number of consecutive unsuccessful authentication attempts using user password. This value is reset to 0 after a successful authentication.
     * @type {Integer}
     */
    CurrentUserFailures {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * Total number of authentication attempts attempted on this silo using the user password.
     * @type {Integer}
     */
    TotalUserAuthenticationCount {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Total number of authentication attempts attempted on this silo using the administrator password.
     * @type {Integer}
     */
    TotalAdminAuthenticationCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * <b>TRUE</b> if the silo claims compliance with the  Federal Information Processing Standard  (FIPS); otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    FipsCompliant{
        get {
            if(!this.HasProp("__FipsCompliant"))
                this.__FipsCompliant := BOOL(this.ptr + 12)
            return this.__FipsCompliant
        }
    }

    /**
     * <b>TRUE</b> if a device-unique security identifier provided by the manufacturer is available; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    SecurityIDAvailable{
        get {
            if(!this.HasProp("__SecurityIDAvailable"))
                this.__SecurityIDAvailable := BOOL(this.ptr + 16)
            return this.__SecurityIDAvailable
        }
    }

    /**
     * <b>TRUE</b> if an initialization is in progress; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    InitializeInProgress{
        get {
            if(!this.HasProp("__InitializeInProgress"))
                this.__InitializeInProgress := BOOL(this.ptr + 20)
            return this.__InitializeInProgress
        }
    }

    /**
     * <b>TRUE</b> if the silo is set to prepare for initalization to the default state set by the manufacturer; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    ITMSArmed{
        get {
            if(!this.HasProp("__ITMSArmed"))
                this.__ITMSArmed := BOOL(this.ptr + 24)
            return this.__ITMSArmed
        }
    }

    /**
     * <b>TRUE</b> if the silo is capable of initializing to the default state set by the manufacturer; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    ITMSArmable{
        get {
            if(!this.HasProp("__ITMSArmable"))
                this.__ITMSArmable := BOOL(this.ptr + 28)
            return this.__ITMSArmable
        }
    }

    /**
     * <b>TRUE</b> if the user account has been created in the password silo; otherwise, <b>FALSE</b>.
     * @type {BOOL}
     */
    UserCreated{
        get {
            if(!this.HasProp("__UserCreated"))
                this.__UserCreated := BOOL(this.ptr + 32)
            return this.__UserCreated
        }
    }

    /**
     * <b>TRUE</b> if the silo resets Administrator authentication failure count to zero upon power cycle. This is the default behavior for the silo. 
     * If <b>FALSE</b>, the silo will not reset Administrator authentication failure count to zero upon power cycle.
     * @type {BOOL}
     */
    ResetOnPORDefault{
        get {
            if(!this.HasProp("__ResetOnPORDefault"))
                this.__ResetOnPORDefault := BOOL(this.ptr + 36)
            return this.__ResetOnPORDefault
        }
    }

    /**
     * <b>TRUE</b> if the silo is currently set to reset Administrator authentication failure count to zero upon power cycle; Otherwise <b>FALSE</b>. 
     * This configuration is affected by changes introduced by the host or the implementation of factory default settings.
     * @type {BOOL}
     */
    ResetOnPORCurrent{
        get {
            if(!this.HasProp("__ResetOnPORCurrent"))
                this.__ResetOnPORCurrent := BOOL(this.ptr + 40)
            return this.__ResetOnPORCurrent
        }
    }

    /**
     * This is the maximum number of consecutive unsuccessful authentication attempts using administrator password allowed by the silo before it will block the administrator.
     * @type {Integer}
     */
    MaxAdminFailures {
        get => NumGet(this, 44, "char")
        set => NumPut("char", value, this, 44)
    }

    /**
     * This is the maximum number of consecutive unsuccessful authentication attempts using user password allowed by the silo before it will block user.
     * @type {Integer}
     */
    MaxUserFailures {
        get => NumGet(this, 45, "char")
        set => NumPut("char", value, this, 45)
    }

    /**
     * Estimated time (in milliseconds) for the device to complete the initialize to manufacturing function.
     * @type {Integer}
     */
    TimeToCompleteInitialization {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Time remaining (in milliseconds) for the silo to complete the initialize to manufacturing function.  The value of this field is zero if the silo is currently not in the process of initialization.
     * @type {Integer}
     */
    TimeRemainingToCompleteInitialization {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * Minimum time (in milliseconds) the silo will require to complete an authentication operation.
     * @type {Integer}
     */
    MinTimeToAuthenticate {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * This is the maximum number of bytes that the silo supports for administrator password.
     * @type {Integer}
     */
    MaxAdminPasswordSize {
        get => NumGet(this, 60, "char")
        set => NumPut("char", value, this, 60)
    }

    /**
     * This is the minimum number of bytes that the silo requires for administrator password.
     * @type {Integer}
     */
    MinAdminPasswordSize {
        get => NumGet(this, 61, "char")
        set => NumPut("char", value, this, 61)
    }

    /**
     * This is the maximum number of bytes that the silo supports for administrator password hint.
     * @type {Integer}
     */
    MaxAdminHintSize {
        get => NumGet(this, 62, "char")
        set => NumPut("char", value, this, 62)
    }

    /**
     * This is the maximum number of bytes that the silo supports for user password.
     * @type {Integer}
     */
    MaxUserPasswordSize {
        get => NumGet(this, 63, "char")
        set => NumPut("char", value, this, 63)
    }

    /**
     * This is the minimum number of bytes that the silo requires for user password.
     * @type {Integer}
     */
    MinUserPasswordSize {
        get => NumGet(this, 64, "char")
        set => NumPut("char", value, this, 64)
    }

    /**
     * This is the maximum number of bytes that the silo supports for user password hint.
     * @type {Integer}
     */
    MaxUserHintSize {
        get => NumGet(this, 65, "char")
        set => NumPut("char", value, this, 65)
    }

    /**
     * This is the maximum number of bytes that the silo supports for friendly user name.
     * @type {Integer}
     */
    MaxUserNameSize {
        get => NumGet(this, 66, "char")
        set => NumPut("char", value, this, 66)
    }

    /**
     * The maximum number of bytes that the silo supports for  the silo name.
     * @type {Integer}
     */
    MaxSiloNameSize {
        get => NumGet(this, 67, "char")
        set => NumPut("char", value, this, 67)
    }

    /**
     * The maximum number of bytes that the device supports for challenge.
     * @type {Integer}
     */
    MaxChallengeSize {
        get => NumGet(this, 68, "ushort")
        set => NumPut("ushort", value, this, 68)
    }
}
