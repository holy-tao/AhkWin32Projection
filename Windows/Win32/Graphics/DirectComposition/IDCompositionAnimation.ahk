#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a function for animating one or more properties of one or more Microsoft DirectComposition objects.
 * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nn-dcompanimation-idcompositionanimation
 * @namespace Windows.Win32.Graphics.DirectComposition
 * @version v4.0.30319
 */
class IDCompositionAnimation extends IUnknown{
    /**
     * The interface identifier for IDCompositionAnimation
     * @type {Guid}
     */
    static IID => Guid("{cbfd91d9-51b2-45e4-b3de-d19ccfb863c5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} beginTime 
     * @returns {HRESULT} 
     */
    SetAbsoluteBeginTime(beginTime) {
        result := ComCall(4, this, "int64", beginTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} beginOffset 
     * @param {Float} constantCoefficient 
     * @param {Float} linearCoefficient 
     * @param {Float} quadraticCoefficient 
     * @param {Float} cubicCoefficient 
     * @returns {HRESULT} 
     */
    AddCubic(beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(5, this, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} beginOffset 
     * @param {Float} bias 
     * @param {Float} amplitude 
     * @param {Float} frequency 
     * @param {Float} phase 
     * @returns {HRESULT} 
     */
    AddSinusoidal(beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(6, this, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} beginOffset 
     * @param {Float} durationToRepeat 
     * @returns {HRESULT} 
     */
    AddRepeat(beginOffset, durationToRepeat) {
        result := ComCall(7, this, "double", beginOffset, "double", durationToRepeat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} endOffset 
     * @param {Float} endValue 
     * @returns {HRESULT} 
     */
    End(endOffset, endValue) {
        result := ComCall(8, this, "double", endOffset, "float", endValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
