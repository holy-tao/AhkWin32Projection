#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ole
 */
export default struct XFORMCOORDS {
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
    static XFORMCOORDS_POSITION => 1

    /**
     * @type {Integer (Int32)}
     */
    static XFORMCOORDS_SIZE => 2

    /**
     * @type {Integer (Int32)}
     */
    static XFORMCOORDS_HIMETRICTOCONTAINER => 4

    /**
     * @type {Integer (Int32)}
     */
    static XFORMCOORDS_CONTAINERTOHIMETRIC => 8

    /**
     * @type {Integer (Int32)}
     */
    static XFORMCOORDS_EVENTCOMPAT => 16
}
