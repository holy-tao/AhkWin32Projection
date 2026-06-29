#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WICRawRotationCapabilities.ahk" { WICRawRotationCapabilities }
#Import ".\WICRawCapabilities.ahk" { WICRawCapabilities }

/**
 * Defines raw codec capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrawcapabilitiesinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawCapabilitiesInfo {
    #StructPack 4

    /**
     * Type: <b>UINT</b>
     * 
     * Size of the <b>WICRawCapabilitiesInfo</b> structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>UINT</b>
     * 
     * The codec's major version.
     */
    CodecMajorVersion : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The codec's minor version.
     */
    CodecMinorVersion : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of exposure compensation support.
     */
    ExposureCompensationSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of contrast support.
     */
    ContrastSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of RGB white point support.
     */
    RGBWhitePointSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a> support.
     */
    NamedWhitePointSupport : WICRawCapabilities

    /**
     * Type: <b>UINT</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a> mask.
     */
    NamedWhitePointSupportMask : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of kelvin white point support.
     */
    KelvinWhitePointSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of gamma support.
     */
    GammaSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of tint support.
     */
    TintSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of saturation support.
     */
    SaturationSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of sharpness support.
     */
    SharpnessSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of noise reduction support.
     */
    NoiseReductionSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of destination color profile support.
     */
    DestinationColorProfileSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of tone curve support.
     */
    ToneCurveSupport : WICRawCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrotationcapabilities">WICRawRotationCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrotationcapabilities">WICRawRotationCapabilities</a> of rotation support.
     */
    RotationSupport : WICRawRotationCapabilities

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrendermode">WICRawRenderMode</a> support.
     */
    RenderModeSupport : WICRawCapabilities

}
