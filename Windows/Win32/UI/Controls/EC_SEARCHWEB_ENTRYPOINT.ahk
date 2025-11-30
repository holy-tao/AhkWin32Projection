#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ne-commctrl-ec_searchweb_entrypoint
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EC_SEARCHWEB_ENTRYPOINT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static EC_SEARCHWEB_ENTRYPOINT_EXTERNAL => 0

    /**
     * @type {Integer (Int32)}
     */
    static EC_SEARCHWEB_ENTRYPOINT_CONTEXTMENU => 1
}
