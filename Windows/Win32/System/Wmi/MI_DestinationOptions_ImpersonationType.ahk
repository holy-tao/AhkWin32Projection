#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by the DCOM protocol handler to specify how impersonation is done on the server.
 * @see https://docs.microsoft.com/windows/win32/api//mi/ne-mi-mi_destinationoptions_impersonationtype
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class MI_DestinationOptions_ImpersonationType extends Win32Enum{

    /**
     * Use the default impersonation.
     * @type {Integer (Int32)}
     */
    static MI_DestinationOptions_ImpersonationType_Default => 0

    /**
     * Do not impersonate.
     * @type {Integer (Int32)}
     */
    static MI_DestinationOptions_ImpersonationType_None => 1

    /**
     * Identify user only.
     * @type {Integer (Int32)}
     */
    static MI_DestinationOptions_ImpersonationType_Identify => 2

    /**
     * Allow impersonation of user.
     * @type {Integer (Int32)}
     */
    static MI_DestinationOptions_ImpersonationType_Impersonate => 3

    /**
     * This option relates to Kerberos delegation and needs to be enabled on the domain.
     * @type {Integer (Int32)}
     */
    static MI_DestinationOptions_ImpersonationType_Delegate => 4
}
