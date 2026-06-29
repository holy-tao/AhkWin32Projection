#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsOpRequestFlags {
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
    static NTMS_OPREQFLAGS_NOAUTOPURGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOFAILEDPURGE => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOALERTS => 16

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_OPREQFLAGS_NOTRAYICON => 32
}
