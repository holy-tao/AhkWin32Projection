#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct MEDIA_TYPES {
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
    static MEDIA_CDDA_CDROM => 1

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_ROM_XA => 2

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_I => 3

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_EXTRA => 4

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_CD_OTHER => 5

    /**
     * @type {Integer (Int32)}
     */
    static MEDIA_SPECIAL => 6
}
