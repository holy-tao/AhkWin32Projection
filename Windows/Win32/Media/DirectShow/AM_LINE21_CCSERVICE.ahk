#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the closed captioning service.
 * @remarks
 * The Line 21 decoder supports CC1 and CC2 only.
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/ne-il21dec-am_line21_ccservice
 * @namespace Windows.Win32.Media.DirectShow
 */
class AM_LINE21_CCSERVICE extends Win32Enum {

    /**
     * No current service.
     * Native name: AM_L21_CCSERVICE_None
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_None => 0

    /**
     * CC1 (caption channel).
     * Native name: AM_L21_CCSERVICE_Caption1
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_Caption1 => 1

    /**
     * CC2 (caption channel).
     * Native name: AM_L21_CCSERVICE_Caption2
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_Caption2 => 2

    /**
     * T1 (text channel).
     * Native name: AM_L21_CCSERVICE_Text1
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_Text1 => 3

    /**
     * T2 (text channel)
     * Native name: AM_L21_CCSERVICE_Text2
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_Text2 => 4

    /**
     * Extended Data Services (XDS or EDS).
     * Native name: AM_L21_CCSERVICE_XDS
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_XDS => 5

    /**
     * Native name: AM_L21_CCSERVICE_DefChannel
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_DefChannel => 10

    /**
     * Native name: AM_L21_CCSERVICE_Invalid
     * @type {Integer (Int32)}
     */
    static L21_CCSERVICE_Invalid => 11
}
