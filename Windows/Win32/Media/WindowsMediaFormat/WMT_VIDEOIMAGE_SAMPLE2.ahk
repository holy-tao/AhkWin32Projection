#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * The WMT_VIDEOIMAGE_SAMPLE2 structure describes a sample for a Video Image stream.
 * @remarks
 * 
  * When creating an input Video Image sample, the values for the current image describe the image attached to the sample. The values for the previous image describe the image that was the current image in the previous sample. Normally, the previous image is discarded when you pass in a new image. (The old current image becomes the new previous image and the image passed in with the sample becomes the new current image.) If, when passing a new image, you want to discard the old current image and keep the old previous image, you can set the <b>bKeepPrevImage</b> member to <b>TRUE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/ns-wmsdkidl-wmt_videoimage_sample2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class WMT_VIDEOIMAGE_SAMPLE2 extends Win32Struct
{
    static sizeof => 108

    static packingSize => 4

    /**
     * Reserved. You must set this member to WMT_VIDEOIMAGE_MAGIC_NUMBER_2.
     * @type {Integer}
     */
    dwMagic {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Size of the structure. Set to <c>sizeof(WMT_VIDEOIMAGE_SAMPLE2)</c>.
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

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
     * @type {Integer}
     */
    dwControlFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Width of the output frame.
     * @type {Integer}
     */
    dwViewportWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Height of the output frame.
     * @type {Integer}
     */
    dwViewportHeight {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Width of the current image.
     * @type {Integer}
     */
    dwCurrImageWidth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Height of the current image.
     * @type {Integer}
     */
    dwCurrImageHeight {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * X component of the origin point of the region of interest in the current image.
     * @type {Float}
     */
    fCurrRegionX0 {
        get => NumGet(this, 28, "float")
        set => NumPut("float", value, this, 28)
    }

    /**
     * Y component of the origin point of the region of interest in the current image.
     * @type {Float}
     */
    fCurrRegionY0 {
        get => NumGet(this, 32, "float")
        set => NumPut("float", value, this, 32)
    }

    /**
     * Width of the region of interest in the current image. The specified region of interest will be sized to match the size of the output frame.
     * @type {Float}
     */
    fCurrRegionWidth {
        get => NumGet(this, 36, "float")
        set => NumPut("float", value, this, 36)
    }

    /**
     * Height of the region of interest in the current image. The specified region of interest will be sized to match the size of the output frame.
     * @type {Float}
     */
    fCurrRegionHeight {
        get => NumGet(this, 40, "float")
        set => NumPut("float", value, this, 40)
    }

    /**
     * Blending coefficient for the current image. This value specifies the transparency of the current image relative to the previous image. The blending coefficients of the two images must total 1.0.
     * @type {Float}
     */
    fCurrBlendCoef {
        get => NumGet(this, 44, "float")
        set => NumPut("float", value, this, 44)
    }

    /**
     * Width of the previous image.
     * @type {Integer}
     */
    dwPrevImageWidth {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Height of the previous image.
     * @type {Integer}
     */
    dwPrevImageHeight {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * X component of the origin point of the region of interest in the previous image.
     * @type {Float}
     */
    fPrevRegionX0 {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Y component of the origin point of the region of interest in the previous image.
     * @type {Float}
     */
    fPrevRegionY0 {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * Width of the region of interest in the previous image. The specified region of interest will be sized to match the size of the output frame.
     * @type {Float}
     */
    fPrevRegionWidth {
        get => NumGet(this, 64, "float")
        set => NumPut("float", value, this, 64)
    }

    /**
     * Height of the region of interest in the previous image. The specified region of interest will be sized to match the size of the output frame.
     * @type {Float}
     */
    fPrevRegionHeight {
        get => NumGet(this, 68, "float")
        set => NumPut("float", value, this, 68)
    }

    /**
     * Blending coefficient for the previous image. This value specifies the transparency of the previous image relative to the current image. The blending coefficients of the two images must total 1.0.
     * @type {Float}
     */
    fPrevBlendCoef {
        get => NumGet(this, 72, "float")
        set => NumPut("float", value, this, 72)
    }

    /**
     * The effect identifier of the transition between the previous image and the current image. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/video-image-transitions">Video Image Transitions</a>.
     * @type {Integer}
     */
    dwEffectType {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The number of effect parameters relevant to the current effect. The final five members of this structure contain the values of effect parameters. This member specifies how many of those parameters contain valid information.
     * @type {Integer}
     */
    dwNumEffectParas {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     * @type {Float}
     */
    fEffectPara0 {
        get => NumGet(this, 84, "float")
        set => NumPut("float", value, this, 84)
    }

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     * @type {Float}
     */
    fEffectPara1 {
        get => NumGet(this, 88, "float")
        set => NumPut("float", value, this, 88)
    }

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     * @type {Float}
     */
    fEffectPara2 {
        get => NumGet(this, 92, "float")
        set => NumPut("float", value, this, 92)
    }

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     * @type {Float}
     */
    fEffectPara3 {
        get => NumGet(this, 96, "float")
        set => NumPut("float", value, this, 96)
    }

    /**
     * Effect parameter. The uses of this parameter and the other four parameters in this structure are determined by the effect used, as specified by the value of the <b>dwEffectType</b> member.
     * @type {Float}
     */
    fEffectPara4 {
        get => NumGet(this, 100, "float")
        set => NumPut("float", value, this, 100)
    }

    /**
     * For input samples, <b>TRUE</b> indicates that the new image should replace the current image and that the current image should be discarded. The default behavior, indicated by setting this member to <b>FALSE</b>, is for the current image to become the previous image and the new image to become the current image.
     * @type {BOOL}
     */
    bKeepPrevImage{
        get {
            if(!this.HasProp("__bKeepPrevImage"))
                this.__bKeepPrevImage := BOOL(this.ptr + 104)
            return this.__bKeepPrevImage
        }
    }
}
