#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes where Flick gestures are enabled.
 * @remarks
 * The <b>HKEY_CURRENT_USER\Software\Microsoft\Wisp\Pen\SysEventParameters</b> subkey has an entry called <b>FlickMode</b> that indicates whether pen flicks are enabled. The value of the entry is one of the <b>FLICKMODE</b> enumeration values.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-flickmode
 * @namespace Windows.Win32.UI.TabletPC
 */
class FLICKMODE extends Win32Enum {

    /**
     * Native name: FLICKMODE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 0

    /**
     * Pen flicks are not enabled.
     * Native name: FLICKMODE_OFF
     * @type {Integer (Int32)}
     */
    static OFF => 0

    /**
     * Pen flicks are enabled.
     * Native name: FLICKMODE_ON
     * @type {Integer (Int32)}
     */
    static ON => 1

    /**
     * Native name: FLICKMODE_LEARNING
     * @type {Integer (Int32)}
     */
    static LEARNING => 2

    /**
     * Native name: FLICKMODE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 2

    /**
     * Native name: FLICKMODE_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 1
}
