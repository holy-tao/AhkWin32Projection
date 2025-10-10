#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sample for a Video Image stream that uses the Windows Media Video 9 Image codec.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_videoimage_sample
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_VIDEOIMAGE_SAMPLE extends Win32Struct
{
    static sizeof => 84

    static packingSize => 4

    /**
     * Reserved value. Always set to WMT_VIDEOIMAGE_MAGIC_NUMBER.
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the structure. Always set to <b>sizeof</b>(<b>WMT_VIDEOIMAGE_SAMPLE</b>).
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwControlFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

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
     * @type {Integer}
     */
    dwInputFlagsCur {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * <b>LONG</b> value containing the horizontal scaling factor of the current image. A scaling factor of 1 means no horizontal scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lCurMotionXtoX {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lCurMotionYtoX {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * <b>LONG</b> value containing the horizontal offset for the current image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lCurMotionXoffset {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lCurMotionXtoY {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * <b>LONG</b> value containing the vertical scaling factor of the current image. A scaling factor of 1 means no vertical scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lCurMotionYtoY {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * <b>LONG</b> value containing the vertical offset for the current image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lCurMotionYoffset {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * <b>LONG</b> value containing the blend coefficient for the current image when combined with the previous image for an output. This coefficient and the coefficient for the previous image must total 1. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lCurBlendCoef1 {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lCurBlendCoef2 {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

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
     * @type {Integer}
     */
    dwInputFlagsPrev {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * <b>LONG</b> value containing the horizontal scaling factor of the previous image. A scaling factor of 1 means no horizontal scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lPrevMotionXtoX {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lPrevMotionYtoX {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * <b>LONG</b> value containing the horizontal offset for the previous image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lPrevMotionXoffset {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lPrevMotionXtoY {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * <b>LONG</b> value containing the vertical scaling factor of the previous image. A scaling factor of 1 means no vertical scaling will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lPrevMotionYtoY {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    /**
     * <b>LONG</b> value containing the vertical offset for the previous image, in pixels, in relation to the last output sample. An offset of 0 means that no panning will be performed for this sample. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lPrevMotionYoffset {
        get => NumGet(this, 72, "int")
        set => NumPut("int", value, this, 72)
    }

    /**
     * <b>LONG</b> value containing the blend coefficient for the previous image when combined with the current image for an output. This coefficient and the coefficient for the current image must total 1. This value must be multiplied by WMT_VIDEOIMAGE_INTEGER_DENOMINATOR before being set in the structure.
     * @type {Integer}
     */
    lPrevBlendCoef1 {
        get => NumGet(this, 76, "int")
        set => NumPut("int", value, this, 76)
    }

    /**
     * Not used.
     * @type {Integer}
     */
    lPrevBlendCoef2 {
        get => NumGet(this, 80, "int")
        set => NumPut("int", value, this, 80)
    }
}
