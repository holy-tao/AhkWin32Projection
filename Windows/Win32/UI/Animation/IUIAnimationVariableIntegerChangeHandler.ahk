#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling animation variable update events.
 * @remarks
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler-onintegervaluechanged">OnIntegerValueChanged</a> receives animation variable value updates as <b>INT32</b> values.
 *       
 *  To receive value updates as <b>DOUBLE</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariablechangehandler-onvaluechanged">IUIAnimationVariableChangeHandler::OnValueChanged</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariableintegerchangehandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariableIntegerChangeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariableIntegerChangeHandler
     * @type {Guid}
     */
    static IID => Guid("{bb3e1550-356e-44b0-99da-85ac6017865e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnIntegerValueChanged"]

    /**
     * Handles events that occur when the value of an animation variable changes.
     * @param {IUIAnimationStoryboard} storyboard The storyboard that is animating the animation variable  specified by the <i>variable</i> parameter.
     * @param {IUIAnimationVariable} variable The animation variable that has been updated.
     * @param {Integer} newValue The new value of the animation variable, rounded according to the variable's rounding mode.
     * @param {Integer} previousValue The previous value of the animation variable, rounded according to the variable's rounding mode.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariableintegerchangehandler-onintegervaluechanged
     */
    OnIntegerValueChanged(storyboard, variable, newValue, previousValue) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, "int", newValue, "int", previousValue, "HRESULT")
        return result
    }
}
