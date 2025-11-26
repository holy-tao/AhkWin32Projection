#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling animation variable update events. IUIAnimationVariableChangeHandler2 handles events that occur in a specified dimension.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariablechangehandler2-onvaluechanged">OnValueChanged</a> method receives animation variable value updates as <b>DOUBLE</b> values.
 *       
 * To receive value updates as <b>INT32</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged">IUIAnimationVariableIntegerChangeHandler2::OnIntegerValueChanged</a> method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariablechangehandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariableChangeHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariableChangeHandler2
     * @type {Guid}
     */
    static IID => Guid("{63acc8d2-6eae-4bb0-b879-586dd8cfbe42}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnValueChanged"]

    /**
     * Handles events that occur when the value of an animation variable changes in the specified dimension.
     * @param {IUIAnimationStoryboard2} storyboard The storyboard that is animating the animation variable specified by the <i>variable</i> parameter.
     * @param {IUIAnimationVariable2} variable The animation variable that has been updated.
     * @param {Pointer<Float>} newValue The new value of the animation variable.
     * @param {Pointer<Float>} previousValue The previous value of the animation variable.
     * @param {Integer} cDimension The dimension in which the value of the animation variable changed.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariablechangehandler2-onvaluechanged
     */
    OnValueChanged(storyboard, variable, newValue, previousValue, cDimension) {
        newValueMarshal := newValue is VarRef ? "double*" : "ptr"
        previousValueMarshal := previousValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, newValueMarshal, newValue, previousValueMarshal, previousValue, "uint", cDimension, "HRESULT")
        return result
    }
}
