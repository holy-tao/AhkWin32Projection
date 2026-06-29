#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_NO_AUTH => 2
}
