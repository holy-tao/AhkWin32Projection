#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
export default struct IMMPID_MPV_ENUM {
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
    static IMMPID_MPV_BEFORE__ => 12287

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_STORE_DRIVER_HANDLE => 12288

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_MESSAGE_CREATION_FLAGS => 12289

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_MESSAGE_OPEN_HANDLES => 12290

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_TOTAL_OPEN_HANDLES => 12291

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_TOTAL_OPEN_PROPERTY_STREAM_HANDLES => 12292

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_TOTAL_OPEN_CONTENT_HANDLES => 12293

    /**
     * @type {Integer (Int32)}
     */
    static IMMPID_MPV_AFTER__ => 12294
}
