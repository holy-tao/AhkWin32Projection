#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the values that represent the default input areas of the Tablet PC Input Panel.
 * @see https://learn.microsoft.com/windows/win32/api/peninputpanel/ne-peninputpanel-panelinputarea
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class PanelInputArea{

    /**
     * The system controls the default input area.
     * @type {Integer (Int32)}
     */
    static PanelInputArea_Auto => 0

    /**
     * The keyboard is the default input area.
     * @type {Integer (Int32)}
     */
    static PanelInputArea_Keyboard => 1

    /**
     * The writing pad is the default input area.
     * @type {Integer (Int32)}
     */
    static PanelInputArea_WritingPad => 2

    /**
     * The character pad is the default input area.
     * @type {Integer (Int32)}
     */
    static PanelInputArea_CharacterPad => 3
}
