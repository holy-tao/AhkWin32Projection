#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Elements of the TF_DA_COLORTYPE enumeration specify the format of the color contained in the TF_DA_COLOR structure.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/ne-msctf-tf_da_colortype
 * @namespace Windows.Win32.UI.TextServices
 */
class TF_DA_COLORTYPE extends Win32Enum {

    /**
     * The structure contains no color data.
     * Native name: TF_CT_NONE
     * @type {Integer (Int32)}
     */
    static CT_NONE => 0

    /**
     * The color is specified as a system color index. For more information about the system color indexes, see <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsyscolor">GetSysColor</a>.
     * Native name: TF_CT_SYSCOLOR
     * @type {Integer (Int32)}
     */
    static CT_SYSCOLOR => 1

    /**
     * The color is specified as an RGB value.
     * Native name: TF_CT_COLORREF
     * @type {Integer (Int32)}
     */
    static CT_COLORREF => 2
}
