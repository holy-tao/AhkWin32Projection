#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the use of a color. Used by IVisualProperties methods.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl/ne-shobjidl-vpcolorflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class VPCOLORFLAGS extends Win32Enum{

    /**
     * A text color.
     * @type {Integer (Int32)}
     */
    static VPCF_TEXT => 1

    /**
     * A background color.
     * @type {Integer (Int32)}
     */
    static VPCF_BACKGROUND => 2

    /**
     * A sort-column color.
     * @type {Integer (Int32)}
     */
    static VPCF_SORTCOLUMN => 3

    /**
     * A subtext color.
     * @type {Integer (Int32)}
     */
    static VPCF_SUBTEXT => 4

    /**
     * <b>Windows 7 and later</b>. A text background color.
     * @type {Integer (Int32)}
     */
    static VPCF_TEXTBACKGROUND => 5
}
