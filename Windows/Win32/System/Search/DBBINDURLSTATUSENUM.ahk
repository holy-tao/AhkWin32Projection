#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBBINDURLSTATUSENUM {
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
    static DBBINDURLSTATUS_S_OK => 0

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_DENYNOTSUPPORTED => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_DENYTYPENOTSUPPORTED => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLSTATUS_S_REDIRECTED => 8
}
