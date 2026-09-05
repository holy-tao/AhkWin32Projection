#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TfGravity enumeration specify the type of gravity associated with the anchor of an ITfRange object.
 * @remarks
 * For more information about anchor gravity, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Anchor Gravity</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tfgravity
 * @namespace Windows.Win32.UI.TextServices
 */
class TfGravity extends Win32Enum {

    /**
     * The anchor has backward gravity.
     * Native name: TF_GRAVITY_BACKWARD
     * @type {Integer (Int32)}
     */
    static BACKWARD => 0

    /**
     * The anchor has forward gravity.
     * Native name: TF_GRAVITY_FORWARD
     * @type {Integer (Int32)}
     */
    static FORWARD => 1
}
