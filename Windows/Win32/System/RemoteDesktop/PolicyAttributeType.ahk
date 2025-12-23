#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the redirection settings associated with a connection.
 * @see https://learn.microsoft.com/windows/win32/api/tsgpolicyengine/ne-tsgpolicyengine-policyattributetype
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class PolicyAttributeType extends Win32Enum{

    /**
     * Enable device redirection for all devices.
     * @type {Integer (Int32)}
     */
    static EnableAllRedirections => 0

    /**
     * Disable device redirection for all devices.
     * @type {Integer (Int32)}
     */
    static DisableAllRedirections => 1

    /**
     * Disable drive redirection.
     * @type {Integer (Int32)}
     */
    static DriveRedirectionDisabled => 2

    /**
     * Disable printer redirection.
     * @type {Integer (Int32)}
     */
    static PrinterRedirectionDisabled => 3

    /**
     * Disable port redirection.
     * @type {Integer (Int32)}
     */
    static PortRedirectionDisabled => 4

    /**
     * Disable clipboard redirection.
     * @type {Integer (Int32)}
     */
    static ClipboardRedirectionDisabled => 5

    /**
     * Disable Plug and Play device redirection.
     * @type {Integer (Int32)}
     */
    static PnpRedirectionDisabled => 6

    /**
     * Only allow connections to servers that support secure device redirection.
     * @type {Integer (Int32)}
     */
    static AllowOnlySDRServers => 7
}
