#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct EMBDHLP_FLAGS {
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
    static EMBDHLP_INPROC_HANDLER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMBDHLP_INPROC_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EMBDHLP_CREATENOW => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EMBDHLP_DELAYCREATE => 65536
}
