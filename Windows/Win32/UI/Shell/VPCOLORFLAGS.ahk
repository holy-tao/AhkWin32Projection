#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the use of a color. Used by IVisualProperties methods.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl/ne-shobjidl-vpcolorflags
 * @namespace Windows.Win32.UI.Shell
 */
export default struct VPCOLORFLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
