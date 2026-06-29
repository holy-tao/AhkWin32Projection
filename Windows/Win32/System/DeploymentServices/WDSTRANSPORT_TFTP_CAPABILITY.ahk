#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates which features are supported by the WDS TFTP server.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_tftp_capability
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDSTRANSPORT_TFTP_CAPABILITY {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
