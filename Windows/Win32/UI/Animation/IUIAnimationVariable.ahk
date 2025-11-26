#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationStoryboard.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines an animation variable, which represents a visual element that can be animated.
 * @remarks
 * 
 * Along with 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationtransition">IUIAnimationTransition</a> and 
 *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a>, <b>IUIAnimationVariable</b> is a primary component for building animations. To create and manage animation variables, use <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationmanager">IUIAnimationManager</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariable
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariable extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariable
     * @type {Guid}
     */
    static IID => Guid("{8ceeb155-2849-4ce5-9448-91ff70e1e4d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetValue", "GetFinalValue", "GetPreviousValue", "GetIntegerValue", "GetFinalIntegerValue", "GetPreviousIntegerValue", "GetCurrentStoryboard", "SetLowerBound", "SetUpperBound", "SetRoundingMode", "SetTag", "GetTag", "SetVariableChangeHandler", "SetVariableIntegerChangeHandler"]

    /**
     * Gets the current value of the animation variable.
     * @returns {Float} The current value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getvalue
     */
    GetValue() {
        result := ComCall(3, this, "double*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the final value of the animation variable. This is the value after all currently scheduled animations have completed.
     * @returns {Float} The final value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getfinalvalue
     */
    GetFinalValue() {
        result := ComCall(4, this, "double*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous value of the animation variable. This is the value of the animation variable before the most recent update.
     * @returns {Float} The previous value of the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getpreviousvalue
     */
    GetPreviousValue() {
        result := ComCall(5, this, "double*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the current value of the animation variable as an integer.
     * @returns {Integer} The current value of the animation variable, converted to an <b>INT32</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getintegervalue
     */
    GetIntegerValue() {
        result := ComCall(6, this, "int*", &value := 0, "HRESULT")
        return value
    }

    /**
     * Gets the final value of the animation variable as an integer. This is the value after all currently scheduled animations have completed.
     * @returns {Integer} The final value of the animation variable, converted to an <b>INT32</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getfinalintegervalue
     */
    GetFinalIntegerValue() {
        result := ComCall(7, this, "int*", &finalValue := 0, "HRESULT")
        return finalValue
    }

    /**
     * Gets the previous value of the animation variable as an integer. This is the value of the animation variable before the most recent update.
     * @returns {Integer} The previous value of the animation variable, converted to an <b>INT32</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getpreviousintegervalue
     */
    GetPreviousIntegerValue() {
        result := ComCall(8, this, "int*", &previousValue := 0, "HRESULT")
        return previousValue
    }

    /**
     * Gets the storyboard that is currently animating the animation variable.
     * @returns {IUIAnimationStoryboard} The current storyboard, or <b>NULL</b> if no storyboard is currently animating the animation variable.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-getcurrentstoryboard
     */
    GetCurrentStoryboard() {
        result := ComCall(9, this, "ptr*", &storyboard := 0, "HRESULT")
        return IUIAnimationStoryboard(storyboard)
    }

    /**
     * Sets the lower bound (floor) for the animation variable. The value of the animation variable should not fall below the specified value.
     * @param {Float} bound The lower bound for the animation variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-setlowerbound
     */
    SetLowerBound(bound) {
        result := ComCall(10, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Sets an upper bound (ceiling) for the animation variable. The value of the animation variable should not rise above the specified value.
     * @param {Float} bound The upper bound for the animation variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-setupperbound
     */
    SetUpperBound(bound) {
        result := ComCall(11, this, "double", bound, "HRESULT")
        return result
    }

    /**
     * Specifies the rounding mode for the animation variable.
     * @param {Integer} mode The rounding mode for the animation variable.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-setroundingmode
     */
    SetRoundingMode(mode) {
        result := ComCall(12, this, "int", mode, "HRESULT")
        return result
    }

    /**
     * Sets the tag for an animation variable.
     * @param {IUnknown} object The object portion of the tag.
     *             This parameter can be <b>NULL</b>.
     * @param {Integer} id The identifier portion  of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-settag
     */
    SetTag(object, id) {
        result := ComCall(13, this, "ptr", object, "uint", id, "HRESULT")
        return result
    }

    /**
     * Gets the tag for an animation variable.
     * @param {Pointer<IUnknown>} object The object portion of the tag.
     * @param {Pointer<Integer>} id The identifier portion of the tag.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_VALUE_NOT_SET</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The animation variable's tag was not set.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-gettag
     */
    GetTag(object, id) {
        idMarshal := id is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "ptr*", object, idMarshal, id, "HRESULT")
        return result
    }

    /**
     * Specifies a variable change handler. This handler is notified of changes to the value of the animation variable.
     * @param {IUIAnimationVariableChangeHandler} handler A variable change handler.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariablechangehandler">IUIAnimationVariableChangeHandler</a> interface or be <b>NULL</b>.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-setvariablechangehandler
     */
    SetVariableChangeHandler(handler) {
        result := ComCall(15, this, "ptr", handler, "HRESULT")
        return result
    }

    /**
     * Specifies an integer variable change handler. This handler is notified of changes to the integer value of the animation variable.
     * @param {IUIAnimationVariableIntegerChangeHandler} handler An integer variable change handler.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariableintegerchangehandler">IUIAnimationVariableIntegerChangeHandler</a> interface or be NULL.
     * 
     * See Remarks.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Winodws Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariable-setvariableintegerchangehandler
     */
    SetVariableIntegerChangeHandler(handler) {
        result := ComCall(16, this, "ptr", handler, "HRESULT")
        return result
    }
}
