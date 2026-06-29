#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct LZOPENFILE_STYLE {
    value : UInt16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt16)}
     */
    static OF_CANCEL => 2048

    /**
     * @type {Integer (UInt16)}
     */
    static OF_CREATE => 4096

    /**
     * @type {Integer (UInt16)}
     */
    static OF_DELETE => 512

    /**
     * @type {Integer (UInt16)}
     */
    static OF_EXIST => 16384

    /**
     * @type {Integer (UInt16)}
     */
    static OF_PARSE => 256

    /**
     * @type {Integer (UInt16)}
     */
    static OF_PROMPT => 8192

    /**
     * @type {Integer (UInt16)}
     */
    static OF_READ => 0

    /**
     * @type {Integer (UInt16)}
     */
    static OF_READWRITE => 2

    /**
     * @type {Integer (UInt16)}
     */
    static OF_REOPEN => 32768

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_NONE => 64

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_READ => 48

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_DENY_WRITE => 32

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_EXCLUSIVE => 16

    /**
     * @type {Integer (UInt16)}
     */
    static OF_WRITE => 1

    /**
     * @type {Integer (UInt16)}
     */
    static OF_SHARE_COMPAT => 0

    /**
     * @type {Integer (UInt16)}
     */
    static OF_VERIFY => 1024
}
