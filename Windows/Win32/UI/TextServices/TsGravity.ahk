#Requires AutoHotkey v2.0.0 64-bit

/**
 * Elements of the TsGravity enumeration specify the gravity type associated with an IAnchor object.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/ne-textstor-tsgravity
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TsGravity{

    /**
     * The anchor has backward gravity. For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>.
     * @type {Integer (Int32)}
     */
    static TS_GR_BACKWARD => 0

    /**
     * The anchor has forward gravity. For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>.
     * @type {Integer (Int32)}
     */
    static TS_GR_FORWARD => 1
}
