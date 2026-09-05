#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the DCOM protocol handler to specify how impersonation is done on the server.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_destinationoptions_impersonationtype
 * @namespace Windows.Win32.System.Wmi
 */
class MI_DestinationOptions_ImpersonationType extends Win32Enum {

    /**
     * Use the default impersonation.
     * Native name: MI_DestinationOptions_ImpersonationType_Default
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * Do not impersonate.
     * Native name: MI_DestinationOptions_ImpersonationType_None
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Identify user only.
     * Native name: MI_DestinationOptions_ImpersonationType_Identify
     * @type {Integer (Int32)}
     */
    static Identify => 2

    /**
     * Allow impersonation of user.
     * Native name: MI_DestinationOptions_ImpersonationType_Impersonate
     * @type {Integer (Int32)}
     */
    static Impersonate => 3

    /**
     * This option relates to Kerberos delegation and needs to be enabled on the domain.
     * Native name: MI_DestinationOptions_ImpersonationType_Delegate
     * @type {Integer (Int32)}
     */
    static Delegate => 4
}
