#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the closed caption decoder level.
 * @see https://learn.microsoft.com/windows/win32/api/il21dec/ne-il21dec-am_line21_cclevel
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct AM_LINE21_CCLEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * TeleCaption II.
     * @type {Integer (Int32)}
     */
    static AM_L21_CCLEVEL_TC2 => 0
}
