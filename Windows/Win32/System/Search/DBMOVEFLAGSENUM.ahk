#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBMOVEFLAGSENUM {
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
    static DBMOVE_REPLACE_EXISTING => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ASYNC => 256

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_DONT_UPDATE_LINKS => 512

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ALLOW_EMULATION => 1024

    /**
     * @type {Integer (Int32)}
     */
    static DBMOVE_ATOMIC => 4096
}
