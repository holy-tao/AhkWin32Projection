#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class DESKTOP_SLIDESHOW_OPTIONS extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static DSO_SHUFFLEIMAGES => 1
}
