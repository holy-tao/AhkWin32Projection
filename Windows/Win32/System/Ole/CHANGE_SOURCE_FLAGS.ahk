#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct CHANGE_SOURCE_FLAGS {
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
    static CSF_SHOWHELP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_VALIDSOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_ONLYGETSOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSF_EXPLORER => 8
}
