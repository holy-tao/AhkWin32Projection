#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct ACTIVATEOPTIONS {
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
    static AO_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static AO_DESIGNMODE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AO_NOERRORUI => 2

    /**
     * @type {Integer (Int32)}
     */
    static AO_NOSPLASHSCREEN => 4

    /**
     * @type {Integer (Int32)}
     */
    static AO_PRELAUNCH => 33554432
}
