#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a selection appears on the control.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-inkdisplaymode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkDisplayMode{

    /**
     * The selection appears as ink.
     * @type {Integer (Int32)}
     */
    static IDM_Ink => 0

    /**
     * The selection appears as text.
     * @type {Integer (Int32)}
     */
    static IDM_Text => 1
}
