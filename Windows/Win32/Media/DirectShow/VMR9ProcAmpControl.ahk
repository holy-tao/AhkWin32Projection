#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The VMR9ProcAmpControl structure specifies the image adjustments to be performed on a video stream. This structure is used with the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * 
  * The valid range of values for each property depends on the graphics device driver. Call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrolrange">IVMRMixerControl9::GetProcAmpControlRange</a> method to get the range for each property.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vmr9/ns-vmr9-vmr9procampcontrol
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class VMR9ProcAmpControl extends Win32Struct
{
    static sizeof => 24

    static packingSize => 4

    /**
     * Size of the structure, in bytes. The value must be <c>sizeof(VMR9ProcAmpControl)</c>.
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9procampcontrolflags">VMR9ProcAmpControlFlags</a> enumeration, indicating which properties the driver supports.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Specifies the image brightness. Brightness, also called black-level setup, specifies the viewing black level. Functionally, it adds or subtracts the same number of quantizing steps (bits) from all the luminance words in a picture.
     * @type {Float}
     */
    Brightness {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }

    /**
     * Specifies the image contrast. Contrast alters the relative light-to-dark values in a picture. Functionally it maps the range of input values to a smaller or larger range of output values.
     * @type {Float}
     */
    Contrast {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }

    /**
     * Specifies the image hue. Perceptually, hue corresponds approximately to "color." Functionally, hue is a phase relationship of the chrominance components. It is specified in degrees, with a nominal valid range from –180 to 180 degrees and a default value of 0.
     * @type {Float}
     */
    Hue {
        get => NumGet(this, 16, "float")
        set => NumPut("float", value, this, 16)
    }

    /**
     * Specifies the image saturation. Saturation alters the color intensity of the image. Functionally it is similar to contrast, but operates on the chroma components of the image.
     * @type {Float}
     */
    Saturation {
        get => NumGet(this, 20, "float")
        set => NumPut("float", value, this, 20)
    }
}
