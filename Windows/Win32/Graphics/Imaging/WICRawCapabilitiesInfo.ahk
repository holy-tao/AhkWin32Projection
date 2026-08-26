#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WICRawCapabilities.ahk
#Include .\WICRawRotationCapabilities.ahk

/**
 * Defines raw codec capabilities.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrawcapabilitiesinfo
 * @namespace Windows.Win32.Graphics.Imaging
 */
class WICRawCapabilitiesInfo extends Win32Struct {
    static sizeof => 72

    static packingSize => 4

    /**
     * Type: <b>UINT</b>
     * 
     * Size of the <b>WICRawCapabilitiesInfo</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The codec's major version.
     * @type {Integer}
     */
    CodecMajorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The codec's minor version.
     * @type {Integer}
     */
    CodecMinorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of exposure compensation support.
     * @type {WICRawCapabilities}
     */
    ExposureCompensationSupport {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of contrast support.
     * @type {WICRawCapabilities}
     */
    ContrastSupport {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of RGB white point support.
     * @type {WICRawCapabilities}
     */
    RGBWhitePointSupport {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a> support.
     * @type {WICRawCapabilities}
     */
    NamedWhitePointSupport {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a> mask.
     * @type {Integer}
     */
    NamedWhitePointSupportMask {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of kelvin white point support.
     * @type {WICRawCapabilities}
     */
    KelvinWhitePointSupport {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of gamma support.
     * @type {WICRawCapabilities}
     */
    GammaSupport {
        get => NumGet(this, 36, "int")
        set => NumPut("int", value, this, 36)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of tint support.
     * @type {WICRawCapabilities}
     */
    TintSupport {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of saturation support.
     * @type {WICRawCapabilities}
     */
    SaturationSupport {
        get => NumGet(this, 44, "int")
        set => NumPut("int", value, this, 44)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of sharpness support.
     * @type {WICRawCapabilities}
     */
    SharpnessSupport {
        get => NumGet(this, 48, "int")
        set => NumPut("int", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of noise reduction support.
     * @type {WICRawCapabilities}
     */
    NoiseReductionSupport {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of destination color profile support.
     * @type {WICRawCapabilities}
     */
    DestinationColorProfileSupport {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of tone curve support.
     * @type {WICRawCapabilities}
     */
    ToneCurveSupport {
        get => NumGet(this, 60, "int")
        set => NumPut("int", value, this, 60)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrotationcapabilities">WICRawRotationCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrotationcapabilities">WICRawRotationCapabilities</a> of rotation support.
     * @type {WICRawRotationCapabilities}
     */
    RotationSupport {
        get => NumGet(this, 64, "int")
        set => NumPut("int", value, this, 64)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a></b>
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawcapabilities">WICRawCapabilities</a> of <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrendermode">WICRawRenderMode</a> support.
     * @type {WICRawCapabilities}
     */
    RenderModeSupport {
        get => NumGet(this, 68, "int")
        set => NumPut("int", value, this, 68)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
