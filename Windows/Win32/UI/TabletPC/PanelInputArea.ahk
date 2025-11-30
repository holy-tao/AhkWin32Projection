#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PanelInputArea extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PanelInputArea_Auto => 0

    /**
     * @type {Integer (Int32)}
     */
    static PanelInputArea_Keyboard => 1

    /**
     * @type {Integer (Int32)}
     */
    static PanelInputArea_WritingPad => 2

    /**
     * @type {Integer (Int32)}
     */
    static PanelInputArea_CharacterPad => 3
}
