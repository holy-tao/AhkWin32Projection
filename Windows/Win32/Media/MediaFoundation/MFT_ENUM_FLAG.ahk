#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_ENUM_FLAG extends Win32BitflagEnum {

    /**
     * Native name: MFT_ENUM_FLAG_SYNCMFT
     * @type {Integer (Int32)}
     */
    static SYNCMFT => 1

    /**
     * Native name: MFT_ENUM_FLAG_ASYNCMFT
     * @type {Integer (Int32)}
     */
    static ASYNCMFT => 2

    /**
     * Native name: MFT_ENUM_FLAG_HARDWARE
     * @type {Integer (Int32)}
     */
    static HARDWARE => 4

    /**
     * Native name: MFT_ENUM_FLAG_FIELDOFUSE
     * @type {Integer (Int32)}
     */
    static FIELDOFUSE => 8

    /**
     * Native name: MFT_ENUM_FLAG_LOCALMFT
     * @type {Integer (Int32)}
     */
    static LOCALMFT => 16

    /**
     * Native name: MFT_ENUM_FLAG_TRANSCODE_ONLY
     * @type {Integer (Int32)}
     */
    static TRANSCODE_ONLY => 32

    /**
     * Native name: MFT_ENUM_FLAG_SORTANDFILTER
     * @type {Integer (Int32)}
     */
    static SORTANDFILTER => 64

    /**
     * Native name: MFT_ENUM_FLAG_SORTANDFILTER_APPROVED_ONLY
     * @type {Integer (Int32)}
     */
    static SORTANDFILTER_APPROVED_ONLY => 192

    /**
     * Native name: MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY
     * @type {Integer (Int32)}
     */
    static SORTANDFILTER_WEB_ONLY => 320

    /**
     * Native name: MFT_ENUM_FLAG_SORTANDFILTER_WEB_ONLY_EDGEMODE
     * @type {Integer (Int32)}
     */
    static SORTANDFILTER_WEB_ONLY_EDGEMODE => 576

    /**
     * Native name: MFT_ENUM_FLAG_UNTRUSTED_STOREMFT
     * @type {Integer (Int32)}
     */
    static UNTRUSTED_STOREMFT => 1024

    /**
     * Native name: MFT_ENUM_FLAG_ALL
     * @type {Integer (Int32)}
     */
    static ALL => 63
}
