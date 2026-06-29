#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describes a sample for a Video Image stream that uses the Windows Media Video 9 Image codec.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wmt_videoimage_sample
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WMT_VIDEOIMAGE_SAMPLE {
    #StructPack 4

    /**
     * Reserved value. Always set to WMT_VIDEOIMAGE_MAGIC_NUMBER.
     */
    dwMagic : UInt32

    /**
     * Size of the structure. Always set to <b>sizeof</b>(<b>WMT_VIDEOIMAGE_SAMPLE</b>).
     */
    cbStruct : UInt32

    dwControlFlags : UInt32

    /**
     * One or more flags indicating the operation to perform on the current image. The following flags are available.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING</td>
     * <td>Indicates that the sample uses advanced blending. This feature is not supported in the current version.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_BLENDING</td>
     * <td>Indicates that the sample contains blending. If this flag is set, the sum of the values of <b>lCurBlendCoef1</b> and <b>lPrevBlendCoef1 </b>(before multiplying by the denominator) must equal 1.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_MOTION</td>
     * <td>Indicates that the sample uses pan and/or zoom.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_ROTATION</td>
     * <td>Indicates that the sample uses rotation. This feature is not supported in the current version.</td>
     * </tr>
     * </table>
     */
    dwInputFlagsCur : UInt32

    /**
     * <b>LONG</b> value containing the horizontal scaling factor of the current image. A scaling factor of 1 means no horizontal scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lCurMotionXtoX : Int32

    /**
     * Not used.
     */
    lCurMotionYtoX : Int32

    /**
     * <b>LONG</b> value containing the horizontal offset for the current image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lCurMotionXoffset : Int32

    /**
     * Not used.
     */
    lCurMotionXtoY : Int32

    /**
     * <b>LONG</b> value containing the vertical scaling factor of the current image. A scaling factor of 1 means no vertical scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lCurMotionYtoY : Int32

    /**
     * <b>LONG</b> value containing the vertical offset for the current image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lCurMotionYoffset : Int32

    /**
     * <b>LONG</b> value containing the blend coefficient for the current image when combined with the previous image for an output. This coefficient and the coefficient for the previous image must total 1. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lCurBlendCoef1 : Int32

    /**
     * Not used.
     */
    lCurBlendCoef2 : Int32

    /**
     * One or more flags indicating the operation to perform on the previous image. The following flags are available.<table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_ADV_BLENDING</td>
     * <td>Indicates that the sample uses advanced blending. This feature is not supported in the current version.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_BLENDING</td>
     * <td>Indicates that the sample contains blending. If this flag is set, the sum of the values of <b>lCurBlendCoef1</b> and <b>lPrevBlendCoef1 </b>(before multiplying by the denominator) must equal 1.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_MOTION</td>
     * <td>Indicates that the sample uses pan and/or zoom.</td>
     * </tr>
     * <tr>
     * <td>WMT_VIDEOIMAGE_SAMPLE_ROTATION</td>
     * <td>Indicates that the sample uses rotation. This feature is not supported in the current version.</td>
     * </tr>
     * </table>
     */
    dwInputFlagsPrev : UInt32

    /**
     * <b>LONG</b> value containing the horizontal scaling factor of the previous image. A scaling factor of 1 means no horizontal scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lPrevMotionXtoX : Int32

    /**
     * Not used.
     */
    lPrevMotionYtoX : Int32

    /**
     * <b>LONG</b> value containing the horizontal offset for the previous image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lPrevMotionXoffset : Int32

    /**
     * Not used.
     */
    lPrevMotionXtoY : Int32

    /**
     * <b>LONG</b> value containing the vertical scaling factor of the previous image. A scaling factor of 1 means no vertical scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lPrevMotionYtoY : Int32

    /**
     * <b>LONG</b> value containing the vertical offset for the previous image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lPrevMotionYoffset : Int32

    /**
     * <b>LONG</b> value containing the blend coefficient for the previous image when combined with the current image for an output. This coefficient and the coefficient for the current image must total 1. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     */
    lPrevBlendCoef1 : Int32

    /**
     * Not used.
     */
    lPrevBlendCoef2 : Int32

}
