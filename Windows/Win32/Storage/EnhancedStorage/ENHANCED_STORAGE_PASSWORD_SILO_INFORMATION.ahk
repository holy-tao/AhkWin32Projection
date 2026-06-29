#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * ENHANCED_STORAGE_PASSWORD_SILO_INFORMATION structure contains data that defines the capabilities and requirements of a password silo.
 * @see https://learn.microsoft.com/windows/win32/api/ehstorextensions/ns-ehstorextensions-enhanced_storage_password_silo_information
 * @namespace Windows.Win32.Storage.EnhancedStorage
 */
export default struct ENHANCED_STORAGE_PASSWORD_SILO_INFORMATION {
    #StructPack 4

    /**
     * This is the current number of consecutive unsuccessful authentication attempts using administrator password. This value is reset to 0 after a successful authentication.
     */
    CurrentAdminFailures : Int8

    /**
     * This is the current number of consecutive unsuccessful authentication attempts using user password. This value is reset to 0 after a successful authentication.
     */
    CurrentUserFailures : Int8

    /**
     * Total number of authentication attempts attempted on this silo using the user password.
     */
    TotalUserAuthenticationCount : UInt32

    /**
     * Total number of authentication attempts attempted on this silo using the administrator password.
     */
    TotalAdminAuthenticationCount : UInt32

    /**
     * <b>TRUE</b> if the silo claims compliance with the  Federal Information Processing Standard  (FIPS); otherwise, <b>FALSE</b>.
     */
    FipsCompliant : BOOL

    /**
     * <b>TRUE</b> if a device-unique security identifier provided by the manufacturer is available; otherwise, <b>FALSE</b>.
     */
    SecurityIDAvailable : BOOL

    /**
     * <b>TRUE</b> if an initialization is in progress; otherwise, <b>FALSE</b>.
     */
    InitializeInProgress : BOOL

    /**
     * <b>TRUE</b> if the silo is set to prepare for initialization to the default state set by the manufacturer; otherwise, <b>FALSE</b>.
     */
    ITMSArmed : BOOL

    /**
     * <b>TRUE</b> if the silo is capable of initializing to the default state set by the manufacturer; otherwise, <b>FALSE</b>.
     */
    ITMSArmable : BOOL

    /**
     * <b>TRUE</b> if the user account has been created in the password silo; otherwise, <b>FALSE</b>.
     */
    UserCreated : BOOL

    /**
     * <b>TRUE</b> if the silo resets Administrator authentication failure count to zero upon power cycle. This is the default behavior for the silo. 
     * If <b>FALSE</b>, the silo will not reset Administrator authentication failure count to zero upon power cycle.
     */
    ResetOnPORDefault : BOOL

    /**
     * <b>TRUE</b> if the silo is currently set to reset Administrator authentication failure count to zero upon power cycle; Otherwise <b>FALSE</b>. 
     * This configuration is affected by changes introduced by the host or the implementation of factory default settings.
     */
    ResetOnPORCurrent : BOOL

    /**
     * This is the maximum number of consecutive unsuccessful authentication attempts using administrator password allowed by the silo before it will block the administrator.
     */
    MaxAdminFailures : Int8

    /**
     * This is the maximum number of consecutive unsuccessful authentication attempts using user password allowed by the silo before it will block user.
     */
    MaxUserFailures : Int8

    /**
     * Estimated time (in milliseconds) for the device to complete the initialize to manufacturing function.
     */
    TimeToCompleteInitialization : UInt32

    /**
     * Time remaining (in milliseconds) for the silo to complete the initialize to manufacturing function.  The value of this field is zero if the silo is currently not in the process of initialization.
     */
    TimeRemainingToCompleteInitialization : UInt32

    /**
     * Minimum time (in milliseconds) the silo will require to complete an authentication operation.
     */
    MinTimeToAuthenticate : UInt32

    /**
     * This is the maximum number of bytes that the silo supports for administrator password.
     */
    MaxAdminPasswordSize : Int8

    /**
     * This is the minimum number of bytes that the silo requires for administrator password.
     */
    MinAdminPasswordSize : Int8

    /**
     * This is the maximum number of bytes that the silo supports for administrator password hint.
     */
    MaxAdminHintSize : Int8

    /**
     * This is the maximum number of bytes that the silo supports for user password.
     */
    MaxUserPasswordSize : Int8

    /**
     * This is the minimum number of bytes that the silo requires for user password.
     */
    MinUserPasswordSize : Int8

    /**
     * This is the maximum number of bytes that the silo supports for user password hint.
     */
    MaxUserHintSize : Int8

    /**
     * This is the maximum number of bytes that the silo supports for friendly user name.
     */
    MaxUserNameSize : Int8

    /**
     * The maximum number of bytes that the silo supports for  the silo name.
     */
    MaxSiloNameSize : Int8

    /**
     * The maximum number of bytes that the device supports for challenge.
     */
    MaxChallengeSize : UInt16

}
