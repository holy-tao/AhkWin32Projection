#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the DCOM protocol handler to specify how impersonation is done on the server.
 * @see https://learn.microsoft.com/windows/win32/api/mi/ne-mi-mi_destinationoptions_impersonationtype
 * @namespace Windows.Win32.System.Wmi
 */
export default struct MI_DestinationOptions_ImpersonationType {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
