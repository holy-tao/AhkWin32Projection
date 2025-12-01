#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the closed caption decoder level.
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/ne-il21dec-am_line21_cclevel
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_LINE21_CCLEVEL extends Win32Enum{

    /**
     * TeleCaption II.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCLEVEL_TC2 => 0
}
