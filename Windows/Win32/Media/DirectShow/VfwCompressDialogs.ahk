#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies a dialog box that might exist in a Video for Windows compression (codec) driver.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-vfwcompressdialogs
 * @namespace Windows.Win32.Media.DirectShow
 */
class VfwCompressDialogs extends Win32Enum {

    /**
     * Configure dialog box.
     * Native name: VfwCompressDialog_Config
     * @type {Integer (Int32)}
     */
    static Dialog_Config => 1

    /**
     * About dialog box.
     * Native name: VfwCompressDialog_About
     * @type {Integer (Int32)}
     */
    static Dialog_About => 2

    /**
     * Specifies whether the Configure dialog box is available.
     * Native name: VfwCompressDialog_QueryConfig
     * @type {Integer (Int32)}
     */
    static Dialog_QueryConfig => 4

    /**
     * Specifies whether the About dialog box is available.
     * Native name: VfwCompressDialog_QueryAbout
     * @type {Integer (Int32)}
     */
    static Dialog_QueryAbout => 8
}
