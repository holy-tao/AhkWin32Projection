#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\IPropertyBag2.ahk
#Include .\IWICBitmapFrameDecode.ahk

/**
 * Exposes methods that provide access to the capabilites of a raw codec format.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/nn-wincodec-iwicdevelopraw
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class IWICDevelopRaw extends IWICBitmapFrameDecode{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWICDevelopRaw
     * @type {Guid}
     */
    static IID => Guid("{fbec5e44-f7be-4b65-b7f8-c0c81fef026d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryRawCapabilitiesInfo", "LoadParameterSet", "GetCurrentParameterSet", "SetExposureCompensation", "GetExposureCompensation", "SetWhitePointRGB", "GetWhitePointRGB", "SetNamedWhitePoint", "GetNamedWhitePoint", "SetWhitePointKelvin", "GetWhitePointKelvin", "GetKelvinRangeInfo", "SetContrast", "GetContrast", "SetGamma", "GetGamma", "SetSharpness", "GetSharpness", "SetSaturation", "GetSaturation", "SetTint", "GetTint", "SetNoiseReduction", "GetNoiseReduction", "SetDestinationColorContext", "SetToneCurve", "GetToneCurve", "SetRotation", "GetRotation", "SetRenderMode", "GetRenderMode", "SetNotificationCallback"]

    /**
     * Retrieves information about which capabilities are supported for a raw image.
     * @param {Pointer<WICRawCapabilitiesInfo>} pInfo Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawcapabilitiesinfo">WICRawCapabilitiesInfo</a>*</b>
     * 
     * A pointer that receives <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawcapabilitiesinfo">WICRawCapabilitiesInfo</a> that provides the capabilities supported by the raw image.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-queryrawcapabilitiesinfo
     */
    QueryRawCapabilitiesInfo(pInfo) {
        result := ComCall(11, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * Sets the desired WICRawParameterSet option.
     * @param {Integer} ParameterSet Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawparameterset">WICRawParameterSet</a></b>
     * 
     * The desired <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawparameterset">WICRawParameterSet</a> option.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-loadparameterset
     */
    LoadParameterSet(ParameterSet) {
        result := ComCall(12, this, "int", ParameterSet, "HRESULT")
        return result
    }

    /**
     * Gets the current set of parameters.
     * @returns {IPropertyBag2} Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/internet-explorer/ie-developer/platform-apis/aa768192(v=vs.85)">IPropertyBag2</a>**</b>
     * 
     * A pointer that receives a pointer to the current set of parameters.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getcurrentparameterset
     */
    GetCurrentParameterSet() {
        result := ComCall(13, this, "ptr*", &ppCurrentParameterSet := 0, "HRESULT")
        return IPropertyBag2(ppCurrentParameterSet)
    }

    /**
     * Sets the exposure compensation stop value.
     * @param {Float} ev Type: <b>double</b>
     * 
     * The exposure compensation value. The value range for exposure compensation is -5.0 through +5.0, which equates to 10 full stops.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setexposurecompensation
     */
    SetExposureCompensation(ev) {
        result := ComCall(14, this, "double", ev, "HRESULT")
        return result
    }

    /**
     * Gets the exposure compensation stop value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the exposure compensation stop value. The default is the "as-shot" setting.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getexposurecompensation
     */
    GetExposureCompensation() {
        result := ComCall(15, this, "double*", &pEV := 0, "HRESULT")
        return pEV
    }

    /**
     * Sets the white point RGB values.
     * @param {Integer} Red Type: <b>UINT</b>
     * 
     * The red white point value.
     * @param {Integer} Green Type: <b>UINT</b>
     * 
     * The green white point value.
     * @param {Integer} Blue Type: <b>UINT</b>
     * 
     * The blue white point value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setwhitepointrgb
     */
    SetWhitePointRGB(Red, Green, Blue) {
        result := ComCall(16, this, "uint", Red, "uint", Green, "uint", Blue, "HRESULT")
        return result
    }

    /**
     * Gets the white point RGB values.
     * @param {Pointer<Integer>} pRed Type: <b>UINT*</b>
     * 
     * A pointer that receives the red white point value.
     * @param {Pointer<Integer>} pGreen Type: <b>UINT*</b>
     * 
     * A pointer that receives the green white point value.
     * @param {Pointer<Integer>} pBlue Type: <b>UINT*</b>
     * 
     * A pointer that receives the blue white point value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getwhitepointrgb
     */
    GetWhitePointRGB(pRed, pGreen, pBlue) {
        pRedMarshal := pRed is VarRef ? "uint*" : "ptr"
        pGreenMarshal := pGreen is VarRef ? "uint*" : "ptr"
        pBlueMarshal := pBlue is VarRef ? "uint*" : "ptr"

        result := ComCall(17, this, pRedMarshal, pRed, pGreenMarshal, pGreen, pBlueMarshal, pBlue, "HRESULT")
        return result
    }

    /**
     * Sets the named white point of the raw file.
     * @param {Integer} WhitePoint Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a></b>
     * 
     * A bitwise combination of the enumeration values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setnamedwhitepoint
     */
    SetNamedWhitePoint(WhitePoint) {
        result := ComCall(18, this, "int", WhitePoint, "HRESULT")
        return result
    }

    /**
     * Gets the named white point of the raw image.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicnamedwhitepoint">WICNamedWhitePoint</a>*</b>
     * 
     * A pointer that receives the bitwise combination of the enumeration values.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getnamedwhitepoint
     */
    GetNamedWhitePoint() {
        result := ComCall(19, this, "int*", &pWhitePoint := 0, "HRESULT")
        return pWhitePoint
    }

    /**
     * Sets the white point Kelvin value.
     * @param {Integer} WhitePointKelvin Type: <b>UINT</b>
     * 
     * The white point Kelvin value. Acceptable Kelvin values are 1,500 through 30,000.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setwhitepointkelvin
     */
    SetWhitePointKelvin(WhitePointKelvin) {
        result := ComCall(20, this, "uint", WhitePointKelvin, "HRESULT")
        return result
    }

    /**
     * Gets the white point Kelvin temperature of the raw image.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A pointer that receives the white point Kelvin temperature of the raw image. The default is the "as-shot" setting value.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getwhitepointkelvin
     */
    GetWhitePointKelvin() {
        result := ComCall(21, this, "uint*", &pWhitePointKelvin := 0, "HRESULT")
        return pWhitePointKelvin
    }

    /**
     * Gets the information about the current Kelvin range of the raw image.
     * @param {Pointer<Integer>} pMinKelvinTemp Type: <b>UINT*</b>
     * 
     * A pointer that receives the minimum Kelvin temperature.
     * @param {Pointer<Integer>} pMaxKelvinTemp Type: <b>UINT*</b>
     * 
     * A pointer that receives the maximum Kelvin temperature.
     * @param {Pointer<Integer>} pKelvinTempStepValue Type: <b>UINT*</b>
     * 
     * A pointer that receives the Kelvin step value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getkelvinrangeinfo
     */
    GetKelvinRangeInfo(pMinKelvinTemp, pMaxKelvinTemp, pKelvinTempStepValue) {
        pMinKelvinTempMarshal := pMinKelvinTemp is VarRef ? "uint*" : "ptr"
        pMaxKelvinTempMarshal := pMaxKelvinTemp is VarRef ? "uint*" : "ptr"
        pKelvinTempStepValueMarshal := pKelvinTempStepValue is VarRef ? "uint*" : "ptr"

        result := ComCall(22, this, pMinKelvinTempMarshal, pMinKelvinTemp, pMaxKelvinTempMarshal, pMaxKelvinTemp, pKelvinTempStepValueMarshal, pKelvinTempStepValue, "HRESULT")
        return result
    }

    /**
     * Sets the contrast value of the raw image.
     * @param {Float} Contrast Type: <b>double</b>
     * 
     * The contrast value of the raw image.  The default value is the "as-shot" setting. The value range for contrast is 0.0 through 1.0. The 0.0 lower limit represents no contrast applied to the image, while the 1.0 upper limit represents the highest amount of contrast that can be applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setcontrast
     */
    SetContrast(Contrast) {
        result := ComCall(23, this, "double", Contrast, "HRESULT")
        return result
    }

    /**
     * Gets the contrast value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the contrast value of the raw image. The default value is the "as-shot" setting. The value range for contrast is 0.0 through 1.0. The 0.0 lower limit represents no contrast applied to the image, while the 1.0 upper limit represents the highest amount of contrast that can be applied.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getcontrast
     */
    GetContrast() {
        result := ComCall(24, this, "double*", &pContrast := 0, "HRESULT")
        return pContrast
    }

    /**
     * Sets the desired gamma value.
     * @param {Float} Gamma Type: <b>double</b>
     * 
     * The desired gamma value.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setgamma
     */
    SetGamma(Gamma) {
        result := ComCall(25, this, "double", Gamma, "HRESULT")
        return result
    }

    /**
     * Gets the current gamma setting of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the current gamma setting.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getgamma
     */
    GetGamma() {
        result := ComCall(26, this, "double*", &pGamma := 0, "HRESULT")
        return pGamma
    }

    /**
     * Sets the sharpness value of the raw image.
     * @param {Float} Sharpness Type: <b>double</b>
     * 
     * The sharpness value of the raw image. The default value is the "as-shot" setting. The value range for sharpness is 0.0 through 1.0. The 0.0 lower limit represents no sharpening applied to the image, while the 1.0 upper limit represents the highest amount of sharpness that can be applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setsharpness
     */
    SetSharpness(Sharpness) {
        result := ComCall(27, this, "double", Sharpness, "HRESULT")
        return result
    }

    /**
     * Gets the sharpness value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the sharpness value of the raw image. The default value is the "as-shot" setting. The value range for sharpness is 0.0 through 1.0. The 0.0 lower limit represents no sharpening applied to the image, while the 1.0 upper limit represents the highest amount of sharpness that can be applied.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getsharpness
     */
    GetSharpness() {
        result := ComCall(28, this, "double*", &pSharpness := 0, "HRESULT")
        return pSharpness
    }

    /**
     * Sets the saturation value of the raw image.
     * @param {Float} Saturation Type: <b>double</b>
     * 
     * The saturation value of the raw image. The value range for saturation is 0.0 through 1.0. A value of 0.0 represents an image with a fully de-saturated image, while a value of 1.0 represents the highest amount of saturation that can be applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setsaturation
     */
    SetSaturation(Saturation) {
        result := ComCall(29, this, "double", Saturation, "HRESULT")
        return result
    }

    /**
     * Gets the saturation value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the saturation value of the raw image. The default value is the "as-shot" setting. The value range for saturation is 0.0 through 1.0. A value of 0.0 represents an image with a fully de-saturated image, while a value of 1.0 represents the highest amount of saturation that can be applied.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getsaturation
     */
    GetSaturation() {
        result := ComCall(30, this, "double*", &pSaturation := 0, "HRESULT")
        return pSaturation
    }

    /**
     * Sets the tint value of the raw image.
     * @param {Float} Tint Type: <b>double</b>
     * 
     * The tint value of the raw image. The default value is the "as-shot" setting if it exists or 0.0. The value range for sharpness is -1.0 through +1.0. The -1.0 lower limit represents a full green bias to the image, while the 1.0 upper limit represents a full magenta bias.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-settint
     */
    SetTint(Tint) {
        result := ComCall(31, this, "double", Tint, "HRESULT")
        return result
    }

    /**
     * Gets the tint value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the tint value of the raw image. The default value is the "as-shot" setting if it exists or 0.0. The value range for sharpness is -1.0 through +1.0. The -1.0 lower limit represents a full green bias to the image, while the 1.0 upper limit represents a full magenta bias.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-gettint
     */
    GetTint() {
        result := ComCall(32, this, "double*", &pTint := 0, "HRESULT")
        return pTint
    }

    /**
     * Sets the noise reduction value of the raw image.
     * @param {Float} NoiseReduction Type: <b>double</b>
     * 
     * The noise reduction value of the raw image.  The default value is the "as-shot" setting if it exists or 0.0. The value range for noise reduction is 0.0 through 1.0. The 0.0 lower limit represents no noise reduction applied to the image, while the 1.0 upper limit represents highest noise reduction amount that can be applied.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setnoisereduction
     */
    SetNoiseReduction(NoiseReduction) {
        result := ComCall(33, this, "double", NoiseReduction, "HRESULT")
        return result
    }

    /**
     * Gets the noise reduction value of the raw image.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the noise reduction value of the raw image.  The default value is the "as-shot" setting if it exists or 0.0. The value range for noise reduction is 0.0 through 1.0. The 0.0 lower limit represents no noise reduction applied to the image, while the 1.0 upper limit represents full highest noise reduction amount that can be applied.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getnoisereduction
     */
    GetNoiseReduction() {
        result := ComCall(34, this, "double*", &pNoiseReduction := 0, "HRESULT")
        return pNoiseReduction
    }

    /**
     * Sets the destination color context.
     * @param {IWICColorContext} pColorContext Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwiccolorcontext">IWICColorContext</a>*</b>
     * 
     * The destination color context.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setdestinationcolorcontext
     */
    SetDestinationColorContext(pColorContext) {
        result := ComCall(35, this, "ptr", pColorContext, "HRESULT")
        return result
    }

    /**
     * Sets the tone curve for the raw image.
     * @param {Integer} cbToneCurveSize Type: <b>UINT</b>
     * 
     * The size of the <i>pToneCurve</i> structure.
     * @param {Pointer} pToneCurve Type: <b>const <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawtonecurve">WICRawToneCurve</a>*</b>
     * 
     * The desired tone curve.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-settonecurve
     */
    SetToneCurve(cbToneCurveSize, pToneCurve) {
        result := ComCall(36, this, "uint", cbToneCurveSize, "ptr", pToneCurve, "HRESULT")
        return result
    }

    /**
     * Gets the tone curve of the raw image.
     * @param {Integer} cbToneCurveBufferSize Type: <b>UINT</b>
     * 
     * The size of the <i>pToneCurve</i> buffer.
     * @param {Pointer} pToneCurve Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawtonecurve">WICRawToneCurve</a>*</b>
     * 
     * A pointer that receives the <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawtonecurve">WICRawToneCurve</a> of the raw image.
     * @param {Pointer<Integer>} pcbActualToneCurveBufferSize Type: <b>UINT*</b>
     * 
     * A pointer that receives the size needed to obtain the tone curve structure.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-gettonecurve
     */
    GetToneCurve(cbToneCurveBufferSize, pToneCurve, pcbActualToneCurveBufferSize) {
        pcbActualToneCurveBufferSizeMarshal := pcbActualToneCurveBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(37, this, "uint", cbToneCurveBufferSize, "ptr", pToneCurve, pcbActualToneCurveBufferSizeMarshal, pcbActualToneCurveBufferSize, "HRESULT")
        return result
    }

    /**
     * Sets the desired rotation angle.
     * @param {Float} Rotation Type: <b>double</b>
     * 
     * The desired rotation angle.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setrotation
     */
    SetRotation(Rotation) {
        result := ComCall(38, this, "double", Rotation, "HRESULT")
        return result
    }

    /**
     * Gets the current rotation angle.
     * @returns {Float} Type: <b>double*</b>
     * 
     * A pointer that receives the current rotation angle.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getrotation
     */
    GetRotation() {
        result := ComCall(39, this, "double*", &pRotation := 0, "HRESULT")
        return pRotation
    }

    /**
     * Sets the current WICRawRenderMode.
     * @param {Integer} RenderMode Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrendermode">WICRawRenderMode</a></b>
     * 
     * The render mode to use.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setrendermode
     */
    SetRenderMode(RenderMode) {
        result := ComCall(40, this, "int", RenderMode, "HRESULT")
        return result
    }

    /**
     * Gets the current WICRawRenderMode.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrendermode">WICRawRenderMode</a>*</b>
     * 
     * A pointer that receives the current <a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ne-wincodec-wicrawrendermode">WICRawRenderMode</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-getrendermode
     */
    GetRenderMode() {
        result := ComCall(41, this, "int*", &pRenderMode := 0, "HRESULT")
        return pRenderMode
    }

    /**
     * Sets the notification callback method.
     * @param {IWICDevelopRawNotificationCallback} pCallback Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/nn-wincodec-iwicdeveloprawnotificationcallback">IWICDevelopRawNotificationCallback</a>*</b>
     * 
     * Pointer to the notification callback method.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wincodec/nf-wincodec-iwicdevelopraw-setnotificationcallback
     */
    SetNotificationCallback(pCallback) {
        result := ComCall(42, this, "ptr", pCallback, "HRESULT")
        return result
    }
}
