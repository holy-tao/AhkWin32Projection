#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFVideoTransferFunction.ahk" { MFVideoTransferFunction }
#Import ".\MFVideoArea.ahk" { MFVideoArea }
#Import ".\MFOffset.ahk" { MFOffset }
#Import ".\MFVideoPrimaries.ahk" { MFVideoPrimaries }
#Import ".\MFVideoChromaSubsampling.ahk" { MFVideoChromaSubsampling }
#Import ".\MFRatio.ahk" { MFRatio }
#Import ".\MFVideoLighting.ahk" { MFVideoLighting }
#Import ".\MFVideoTransferMatrix.ahk" { MFVideoTransferMatrix }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import ".\MFNominalRange.ahk" { MFNominalRange }
#Import ".\MFVideoInterlaceMode.ahk" { MFVideoInterlaceMode }

/**
 * Contains video format information that applies to both compressed and uncompressed formats.This structure is used in the MFVIDEOFORMAT structure.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfvideoinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoInfo {
    #StructPack 8

    /**
     * Width of the decoded image, in pixels.
     */
    dwWidth : UInt32

    /**
     * Height of the decoded image, in pixels.
     */
    dwHeight : UInt32

    /**
     * Pixel aspect ratio, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfratio">MFRatio</a> structure.
     */
    PixelAspectRatio : MFRatio

    /**
     * Chroma sub-sampling of the original image, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideochromasubsampling">MFVideoChromaSubsampling</a> enumeration.
     */
    SourceChromaSubsampling : MFVideoChromaSubsampling

    /**
     * Image interlacing, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration.
     */
    InterlaceMode : MFVideoInterlaceMode

    /**
     * R'G'B' gamma curve function, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideotransferfunction">MFVideoTransferFunction</a> enumeration.
     */
    TransferFunction : MFVideoTransferFunction

    /**
     * Color primaries of the video source, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoprimaries">MFVideoPrimaries</a> enumeration. This value provides the conversion from R'G'B' to linear RGB.
     */
    ColorPrimaries : MFVideoPrimaries

    /**
     * Conversion matrix from Y'Cb'Cr' to R'G'B, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideotransfermatrix">MFVideoTransferMatrix</a> enumeration.
     */
    TransferMatrix : MFVideoTransferMatrix

    /**
     * Intended viewing conditions, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideolighting">MFVideoLighting</a> enumeration.
     */
    SourceLighting : MFVideoLighting

    /**
     * Frames per second, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfratio">MFRatio</a> structure. If the frame rate is unknown or variable, the numerator and denominator should both be set to zero. It is invalid for only one member of the <b>MFRatio</b> structure to be zero.
     */
    FramesPerSecond : MFRatio

    /**
     * Range of valid RGB values, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfnominalrange">MFNominalRange</a> enumeration. The value indicates whether color values contain headroom and toeroom.
     */
    NominalRange : MFNominalRange

    /**
     * Geometric aperture, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-geometric-aperture-attribute">MF_MT_GEOMETRIC_APERTURE</a>.
     */
    GeometricAperture : MFVideoArea

    /**
     * The display aperture, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. The display aperture is the region of the video image that is intended to be shown. Any data outside of this area is the overscan region. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-minimum-display-aperture-attribute">MF_MT_MINIMUM_DISPLAY_APERTURE</a>.
     */
    MinimumDisplayAperture : MFVideoArea

    /**
     * Pan-scan rectangle, specified as an <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfvideoarea">MFVideoArea</a> structure. The pan-scan rectangle defines a region of the image that is displayed in pan-and-scan mode. It can be used when wide-screen content is shown on a 4 x 3 display. The value is valid only when the <b>VideoFlags</b> member contains the MFVideoFlag_PanScanEnabled flag.
     */
    PanScanAperture : MFVideoArea

    /**
     * Bitwise <b>OR</b> of zero or more flags from the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideoflags">MFVideoFlags</a> enumeration.
     */
    VideoFlags : Int64

}
