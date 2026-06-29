#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Communication
 */
export default struct ESCAPE_COMM_FUNCTION {
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
    static CLRBREAK => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CLRDTR => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CLRRTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SETBREAK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SETDTR => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SETRTS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SETXOFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SETXON => 2
}
