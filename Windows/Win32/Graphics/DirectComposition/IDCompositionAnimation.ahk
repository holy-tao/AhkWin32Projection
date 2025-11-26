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
     * Resets the animation function so that it contains no segments.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-reset
     */
    Reset() {
        result := ComCall(3, this, "HRESULT")
        return result
    }

    /**
     * Sets the absolute time at which the animation function starts.
     * @param {Integer} beginTime Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The starting time for this animation.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-setabsolutebegintime
     */
    SetAbsoluteBeginTime(beginTime) {
        result := ComCall(4, this, "int64", beginTime, "HRESULT")
        return result
    }

    /**
     * Adds a cubic polynomial segment to the animation function.
     * @param {Float} beginOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation function to the point when this segment should take effect.
     * @param {Float} constantCoefficient Type: <b>float</b>
     * 
     * The constant coefficient of the polynomial.
     * @param {Float} linearCoefficient Type: <b>float</b>
     * 
     * The linear coefficient of the polynomial.
     * @param {Float} quadraticCoefficient Type: <b>float</b>
     * 
     * The quadratic coefficient of the polynomial.
     * @param {Float} cubicCoefficient Type: <b>float</b>
     * 
     * The cubic coefficient of the polynomial.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-addcubic
     */
    AddCubic(beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(5, this, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "HRESULT")
        return result
    }

    /**
     * Adds a sinusoidal segment to the animation function.
     * @param {Float} beginOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation function to the point when this segment should take effect.
     * @param {Float} bias Type: <b>float</b>
     * 
     * A constant that is added to the sinusoidal.
     * @param {Float} amplitude Type: <b>float</b>
     * 
     * A scale factor that is applied to the sinusoidal.
     * @param {Float} frequency Type: <b>float</b>
     * 
     * A scale factor that is applied to the time offset, in Hertz.
     * @param {Float} phase Type: <b>float</b>
     * 
     * A constant that is added to the time offset, in degrees.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-addsinusoidal
     */
    AddSinusoidal(beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(6, this, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "HRESULT")
        return result
    }

    /**
     * Adds a repeat segment that causes the specified portion of an animation function to be repeated.
     * @param {Float} beginOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation to the point at which the repeat should begin.
     * @param {Float} durationToRepeat Type: <b>double</b>
     * 
     * The duration, in seconds, of a portion of the animation immediately preceding the begin time that is specified by <i>beginOffset</i>.  This is the portion that will be repeated.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-addrepeat
     */
    AddRepeat(beginOffset, durationToRepeat) {
        result := ComCall(7, this, "double", beginOffset, "double", durationToRepeat, "HRESULT")
        return result
    }

    /**
     * Adds an end segment that marks the end of an animation function.
     * @param {Float} endOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation function to the point when the function ends.
     * @param {Float} endValue Type: <b>float</b>
     * 
     * The final value of the animation.
     * @returns {HRESULT} Type: <b><a href="/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dcompanimation/nf-dcompanimation-idcompositionanimation-end
     */
    End(endOffset, endValue) {
        result := ComCall(8, this, "double", endOffset, "float", endValue, "HRESULT")
        return result
    }
}
