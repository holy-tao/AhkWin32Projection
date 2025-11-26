#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationStoryboard2.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation variable, which represents a visual element that can be animated in multiple dimensions.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariable2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariable2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariable2
     * @type {Guid}
     */
    static IID => Guid("{4914b304-96ab-44d9-9e77-d5109b7e7466}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDimension", "GetValue", "GetVectorValue", "GetCurve", "GetVectorCurve", "GetFinalValue", "GetFinalVectorValue", "GetPreviousValue", "GetPreviousVectorValue", "GetIntegerValue", "GetIntegerVectorValue", "GetFinalIntegerValue", "GetFinalIntegerVectorValue", "GetPreviousIntegerValue", "GetPreviousIntegerVectorValue", "GetCurrentStoryboard", "SetLowerBound", "SetLowerBoundVector", "SetUpperBound", "SetUpperBoundVector", "SetRoundingMode", "SetTag", "GetTag", "SetVariableChangeHandler", "SetVariableIntegerChangeHandler", "SetVariableCurveChangeHandler"]

    /**
     * Gets the number of dimensions that the animation variable is to be animated in.
     * @returns {Integer} The number of dimensions.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getdimension
     */
    GetDimension() {
        result := ComCall(3, this, "uint*", &dimension := 0, "HRESULT")
        return dimension
    }

    /**
     * Gets the value of the animation variable.
     * @returns {Float} The value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getvalue
     */
    GetValue() {
        result := ComCall(4, this, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the value of the animation variable in the specified dimension.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getvectorvalue
     */
    GetVectorValue(cDimension) {
        result := ComCall(5, this, "double*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Gets the animation curve of the animation variable.
     * @param {IDCompositionAnimation} animation The object that generates a sequence of animation curve primitives.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getcurve
     */
    GetCurve(animation) {
        result := ComCall(6, this, "ptr", animation, "HRESULT")
        return result
    }

    /**
     * Gets the animation curve of the animation variable for the specified dimension.
     * @param {Pointer<IDCompositionAnimation>} animation The object that generates a sequence of animation curve primitives.
     * @param {Integer} cDimension The number of animation curves.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getvectorcurve
     */
    GetVectorCurve(animation, cDimension) {
        result := ComCall(7, this, "ptr*", animation, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Gets the final value of the animation variable. This is the value after all currently scheduled animations have completed.
     * @returns {Float} The final value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue
     */
    GetFinalValue() {
        result := ComCall(8, this, "double*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the final value of the animation variable for the specified dimension. This is the value after all currently scheduled animations have completed.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The final value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getfinalvectorvalue
     */
    GetFinalVectorValue(cDimension) {
        result := ComCall(9, this, "double*", &finalValue := 0, "uint", cDimension, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous value of the animation variable. This is the value of the animation variable before the most recent update.
     * @returns {Float} The previous value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue
     */
    GetPreviousValue() {
        result := ComCall(10, this, "double*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the previous value of the animation variable for the specified dimension. This is the value of the animation variable before the most recent update.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Float} The previous value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getpreviousvectorvalue
     */
    GetPreviousVectorValue(cDimension) {
        result := ComCall(11, this, "double*", &previousValue := 0, "uint", cDimension, "HRESULT")
        return previousValue
    }

    /**
     * Gets the integer value of the animation variable.
     * @returns {Integer} The value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getintegervalue
     */
    GetIntegerValue() {
        result := ComCall(12, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the integer value of the animation variable for the specified dimension.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getintegervectorvalue
     */
    GetIntegerVectorValue(cDimension) {
        result := ComCall(13, this, "int*", &value := 0, "uint", cDimension, "HRESULT")
        return value
    }

    /**
     * Gets the final integer value of the animation variable. This is the value after all currently scheduled animations have completed.
     * @returns {Integer} The final value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue
     */
    GetFinalIntegerValue() {
        result := ComCall(14, this, "int*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the final integer value of the animation variable for the specified dimension. This is the value after all currently scheduled animations have completed.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The final value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervectorvalue
     */
    GetFinalIntegerVectorValue(cDimension) {
        result := ComCall(15, this, "int*", &finalValue := 0, "uint", cDimension, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous integer value of the animation variable in the specified dimension. This is the value of the animation variable before the most recent update.
     * @returns {Integer} The previous value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue
     */
    GetPreviousIntegerValue() {
        result := ComCall(16, this, "int*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the previous integer value of the animation variable for the specified dimension. This is the value of the animation variable before the most recent update.
     * @param {Integer} cDimension The dimension from which to get the value of the animation variable.
     * @returns {Integer} The previous value of the animation variable as an integer.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervectorvalue
     */
    GetPreviousIntegerVectorValue(cDimension) {
        result := ComCall(17, this, "int*", &previousValue := 0, "uint", cDimension, "HRESULT")
        return previousValue
    }

    /**
     * Gets the active storyboard for the animation variable.
     * @returns {IUIAnimationStoryboard2} The active storyboard, or NULL if the animation variable is not being animated.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard
     */
    GetCurrentStoryboard() {
        result := ComCall(18, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard2(storyboard)
    }

    /**
     * Sets the lower bound (floor) for the value of the animation variable. The value of the animation variable should not fall below the specified value.
     * @param {Float} bound The lower bound for the value of the animation variable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setlowerbound
     */
    SetLowerBound(bound) {
        result := ComCall(19, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Sets the lower bound (floor) value of each specified dimension for the animation variable. The value of each animation variable should not fall below its lower bound.
     * @param {Pointer<Float>} bound A vector (of size <i>cDimension</i>) that contains  the lower bound values of each dimension.
     * @param {Integer} cDimension The number of dimensions that require lower bound values. This parameter specifies the number of values listed in <i>bound</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setlowerboundvector
     */
    SetLowerBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(20, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the upper bound (ceiling) for the value of the animation variable. The value of the animation variable should not rise above the specified value.
     * @param {Float} bound The upper bound for the value of the animation variable.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setupperbound
     */
    SetUpperBound(bound) {
        result := ComCall(21, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Sets the upper bound (ceiling) value of each specified dimension for the animation variable. The value of each animation variable should not rise above its upper bound.
     * @param {Pointer<Float>} bound A vector (of size <i>cDimension</i>) that contains  the upper bound values of each dimension.
     * @param {Integer} cDimension The number of dimensions that require upper bound values. This parameter specifies the number of values listed in <i>bound</i>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setupperboundvector
     */
    SetUpperBoundVector(bound, cDimension) {
        boundMarshal := bound is VarRef ? "double*" : "ptr"

        result := ComCall(22, this, boundMarshal, bound, "uint", cDimension, "HRESULT")
        return result
    }

    /**
     * Sets the rounding mode of the animation variable.
     * @param {Integer} mode The rounding mode.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setroundingmode
     */
    SetRoundingMode(mode) {
        result := ComCall(23, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Sets the tag of the animation variable.
     * @param {IUnknown} object The object portion of the tag. This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion of the tag.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-settag
     */
    SetTag(object, id) {
        result := ComCall(24, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag of the animation variable.
     * @param {Pointer<IUnknown>} object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the value of the animation variable.
     * @param {IUIAnimationVariableChangeHandler2} handler The handler for changes to the value of the animation variable. This parameter can be <b>NULL</b>.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">EstimateNextEventTime</a> method will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setvariablechangehandler
     */
    SetVariableChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(26, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the integer value of the animation variable.
     * @param {IUIAnimationVariableIntegerChangeHandler2} handler A pointer to the handler for changes to the integer value of the animation variable. This parameter can be <b>NULL</b>.
     * @param {BOOL} fRegisterForNextAnimationEvent If <b>TRUE</b>, specifies that the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-estimatenexteventtime">EstimateNextEventTime</a> method will incorporate <i>handler</i> into its estimate of the time interval until the next animation event. No default value.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setvariableintegerchangehandler
     */
    SetVariableIntegerChangeHandler(handler, fRegisterForNextAnimationEvent) {
        result := ComCall(27, this, "ptr", handler, "int", fRegisterForNextAnimationEvent, "HRESULT")
        return result
    }

    /**
     * Specifies a handler for changes to the animation curve of the animation variable.
     * @param {IUIAnimationVariableCurveChangeHandler2} handler A pointer to the handler for changes to the animation curve of the animation variable. This parameter can be <b>NULL</b>.
     * @returns {HRESULT} Returns S_OK if successful; otherwise an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable2-setvariablecurvechangehandler
     */
    SetVariableCurveChangeHandler(handler) {
        result := ComCall(28, this, "ptr", handler, "HRESULT")
        return result
    }
}
