#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Identifies the four directional buttons used for DVD menu navigation and other operations.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_relative_button
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct DVD_RELATIVE_BUTTON {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Upper button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Upper => 1

    /**
     * Lower button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Lower => 2

    /**
     * Left button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Left => 3

    /**
     * Right button.
     * @type {Integer (Int32)}
     */
    static DVD_Relative_Right => 4
}
