#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncAV1PictureType extends Win32Enum {

    /**
     * Native name: eAVEncAV1PictureType_Key
     * @type {Integer (Int32)}
     */
    static Key => 0

    /**
     * Native name: eAVEncAV1PictureType_Intra_Only
     * @type {Integer (Int32)}
     */
    static Intra_Only => 1

    /**
     * Native name: eAVEncAV1PictureType_Inter
     * @type {Integer (Int32)}
     */
    static Inter => 2

    /**
     * Native name: eAVEncAV1PictureType_Switch
     * @type {Integer (Int32)}
     */
    static Switch => 3
}
