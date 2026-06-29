#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes where Flick gestures are enabled.
 * @remarks
 * The <b>HKEY_CURRENT_USER\Software\Microsoft\Wisp\Pen\SysEventParameters</b> subkey has an entry called <b>FlickMode</b> that indicates whether pen flicks are enabled. The value of the entry is one of the <b>FLICKMODE</b> enumeration values.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-flickmode
 * @namespace Windows.Win32.UI.TabletPC
 */
export default struct FLICKMODE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static FLICKMODE_MIN => 0

    /**
     * Pen flicks are not enabled.
     * @type {Integer (Int32)}
     */
    static FLICKMODE_OFF => 0

    /**
     * Pen flicks are enabled.
     * @type {Integer (Int32)}
     */
    static FLICKMODE_ON => 1

    /**
     * @type {Integer (Int32)}
     */
    static FLICKMODE_LEARNING => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLICKMODE_MAX => 2

    /**
     * @type {Integer (Int32)}
     */
    static FLICKMODE_DEFAULT => 1
}
