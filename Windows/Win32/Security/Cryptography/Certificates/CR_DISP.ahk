#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct CR_DISP {
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
    static CR_DISP_DENIED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_INCOMPLETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ISSUED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_ISSUED_OUT_OF_BAND => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_UNDER_SUBMISSION => 5
}
