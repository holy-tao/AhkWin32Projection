#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AM_WST_DRAWBGMODE enumeration specifies whether the background of the WST frame is opaque or transparent.
 * @see https://learn.microsoft.com/windows/win32/api/iwstdec/ne-iwstdec-am_wst_drawbgmode
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_WST_DRAWBGMODE extends Win32Enum{

    /**
     * The background is opaque.
     * @type {Integer (Int32)}
     */
    static AM_WST_DRAWBGMODE_Opaque => 0

    /**
     * The background is transparent.
     * @type {Integer (Int32)}
     */
    static AM_WST_DRAWBGMODE_Transparent => 1
}
