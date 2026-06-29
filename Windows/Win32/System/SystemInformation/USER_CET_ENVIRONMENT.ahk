#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemInformation
 */
export default struct USER_CET_ENVIRONMENT {
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
    static USER_CET_ENVIRONMENT_WIN32_PROCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_SGX2_ENCLAVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_VBS_ENCLAVE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static USER_CET_ENVIRONMENT_VBS_BASIC_ENCLAVE => 17
}
