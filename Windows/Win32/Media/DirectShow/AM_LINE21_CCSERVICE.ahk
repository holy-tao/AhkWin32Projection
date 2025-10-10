#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the closed captioning service.
 * @remarks
 * 
  * The Line 21 decoder supports CC1 and CC2 only.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//il21dec/ne-il21dec-am_line21_ccservice
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_LINE21_CCSERVICE{

    /**
     * No current service.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_None => 0

    /**
     * CC1 (caption channel).
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_Caption1 => 1

    /**
     * CC2 (caption channel).
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_Caption2 => 2

    /**
     * T1 (text channel).
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_Text1 => 3

    /**
     * T2 (text channel)
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_Text2 => 4

    /**
     * Extended Data Services (XDS or EDS).
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_XDS => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_DefChannel => 10

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AM_L21_CCSERVICE_Invalid => 11
}
