#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The WMT_VIDEOIMAGE_SAMPLE2 structure describes a sample for a Video Image stream.
 * @remarks
 * When creating an input Video Image sample, the values for the current image describe the image attached to the sample. The values for the previous image describe the image that was the current image in the previous sample. Normally, the previous image is discarded when you pass in a new image. (The old current image becomes the new previous image and the image passed in with the sample becomes the new current image.) If, when passing a new image, you want to discard the old current image and keep the old previous image, you can set the <b>bKeepPrevImage</b> member to <b>TRUE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_videoimage_sample2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_VIDEOIMAGE_SAMPLE2 {
    #StructPack 4

    /**
     * Reserved. You must set this member to WMT_VIDEOIMAGE_MAGIC_NUMBER_2.
     */
    dwMagic : UInt32

    /**
     * Size of the structure. Set to <c>sizeof(WMT_VIDEOIMAGE_SAMPLE2)</c>.
     */
    dwStructSize : UInt32

    /**
     * Specifies the type of sample. Use one or more of the flags in the following table, combined with the bitwise <b>OR</b> operator (|):<table>
     * <tr>
     * <th>Flag</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_INPUT_FRAME</td>
     * <td>Indicates that the sample contains an input image. The image data must be included in the sample immediately following the structure. The format of the image must conform to the values set in the input properties for the stream.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME</td>
     * <td>Indicates that the sample should result in a unique output frame in the stream. If this flag is not set, the remainder of the members of the structure are ignored and the frame in the stream will be a duplicate of the previous frame.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_USES_CURRENT_INPUT_FRAME</td>
     * <td>Indicates that the sample is based, either solely or in part, on the current  image. If this flag is set, the first set of value members will be used (those with names containing the string "Curr"). 
     * This flag is not valid unless used in combination with WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME.
     * </td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_USES_PREVIOUS_INPUT_FRAME</td>
     * <td>Indicates that the sample is based, either solely or in part, on the previous image. If this flag is set, the second set of value members will be used (those with names containing the string "Prev"). 
     * This flag is not valid unless used in combination with WMT_VIDEOIMAGE_SAMPLE_OUTPUT_FRAME.
     * </td>
     * </tr>
     * </table>
     */
    dwControlFlags : UInt32

    /**
     * Width of the output frame.
     */
    dwViewportWidth : UInt32

    /**
     * Height of the output frame.
     */
    dwViewportHeight : UInt32

    /**
     * Width of the current image.
     */
    dwCurrImageWidth : UInt32

    /**
     * Height of the current image.
     */
    dwCurrImageHeight : UInt32

    /**
     * X component of the origin point of the region of interest in the current image.
     */
    fCurrRegionX0 : Float32

    /**
     * Y component of the origin point of the region of interest in the current image.
     */
    fCurrRegionY0 : Float32

    /**
     * Width of the region of interest in the current image. The specified region of interest will be sized to match the size of the output frame.
     */
    fCurrRegionWidth : Float32

    /**
     * Height of the region of interest in the current image. The specified region of interest will be sized to match the size of the output frame.
     */
    fCurrRegionHeight : Float32

    /**
     * Blending coefficient for the current image. This value specifies the transparency of the current image relative to the previous image. The blending coefficients of the two images must total 1.0.
     */
    fCurrBlendCoef : Float32

    /**
     * Width of the previous image.
     */
    dwPrevImageWidth : UInt32

    /**
     * Height of the previous image.
     */
    dwPrevImageHeight : UInt32

    /**
     * X component of the origin point of the region of interest in the previous image.
     */
    fPrevRegionX0 : Float32

    /**
     * Y component of the origin point of the region of interest in the previous image.
     */
    fPrevRegionY0 : Float32

    /**
     * Width of the region of interest in the previous image. The specified region of interest will be sized to match the size of the output frame.
     */
    fPrevRegionWidth : Float32

    /**
     * Height of the region of interest in the previous image. The specified region of interest will be sized to match the size of the output frame.
     */
    fPrevRegionHeight : Float32

    /**
     * Blending coefficient for the previous image. This value specifies the transparency of the previous image relative to the current image. The blending coefficients of the two images must total 1.0.
     */
    fPrevBlendCoef : Float32

    /**
     * The effect identifier of the transition between the previous image and the current image. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/video-image-transitions">Video Image Transitions</a>.
     */
    dwEffectType : UInt32

    /**
     * The number of effect parameters relevant to the current effect. The final five members of this structure contain the values of effect parameters. This member specifies how many of those parameters contain valid information.
     */
    dwNumEffectParas : UInt32

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     */
    fEffectPara0 : Float32

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     */
    fEffectPara1 : Float32

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     */
    fEffectPara2 : Float32

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     */
    fEffectPara3 : Float32

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     */
    fEffectPara4 : Float32

    /**
     * For input samples, <b>TRUE</b> indicates that the new image should replace the current image and that the current image should be discarded. The default behavior, indicated by setting this member to <b>FALSE</b>, is for the current image to become the previous image and the new image to become the current image.
     */
    bKeepPrevImage : BOOL

}
