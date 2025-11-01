#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<WICRawCapabilitiesInfo>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-queryrawcapabilitiesinfo
     */
    QueryRawCapabilitiesInfo(pInfo) {
        result := ComCall(11, this, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ParameterSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-loadparameterset
     */
    LoadParameterSet(ParameterSet) {
        result := ComCall(12, this, "int", ParameterSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyBag2>} ppCurrentParameterSet 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getcurrentparameterset
     */
    GetCurrentParameterSet(ppCurrentParameterSet) {
        result := ComCall(13, this, "ptr*", ppCurrentParameterSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} ev 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setexposurecompensation
     */
    SetExposureCompensation(ev) {
        result := ComCall(14, this, "double", ev, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pEV 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getexposurecompensation
     */
    GetExposureCompensation(pEV) {
        result := ComCall(15, this, "double*", pEV, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Red 
     * @param {Integer} Green 
     * @param {Integer} Blue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setwhitepointrgb
     */
    SetWhitePointRGB(Red, Green, Blue) {
        result := ComCall(16, this, "uint", Red, "uint", Green, "uint", Blue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRed 
     * @param {Pointer<Integer>} pGreen 
     * @param {Pointer<Integer>} pBlue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getwhitepointrgb
     */
    GetWhitePointRGB(pRed, pGreen, pBlue) {
        result := ComCall(17, this, "uint*", pRed, "uint*", pGreen, "uint*", pBlue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} WhitePoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setnamedwhitepoint
     */
    SetNamedWhitePoint(WhitePoint) {
        result := ComCall(18, this, "int", WhitePoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWhitePoint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getnamedwhitepoint
     */
    GetNamedWhitePoint(pWhitePoint) {
        result := ComCall(19, this, "int*", pWhitePoint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} WhitePointKelvin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setwhitepointkelvin
     */
    SetWhitePointKelvin(WhitePointKelvin) {
        result := ComCall(20, this, "uint", WhitePointKelvin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pWhitePointKelvin 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getwhitepointkelvin
     */
    GetWhitePointKelvin(pWhitePointKelvin) {
        result := ComCall(21, this, "uint*", pWhitePointKelvin, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pMinKelvinTemp 
     * @param {Pointer<Integer>} pMaxKelvinTemp 
     * @param {Pointer<Integer>} pKelvinTempStepValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getkelvinrangeinfo
     */
    GetKelvinRangeInfo(pMinKelvinTemp, pMaxKelvinTemp, pKelvinTempStepValue) {
        result := ComCall(22, this, "uint*", pMinKelvinTemp, "uint*", pMaxKelvinTemp, "uint*", pKelvinTempStepValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Contrast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setcontrast
     */
    SetContrast(Contrast) {
        result := ComCall(23, this, "double", Contrast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pContrast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getcontrast
     */
    GetContrast(pContrast) {
        result := ComCall(24, this, "double*", pContrast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Gamma 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setgamma
     */
    SetGamma(Gamma) {
        result := ComCall(25, this, "double", Gamma, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pGamma 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getgamma
     */
    GetGamma(pGamma) {
        result := ComCall(26, this, "double*", pGamma, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Sharpness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setsharpness
     */
    SetSharpness(Sharpness) {
        result := ComCall(27, this, "double", Sharpness, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pSharpness 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getsharpness
     */
    GetSharpness(pSharpness) {
        result := ComCall(28, this, "double*", pSharpness, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Saturation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setsaturation
     */
    SetSaturation(Saturation) {
        result := ComCall(29, this, "double", Saturation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pSaturation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getsaturation
     */
    GetSaturation(pSaturation) {
        result := ComCall(30, this, "double*", pSaturation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Tint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-settint
     */
    SetTint(Tint) {
        result := ComCall(31, this, "double", Tint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pTint 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-gettint
     */
    GetTint(pTint) {
        result := ComCall(32, this, "double*", pTint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} NoiseReduction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setnoisereduction
     */
    SetNoiseReduction(NoiseReduction) {
        result := ComCall(33, this, "double", NoiseReduction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pNoiseReduction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getnoisereduction
     */
    GetNoiseReduction(pNoiseReduction) {
        result := ComCall(34, this, "double*", pNoiseReduction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICColorContext} pColorContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setdestinationcolorcontext
     */
    SetDestinationColorContext(pColorContext) {
        result := ComCall(35, this, "ptr", pColorContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbToneCurveSize 
     * @param {Pointer} pToneCurve 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-settonecurve
     */
    SetToneCurve(cbToneCurveSize, pToneCurve) {
        result := ComCall(36, this, "uint", cbToneCurveSize, "ptr", pToneCurve, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cbToneCurveBufferSize 
     * @param {Pointer} pToneCurve 
     * @param {Pointer<Integer>} pcbActualToneCurveBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-gettonecurve
     */
    GetToneCurve(cbToneCurveBufferSize, pToneCurve, pcbActualToneCurveBufferSize) {
        result := ComCall(37, this, "uint", cbToneCurveBufferSize, "ptr", pToneCurve, "uint*", pcbActualToneCurveBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} Rotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setrotation
     */
    SetRotation(Rotation) {
        result := ComCall(38, this, "double", Rotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pRotation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getrotation
     */
    GetRotation(pRotation) {
        result := ComCall(39, this, "double*", pRotation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} RenderMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setrendermode
     */
    SetRenderMode(RenderMode) {
        result := ComCall(40, this, "int", RenderMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pRenderMode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-getrendermode
     */
    GetRenderMode(pRenderMode) {
        result := ComCall(41, this, "int*", pRenderMode, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IWICDevelopRawNotificationCallback} pCallback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wincodec/nf-wincodec-iwicdevelopraw-setnotificationcallback
     */
    SetNotificationCallback(pCallback) {
        result := ComCall(42, this, "ptr", pCallback, "HRESULT")
        return result
    }
}
