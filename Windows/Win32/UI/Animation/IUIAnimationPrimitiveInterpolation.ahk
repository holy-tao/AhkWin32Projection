#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method that allows a custom interpolator to provide transition information, in the form of a cubic polynomial curve, to the animation manager.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationprimitiveinterpolation
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationPrimitiveInterpolation extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationPrimitiveInterpolation
     * @type {Guid}
     */
    static IID => Guid("{bab20d63-4361-45da-a24f-ab8508846b5b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddCubic", "AddSinusoidal"]

    /**
     * 
     * @param {Integer} dimension 
     * @param {Float} beginOffset 
     * @param {Float} constantCoefficient 
     * @param {Float} linearCoefficient 
     * @param {Float} quadraticCoefficient 
     * @param {Float} cubicCoefficient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationprimitiveinterpolation-addcubic
     */
    AddCubic(dimension, beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(3, this, "uint", dimension, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dimension 
     * @param {Float} beginOffset 
     * @param {Float} bias 
     * @param {Float} amplitude 
     * @param {Float} frequency 
     * @param {Float} phase 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationprimitiveinterpolation-addsinusoidal
     */
    AddSinusoidal(dimension, beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(4, this, "uint", dimension, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "HRESULT")
        return result
    }
}
