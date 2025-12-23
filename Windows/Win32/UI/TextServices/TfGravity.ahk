#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfGravity enumeration specify the type of gravity associated with the anchor of an ITfRange object.
 * @remarks
 * For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Anchor Gravity</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tfgravity
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TfGravity extends Win32Enum{

    /**
     * The anchor has backward gravity.
     * @type {Integer (Int32)}
     */
    static TF_GRAVITY_BACKWARD => 0

    /**
     * The anchor has forward gravity.
     * @type {Integer (Int32)}
     */
    static TF_GRAVITY_FORWARD => 1
}
