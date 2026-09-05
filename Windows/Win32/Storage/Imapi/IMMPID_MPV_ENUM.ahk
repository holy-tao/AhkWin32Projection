#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Imapi
 */
class IMMPID_MPV_ENUM extends Win32Enum {

    /**
     * Native name: IMMPID_MPV_BEFORE__
     * @type {Integer (Int32)}
     */
    static BEFORE__ => 12287

    /**
     * Native name: IMMPID_MPV_STORE_DRIVER_HANDLE
     * @type {Integer (Int32)}
     */
    static STORE_DRIVER_HANDLE => 12288

    /**
     * Native name: IMMPID_MPV_MESSAGE_CREATION_FLAGS
     * @type {Integer (Int32)}
     */
    static MESSAGE_CREATION_FLAGS => 12289

    /**
     * Native name: IMMPID_MPV_MESSAGE_OPEN_HANDLES
     * @type {Integer (Int32)}
     */
    static MESSAGE_OPEN_HANDLES => 12290

    /**
     * Native name: IMMPID_MPV_TOTAL_OPEN_HANDLES
     * @type {Integer (Int32)}
     */
    static TOTAL_OPEN_HANDLES => 12291

    /**
     * Native name: IMMPID_MPV_TOTAL_OPEN_PROPERTY_STREAM_HANDLES
     * @type {Integer (Int32)}
     */
    static TOTAL_OPEN_PROPERTY_STREAM_HANDLES => 12292

    /**
     * Native name: IMMPID_MPV_TOTAL_OPEN_CONTENT_HANDLES
     * @type {Integer (Int32)}
     */
    static TOTAL_OPEN_CONTENT_HANDLES => 12293

    /**
     * Native name: IMMPID_MPV_AFTER__
     * @type {Integer (Int32)}
     */
    static AFTER__ => 12294
}
