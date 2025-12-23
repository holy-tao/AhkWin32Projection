#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TF_DA_COLORTYPE enumeration specify the format of the color contained in the TF_DA_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_colortype
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class TF_DA_COLORTYPE extends Win32Enum{

    /**
     * The structure contains no color data.
     * @type {Integer (Int32)}
     */
    static TF_CT_NONE => 0

    /**
     * The color is specified as a system color index. For more information about the system color indexes, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a>.
     * @type {Integer (Int32)}
     */
    static TF_CT_SYSCOLOR => 1

    /**
     * The color is specified as an RGB value.
     * @type {Integer (Int32)}
     */
    static TF_CT_COLORREF => 2
}
