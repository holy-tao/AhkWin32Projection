#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the direction of the scrolling command for a pen flick.
 * @remarks
 * When the user performs a pen flick that is assigned to a scrolling command, the <a href="https://docs.microsoft.com/windows/desktop/tablet/wm-tablet-flick-message">WM_TABLET_FLICK Message</a> sends the direction of the scrolling command as part of the <a href="https://docs.microsoft.com/windows/desktop/api/tabflicks/ns-tabflicks-flick_data">FLICK_DATA Structure</a>.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-scrolldirection
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct SCROLLDIRECTION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The flick action is a Scroll Up command.
     * @type {Integer (Int32)}
     */
    static SCROLLDIRECTION_UP => 0

    /**
     * The flick action is a Scroll Down command.
     * @type {Integer (Int32)}
     */
    static SCROLLDIRECTION_DOWN => 1
}
