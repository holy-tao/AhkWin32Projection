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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset", "SetAbsoluteBeginTime", "AddCubic", "AddSinusoidal", "AddRepeat", "End"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} beginTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-setabsolutebegintime
     */
    SetAbsoluteBeginTime(beginTime) {
        result := ComCall(4, this, "int64", beginTime, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-addcubic
     */
    AddCubic(beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(5, this, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-addsinusoidal
     */
    AddSinusoidal(beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(6, this, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} beginOffset 
     * @param {Float} durationToRepeat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-addrepeat
     */
    AddRepeat(beginOffset, durationToRepeat) {
        result := ComCall(7, this, "double", beginOffset, "double", durationToRepeat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} endOffset 
     * @param {Float} endValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/dcompanimation/nf-dcompanimation-idcompositionanimation-end
     */
    End(endOffset, endValue) {
        result := ComCall(8, this, "double", endOffset, "float", endValue, "HRESULT")
        return result
    }
}
