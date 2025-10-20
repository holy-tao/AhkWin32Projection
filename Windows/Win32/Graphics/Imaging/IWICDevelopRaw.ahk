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
     * 
     * @param {Pointer<WICRawCapabilitiesInfo>} pInfo 
     * @returns {HRESULT} 
     */
    QueryRawCapabilitiesInfo(pInfo) {
        result := ComCall(11, this, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ParameterSet 
     * @returns {HRESULT} 
     */
    LoadParameterSet(ParameterSet) {
        result := ComCall(12, this, "int", ParameterSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyBag2>} ppCurrentParameterSet 
     * @returns {HRESULT} 
     */
    GetCurrentParameterSet(ppCurrentParameterSet) {
        result := ComCall(13, this, "ptr", ppCurrentParameterSet, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} ev 
     * @returns {HRESULT} 
     */
    SetExposureCompensation(ev) {
        result := ComCall(14, this, "double", ev, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pEV 
     * @returns {HRESULT} 
     */
    GetExposureCompensation(pEV) {
        result := ComCall(15, this, "double*", pEV, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Red 
     * @param {Integer} Green 
     * @param {Integer} Blue 
     * @returns {HRESULT} 
     */
    SetWhitePointRGB(Red, Green, Blue) {
        result := ComCall(16, this, "uint", Red, "uint", Green, "uint", Blue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pRed 
     * @param {Pointer<UInt32>} pGreen 
     * @param {Pointer<UInt32>} pBlue 
     * @returns {HRESULT} 
     */
    GetWhitePointRGB(pRed, pGreen, pBlue) {
        result := ComCall(17, this, "uint*", pRed, "uint*", pGreen, "uint*", pBlue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WhitePoint 
     * @returns {HRESULT} 
     */
    SetNamedWhitePoint(WhitePoint) {
        result := ComCall(18, this, "int", WhitePoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pWhitePoint 
     * @returns {HRESULT} 
     */
    GetNamedWhitePoint(pWhitePoint) {
        result := ComCall(19, this, "int*", pWhitePoint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} WhitePointKelvin 
     * @returns {HRESULT} 
     */
    SetWhitePointKelvin(WhitePointKelvin) {
        result := ComCall(20, this, "uint", WhitePointKelvin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pWhitePointKelvin 
     * @returns {HRESULT} 
     */
    GetWhitePointKelvin(pWhitePointKelvin) {
        result := ComCall(21, this, "uint*", pWhitePointKelvin, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pMinKelvinTemp 
     * @param {Pointer<UInt32>} pMaxKelvinTemp 
     * @param {Pointer<UInt32>} pKelvinTempStepValue 
     * @returns {HRESULT} 
     */
    GetKelvinRangeInfo(pMinKelvinTemp, pMaxKelvinTemp, pKelvinTempStepValue) {
        result := ComCall(22, this, "uint*", pMinKelvinTemp, "uint*", pMaxKelvinTemp, "uint*", pKelvinTempStepValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Contrast 
     * @returns {HRESULT} 
     */
    SetContrast(Contrast) {
        result := ComCall(23, this, "double", Contrast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pContrast 
     * @returns {HRESULT} 
     */
    GetContrast(pContrast) {
        result := ComCall(24, this, "double*", pContrast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Gamma 
     * @returns {HRESULT} 
     */
    SetGamma(Gamma) {
        result := ComCall(25, this, "double", Gamma, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pGamma 
     * @returns {HRESULT} 
     */
    GetGamma(pGamma) {
        result := ComCall(26, this, "double*", pGamma, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Sharpness 
     * @returns {HRESULT} 
     */
    SetSharpness(Sharpness) {
        result := ComCall(27, this, "double", Sharpness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pSharpness 
     * @returns {HRESULT} 
     */
    GetSharpness(pSharpness) {
        result := ComCall(28, this, "double*", pSharpness, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Saturation 
     * @returns {HRESULT} 
     */
    SetSaturation(Saturation) {
        result := ComCall(29, this, "double", Saturation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pSaturation 
     * @returns {HRESULT} 
     */
    GetSaturation(pSaturation) {
        result := ComCall(30, this, "double*", pSaturation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Tint 
     * @returns {HRESULT} 
     */
    SetTint(Tint) {
        result := ComCall(31, this, "double", Tint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pTint 
     * @returns {HRESULT} 
     */
    GetTint(pTint) {
        result := ComCall(32, this, "double*", pTint, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} NoiseReduction 
     * @returns {HRESULT} 
     */
    SetNoiseReduction(NoiseReduction) {
        result := ComCall(33, this, "double", NoiseReduction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pNoiseReduction 
     * @returns {HRESULT} 
     */
    GetNoiseReduction(pNoiseReduction) {
        result := ComCall(34, this, "double*", pNoiseReduction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICColorContext>} pColorContext 
     * @returns {HRESULT} 
     */
    SetDestinationColorContext(pColorContext) {
        result := ComCall(35, this, "ptr", pColorContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbToneCurveSize 
     * @param {Pointer} pToneCurve 
     * @returns {HRESULT} 
     */
    SetToneCurve(cbToneCurveSize, pToneCurve) {
        result := ComCall(36, this, "uint", cbToneCurveSize, "ptr", pToneCurve, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cbToneCurveBufferSize 
     * @param {Pointer} pToneCurve 
     * @param {Pointer<UInt32>} pcbActualToneCurveBufferSize 
     * @returns {HRESULT} 
     */
    GetToneCurve(cbToneCurveBufferSize, pToneCurve, pcbActualToneCurveBufferSize) {
        result := ComCall(37, this, "uint", cbToneCurveBufferSize, "ptr", pToneCurve, "uint*", pcbActualToneCurveBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} Rotation 
     * @returns {HRESULT} 
     */
    SetRotation(Rotation) {
        result := ComCall(38, this, "double", Rotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pRotation 
     * @returns {HRESULT} 
     */
    GetRotation(pRotation) {
        result := ComCall(39, this, "double*", pRotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} RenderMode 
     * @returns {HRESULT} 
     */
    SetRenderMode(RenderMode) {
        result := ComCall(40, this, "int", RenderMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pRenderMode 
     * @returns {HRESULT} 
     */
    GetRenderMode(pRenderMode) {
        result := ComCall(41, this, "int*", pRenderMode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IWICDevelopRawNotificationCallback>} pCallback 
     * @returns {HRESULT} 
     */
    SetNotificationCallback(pCallback) {
        result := ComCall(42, this, "ptr", pCallback, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
