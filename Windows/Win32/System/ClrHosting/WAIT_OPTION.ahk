#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct WAIT_OPTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_MSGPUMP => 1

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_ALERTABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WAIT_NOTINDEADLOCK => 4
}
