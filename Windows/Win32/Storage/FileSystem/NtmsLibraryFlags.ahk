#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct NtmsLibraryFlags {
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
    static NTMS_LIBRARYFLAG_FIXEDOFFLINE => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_CLEANERPRESENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_AUTODETECTCHANGE => 4

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_IGNORECLEANERUSESREMAINING => 8

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_LIBRARYFLAG_RECOGNIZECLEANERBARCODE => 16
}
