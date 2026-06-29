#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the input operations for which visual feedback should be provided.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ne-dwmapi-dwm_showcontact
 * @namespace Windows.Win32.Graphics.Dwm
 */
export default struct DWM_SHOWCONTACT {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Down.
     * @type {Integer (UInt32)}
     */
    static DWMSC_DOWN => 1

    /**
     * Up.
     * @type {Integer (UInt32)}
     */
    static DWMSC_UP => 2

    /**
     * Drag.
     * @type {Integer (UInt32)}
     */
    static DWMSC_DRAG => 4

    /**
     * Hold.
     * @type {Integer (UInt32)}
     */
    static DWMSC_HOLD => 8

    /**
     * Pen barrel.
     * @type {Integer (UInt32)}
     */
    static DWMSC_PENBARREL => 16

    /**
     * None.
     * @type {Integer (UInt32)}
     */
    static DWMSC_NONE => 0

    /**
     * All.
     * @type {Integer (UInt32)}
     */
    static DWMSC_ALL => 4294967295
}
