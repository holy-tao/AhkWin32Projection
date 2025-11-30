#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_STYLE enumeration is not supported.
 * @see https://docs.microsoft.com/windows/win32/api//iwstdec/ne-iwstdec-am_wst_style
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_WST_STYLE extends Win32Enum{

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_STYLE_None => 0

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static AM_WST_STYLE_Invers => 1
}
