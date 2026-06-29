#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CSBACKUP_TYPE {
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
    static CSBACKUP_TYPE_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSBACKUP_TYPE_LOGS_ONLY => 2
}
