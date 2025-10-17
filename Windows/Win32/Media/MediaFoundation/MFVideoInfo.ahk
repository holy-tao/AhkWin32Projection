#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MFRatio.ahk
#Include .\MFOffset.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include .\MFVideoArea.ahk

/**
 * Contains video format information that applies to both compressed and uncompressed formats.This structure is used in the MFVIDEOFORMAT structure.
 * @remarks
 * 
  * Developers are encouraged to use media type attributes instead of using the <b>MFVideoInfo</b> structure. The following table lists the attributes that correspond to the members of this structure.
  * 
  * <table>
  * <tr>
  * <th>Structure Member</th>
  * <th>Media Type Attribute</th>
  * </tr>
  * <tr>
  * <td><b>dwWidth</b>, <b>dwHeight</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-size-attribute">MF_MT_FRAME_SIZE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>PixelAspectRatio</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pixel-aspect-ratio-attribute">MF_MT_PIXEL_ASPECT_RATIO</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>SourceChromaSubsampling</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-chroma-siting-attribute">MF_MT_VIDEO_CHROMA_SITING</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>InterlaceMode</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-interlace-mode-attribute">MF_MT_INTERLACE_MODE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>TransferFunction</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-transfer-function-attribute">MF_MT_TRANSFER_FUNCTION</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>ColorPrimaries</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-primaries-attribute">MF_MT_VIDEO_PRIMARIES</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>TransferMatrix</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-yuv-matrix-attribute">MF_MT_YUV_MATRIX</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>SourceLighting</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-lighting-attribute">MF_MT_VIDEO_LIGHTING</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>FramesPerSecond</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-frame-rate-attribute">MF_MT_FRAME_RATE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>NominalRange</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-nominal-range-attribute">MF_MT_VIDEO_NOMINAL_RANGE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>GeometricAperture</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-geometric-aperture-attribute">MF_MT_GEOMETRIC_APERTURE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>MinimumDisplayAperture</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-minimum-display-aperture-attribute">MF_MT_MINIMUM_DISPLAY_APERTURE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>PanScanAperture</b></td>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-pan-scan-aperture-attribute">MF_MT_PAN_SCAN_APERTURE</a>
  * </td>
  * </tr>
  * <tr>
  * <td><b>VideoFlags</b></td>
  * <td>See <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoflags">MFVideoFlags</a>.</td>
  * </tr>
  * </table>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfobjects/ns-mfobjects-mfvideoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFVideoInfo extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * Width of the decoded image, in pixels.
     * @type {Integer}
     */
    dwWidth {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Height of the decoded image, in pixels.
     * @type {Integer}
     */
    dwHeight {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Pixel aspect ratio, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfratio">MFRatio</a> structure.
     * @type {MFRatio}
     */
    PixelAspectRatio{
        get {
            if(!this.HasProp("__PixelAspectRatio"))
                this.__PixelAspectRatio := MFRatio(8, this)
            return this.__PixelAspectRatio
        }
    }

    /**
     * Chroma sub-sampling of the original image, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideochromasubsampling">MFVideoChromaSubsampling</a> enumeration.
     * @type {Integer}
     */
    SourceChromaSubsampling {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Image interlacing, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration.
     * @type {Integer}
     */
    InterlaceMode {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * R'G'B' gamma curve function, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideotransferfunction">MFVideoTransferFunction</a> enumeration.
     * @type {Integer}
     */
    TransferFunction {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Color primaries of the video source, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoprimaries">MFVideoPrimaries</a> enumeration. This value provides the conversion from R'G'B' to linear RGB.
     * @type {Integer}
     */
    ColorPrimaries {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Conversion matrix from Y'Cb'Cr' to R'G'B, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideotransfermatrix">MFVideoTransferMatrix</a> enumeration.
     * @type {Integer}
     */
    TransferMatrix {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Intended viewing conditions, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideolighting">MFVideoLighting</a> enumeration.
     * @type {Integer}
     */
    SourceLighting {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Frames per second, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfratio">MFRatio</a> structure. If the frame rate is unknown or variable, the numerator and denominator should both be set to zero. It is invalid for only one member of the <b>MFRatio</b> structure to be zero.
     * @type {MFRatio}
     */
    FramesPerSecond{
        get {
            if(!this.HasProp("__FramesPerSecond"))
                this.__FramesPerSecond := MFRatio(40, this)
            return this.__FramesPerSecond
        }
    }

    /**
     * Range of valid RGB values, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfnominalrange">MFNominalRange</a> enumeration. The value indicates whether color values contain headroom and toeroom.
     * @type {Integer}
     */
    NominalRange {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Geometric aperture, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-geometric-aperture-attribute">MF_MT_GEOMETRIC_APERTURE</a>.
     * @type {MFVideoArea}
     */
    GeometricAperture{
        get {
            if(!this.HasProp("__GeometricAperture"))
                this.__GeometricAperture := MFVideoArea(56, this)
            return this.__GeometricAperture
        }
    }

    /**
     * The display aperture, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. The display aperture is the region of the video image that is intended to be shown. Any data outside of this area is the overscan region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-minimum-display-aperture-attribute">MF_MT_MINIMUM_DISPLAY_APERTURE</a>.
     * @type {MFVideoArea}
     */
    MinimumDisplayAperture{
        get {
            if(!this.HasProp("__MinimumDisplayAperture"))
                this.__MinimumDisplayAperture := MFVideoArea(72, this)
            return this.__MinimumDisplayAperture
        }
    }

    /**
     * Pan-scan rectangle, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. The pan-scan rectangle defines a region of the image that is displayed in pan-and-scan mode. It can be used when wide-screen content is shown on a 4 x 3 display. The value is valid only when the <b>VideoFlags</b> member contains the MFVideoFlag_PanScanEnabled flag.
     * @type {MFVideoArea}
     */
    PanScanAperture{
        get {
            if(!this.HasProp("__PanScanAperture"))
                this.__PanScanAperture := MFVideoArea(88, this)
            return this.__PanScanAperture
        }
    }

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoflags">MFVideoFlags</a> enumeration.
     * @type {Integer}
     */
    VideoFlags {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }
}
