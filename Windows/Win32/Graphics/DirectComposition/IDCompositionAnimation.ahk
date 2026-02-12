#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a function for animating one or more properties of one or more Microsoft DirectComposition objects.
 * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nn-dcompanimation-idcompositionanimation
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
     * @remarks
     * This method returns the animation function to a clean state, as when the animation was first constructed. After this method is called, the next segment to be added becomes the first segment of the animation function. Because it is the first segment, it can have any non-negative beginning offset.
     * @returns {HRESULT} If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-reset
     */
    Reset() {
        result := ComCall(3, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets the absolute time at which the animation function starts.
     * @remarks
     * By default, an animation function starts when the first frame of the animation takes effect. For example, if an application creates a simple animation function with a single primitive at offset zero, associates the animation with some property,  and then calls the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositiondevice-commit">IDCompositionDevice::Commit</a> method, the first frame that includes the commit samples the animation at offset zero for the first primitive.
     * 
     * This implies that the actual default start time of all animations varies depending on the time between when the application creates the animation and calls <b>Commit</b>, to the time it takes the composition engine to pick up the committed changes. The application can use the <b>SetAbsoluteBeginTime</b> method to exercise finer control over the starting time of an animation.
     * 
     * 
     * 
     * This method does not control when animations take effect; it only affects how animations are sampled after they start. If the application specifies the exact time of the next frame as the absolute begin time, the result is the same as not calling this method at all. If the specified begin time is different from the time of the next frame, the result is one of following:
     * 
     * 
     * 
     * <ul>
     * <li>If the specified time is later than the next frame time, the animation start is delayed until the specified begin time.</li>
     * <li>If the specified time is earlier than the next frame time, the beginning of the animation is dropped and sampling starts into the animation function.
     * </li>
     * </ul>
     * @param {Integer} beginTime Type: <b><a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a></b>
     * 
     * The starting time for this animation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-setabsolutebegintime
     */
    SetAbsoluteBeginTime(beginTime) {
        result := ComCall(4, this, "int64", beginTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a cubic polynomial segment to the animation function.
     * @remarks
     * A cubic segment transitions time along a cubic polynomial.  For a given time input (t), the output value is given by the following equation.
     * 
     * 
     * 
     * <i>x</i>(<i>t</i>) = <i>at</i>³ + <i>bt</i>² + <i>ct</i> + <i>d</i>
     * 
     * This method fails if any of the parameters are NaN, positive infinity, or negative infinity.
     * 
     * Because animation segments must be added in increasing order, this method fails if the <i>beginOffset</i> parameter is less than or equal to the <i>beginOffset</i> parameter of the previous segment, if any.
     * 
     * This animation segment remains in effect until the begin time of the next segment in the animation function. If the animation function contains no more segments, this segment remains in effect indefinitely. 
     * 
     * If all coefficients except <i>constantCoefficient</i>  are zero, the value of this segment remains constant over time, and the animation does not cause a recomposition for the duration of the segment.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-addcubic
     */
    AddCubic(beginOffset, constantCoefficient, linearCoefficient, quadraticCoefficient, cubicCoefficient) {
        result := ComCall(5, this, "double", beginOffset, "float", constantCoefficient, "float", linearCoefficient, "float", quadraticCoefficient, "float", cubicCoefficient, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a sinusoidal segment to the animation function.
     * @remarks
     * This method fails if any of the parameters are NaN, positive infinity, or negative infinity, or if the <i>beginOffset</i> parameter is negative.
     * 
     * 
     * 
     * Because animation segments must be added in increasing order, this method fails if the <i>beginOffset</i> parameter is less than or equal to the <i>beginOffset</i> parameter of the previous segment, if any.
     * 
     * This animation segment remains in effect until the begin time of the next segment in the animation function. If the animation function contains no more segments, this segment remains in effect indefinitely.
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
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-addsinusoidal
     */
    AddSinusoidal(beginOffset, bias, amplitude, frequency, phase) {
        result := ComCall(6, this, "double", beginOffset, "float", bias, "float", amplitude, "float", frequency, "float", phase, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds a repeat segment that causes the specified portion of an animation function to be repeated.
     * @remarks
     * This method fails if any of the parameters are NaN, positive infinity, or negative infinity.
     * 
     * Because animation segments must be added in increasing order, this method fails if the <i>beginOffset</i> parameter is less than or equal to the <i>beginOffset</i> parameter of the previous segment. This method also fails if this is the first segment to be added to the animation function.
     * 
     * This animation segment remains in effect until the begin time of the next segment. If the animation function contains no more segments, this segment remains in effect indefinitely.
     * @param {Float} beginOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation to the point at which the repeat should begin.
     * @param {Float} durationToRepeat Type: <b>double</b>
     * 
     * The duration, in seconds, of a portion of the animation immediately preceding the begin time that is specified by <i>beginOffset</i>.  This is the portion that will be repeated.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-addrepeat
     */
    AddRepeat(beginOffset, durationToRepeat) {
        result := ComCall(7, this, "double", beginOffset, "double", durationToRepeat, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Adds an end segment that marks the end of an animation function.
     * @remarks
     * When the specified offset is reached, the property or properties affected by this animation are set to the specified final value, and then the animation stops. If no end segment is added, the final segment of the animation function runs indefinitely. Calling this method is semantically identical to making the last segment of the animation function a cubic polynomial where the cubic, quadratic, and linear coefficients are all zeros, and the constant coefficient is the desired final value.
     * 
     * Because animation segments must be added in increasing order, this method fails if the <i>endOffset</i> parameter is less than or equal to the <i>beginOffset</i> parameter of the previous segment. This method also fails if this is the first segment to be added to the animation function.
     * 
     * After this method is called, all methods on this animation object fail except the <a href="https://docs.microsoft.com/windows/desktop/api/dcompanimation/nf-dcompanimation-idcompositionanimation-reset">IDCompositionAnimation::Reset</a> method.
     * @param {Float} endOffset Type: <b>double</b>
     * 
     * The offset, in seconds, from the beginning of the animation function to the point when the function ends.
     * @param {Float} endValue Type: <b>float</b>
     * 
     * The final value of the animation.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * If the function succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/directcomp/directcomposition-error-codes">DirectComposition Error Codes</a>  for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/dcompanimation/nf-dcompanimation-idcompositionanimation-end
     */
    End(endOffset, endValue) {
        result := ComCall(8, this, "double", endOffset, "float", endValue, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
