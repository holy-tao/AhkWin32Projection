#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates which features are supported by the WDS TFTP server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_tftp_capability
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_TFTP_CAPABILITY{

    /**
     * Indicates that the maximum block size used by the server can be configured.
     * @type {Integer (Int32)}
     */
    static WdsTptTftpCapMaximumBlockSize => 1

    /**
     * Indicates that the server supports variable-window TFTP extension.
     * @type {Integer (Int32)}
     */
    static WdsTptTftpCapVariableWindow => 2
}
