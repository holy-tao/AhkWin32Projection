#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The VMR9ProcAmpControl structure specifies the image adjustments to be performed on a video stream. This structure is used with the Video Mixing Renderer Filter 9 (VMR-9).
 * @remarks
 * The valid range of values for each property depends on the graphics device driver. Call the <a href="https://docs.microsoft.com/windows/desktop/api/vmr9/nf-vmr9-ivmrmixercontrol9-getprocampcontrolrange">IVMRMixerControl9::GetProcAmpControlRange</a> method to get the range for each property.
 * @see https://learn.microsoft.com/windows/win32/api/vmr9/ns-vmr9-vmr9procampcontrol
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct VMR9ProcAmpControl {
    #StructPack 4

    /**
     * Size of the structure, in bytes. The value must be <c>sizeof(VMR9ProcAmpControl)</c>.
     */
    dwSize : UInt32

    /**
     * Bitwise combination of flags from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/vmr9/ne-vmr9-vmr9procampcontrolflags">VMR9ProcAmpControlFlags</a> enumeration, indicating which properties the driver supports.
     */
    dwFlags : UInt32

    /**
     * Specifies the image brightness. Brightness, also called black-level setup, specifies the viewing black level. Functionally, it adds or subtracts the same number of quantizing steps (bits) from all the luminance words in a picture.
     */
    Brightness : Float32

    /**
     * Specifies the image contrast. Contrast alters the relative light-to-dark values in a picture. Functionally it maps the range of input values to a smaller or larger range of output values.
     */
    Contrast : Float32

    /**
     * Specifies the image hue. Perceptually, hue corresponds approximately to "color." Functionally, hue is a phase relationship of the chrominance components. It is specified in degrees, with a nominal valid range from –180 to 180 degrees and a default value of 0.
     */
    Hue : Float32

    /**
     * Specifies the image saturation. Saturation alters the color intensity of the image. Functionally it is similar to contrast, but operates on the chroma components of the image.
     */
    Saturation : Float32

}
