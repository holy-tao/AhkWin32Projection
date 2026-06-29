#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct DBBINDURLFLAGENUM {
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
    static DBBINDURLFLAG_READ => 1

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_WRITE => 2

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_READWRITE => 3

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_SHARE_DENY_READ => 4

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_SHARE_DENY_WRITE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_SHARE_EXCLUSIVE => 12

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_SHARE_DENY_NONE => 16

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_ASYNCHRONOUS => 4096

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_COLLECTION => 8192

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_DELAYFETCHSTREAM => 16384

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_DELAYFETCHCOLUMNS => 32768

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_RECURSIVE => 4194304

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_OUTPUT => 8388608

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_WAITFORINIT => 16777216

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_OPENIFEXISTS => 33554432

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_OVERWRITE => 67108864

    /**
     * @type {Integer (Int32)}
     */
    static DBBINDURLFLAG_ISSTRUCTUREDDOCUMENT => 134217728
}
