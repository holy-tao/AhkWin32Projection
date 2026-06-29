#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9ProcAmpControlFlags enumeration type specifies image adjustment properties, for use with the Video Mixing Render Filter 9 (VMR-9).
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ne-vmr9-vmr9procampcontrolflags
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9ProcAmpControlFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Brightness adjustment.
     * @type {Integer (Int32)}
     */
    static ProcAmpControl9_Brightness => 1

    /**
     * Contrast adjustment.
     * @type {Integer (Int32)}
     */
    static ProcAmpControl9_Contrast => 2

    /**
     * Hue adjustment.
     * @type {Integer (Int32)}
     */
    static ProcAmpControl9_Hue => 4

    /**
     * Saturation adjustment.
     * @type {Integer (Int32)}
     */
    static ProcAmpControl9_Saturation => 8

    /**
     * Bitwise <b>OR</b> of all the previous flags. This value is used internally by the VMR-9, and is not a valid flag.
     * @type {Integer (Int32)}
     */
    static ProcAmpControl9_Mask => 15
}
