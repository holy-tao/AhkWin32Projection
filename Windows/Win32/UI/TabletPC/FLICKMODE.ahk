#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes where Flick gestures are enabled.
 * @remarks
 * The <b>HKEY_CURRENT_USER\Software\Microsoft\Wisp\Pen\SysEventParameters</b> subkey has an entry called <b>FlickMode</b> that indicates whether pen flicks are enabled. The value of the entry is one of the <b>FLICKMODE</b> enumeration values.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-flickmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class FLICKMODE{

    /**
     * 
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
     * 
     * @type {Integer (Int32)}
     */
    static FLICKMODE_LEARNING => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FLICKMODE_MAX => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FLICKMODE_DEFAULT => 1
}
