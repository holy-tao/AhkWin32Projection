#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9RenderPrefs enumeration type specifies basic rendering preferences for the VMR-9. It is used with the IVMRFilterConfig9::GetRenderingPrefs and IVMRFilterConfig9::SetRenderingPrefs methods.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9renderprefs
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9RenderPrefs {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the application paints the color keyed areas.
     * @type {Integer (Int32)}
     */
    static RenderPrefs9_DoNotRenderBorder => 1

    /**
     * Bitwise <b>OR</b> of all flags; not used by applications.
     * @type {Integer (Int32)}
     */
    static RenderPrefs9_Mask => 1
}
