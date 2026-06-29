#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.ActiveScript
 */
export default struct DOCUMENTNAMETYPE {
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
    static DOCUMENTNAMETYPE_APPNODE => 0

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTNAMETYPE_TITLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTNAMETYPE_FILE_TAIL => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTNAMETYPE_URL => 3

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTNAMETYPE_UNIQUE_TITLE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOCUMENTNAMETYPE_SOURCE_MAP_URL => 5
}
