#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the direction of the scrolling command for a pen flick.
 * @remarks
 * When the user performs a pen flick that is assigned to a scrolling command, the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a> sends the direction of the scrolling command as part of the <a href="https://docs.microsoft.com/windows/desktop/api/tabflicks/ns-tabflicks-flick_data">FLICK_DATA Structure</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-scrolldirection
 * @namespace Windows.Win32.UI.TabletPC
 */
class SCROLLDIRECTION extends Win32Enum {

    /**
     * The flick action is a Scroll Up command.
     * Native name: SCROLLDIRECTION_UP
     * @type {Integer (Int32)}
     */
    static UP => 0

    /**
     * The flick action is a Scroll Down command.
     * Native name: SCROLLDIRECTION_DOWN
     * @type {Integer (Int32)}
     */
    static DOWN => 1
}
