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
     * Adds a cubic polynomial segment that describes the shape of a transition curve to the animation function.
     * @param {Integer} dimension The dimension in which to apply the new segment.
     * @param {Float} beginOffset The begin offset for the segment, where 0 corresponds to the start of the transition.
     * @param {Float} constantCoefficient The cubic polynomial constant coefficient.
     * @param {Float} linearCoefficient The cubic polynomial linear coefficient.
     * @param {Float} quadraticCoefficient The cubic polynomial quadratic coefficient.
     * @param {Float} cubicCoefficient The cubic polynomial cubic coefficient.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationprimitiveinterpolation-addcubic
     */
    AddCubic(dimension, beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(3, this, "uint", dimension, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "HRESULT")
        return result
    }

    /**
     * Adds a sinusoidal segment that describes the shape of a transition curve to the animation function.
     * @param {Integer} dimension The dimension in which to apply the new segment.
     * @param {Float} beginOffset The begin offset for the segment, where 0 corresponds to the start of the transition.
     * @param {Float} bias The bias constant in the sinusoidal function.
     * @param {Float} amplitude The amplitude constant in the sinusoidal function.
     * @param {Float} frequency The frequency constant in the sinusoidal function.
     * @param {Float} phase The phase constant in the sinusoidal function.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationprimitiveinterpolation-addsinusoidal
     */
    AddSinusoidal(dimension, beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(4, this, "uint", dimension, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "HRESULT")
        return result
    }
}
