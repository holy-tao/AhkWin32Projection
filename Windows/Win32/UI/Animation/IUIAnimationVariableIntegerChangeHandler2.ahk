#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling animation variable update events. IUIAnimationVariableIntegerChangeHandler2 handles events that occur in a specified dimension.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariableintegerchangehandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariableIntegerChangeHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariableIntegerChangeHandler2
     * @type {Guid}
     */
    static IID => Guid("{829b6cf1-4f3a-4412-ae09-b243eb4c6b58}")

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
     * Handles events that occur when the integer value of an animation variable changes in the specified dimension.
     * @param {IUIAnimationStoryboard2} storyboard The storyboard that is animating the animation variable specified by the <i>variable</i> parameter.
     * @param {IUIAnimationVariable2} variable The animation variable that has been updated.
     * @param {Pointer<Integer>} newValue The new integer value of the animation variable.
     * 
     * <div class="alert"><b>Note</b>  The rounding mode for an animation variable is specified using the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-setroundingmode">SetRoundingMode</a> method.</div>
     * <div> </div>
     * @param {Pointer<Integer>} previousValue The previous integer value of the animation variable.
     * 
     * <div class="alert"><b>Note</b>  The rounding mode for an animation variable is specified using the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-setroundingmode">SetRoundingMode</a> method.</div>
     * <div> </div>
     * @param {Integer} cDimension The dimension in which the integer value of the animation variable changed.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged
     */
    OnIntegerValueChanged(storyboard, variable, newValue, previousValue, cDimension) {
        newValueMarshal := newValue is VarRef ? "int*" : "ptr"
        previousValueMarshal := previousValue is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, newValueMarshal, newValue, previousValueMarshal, previousValue, "uint", cDimension, "HRESULT")
        return result
    }
}
