#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling animation variable update events. IUIAnimationVariableChangeHandler2 handles events that occur in a specified dimension.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariablechangehandler2-onvaluechanged">OnValueChanged</a> method receives animation variable value updates as <b>DOUBLE</b> values.
 *       
 * To receive value updates as <b>INT32</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged">IUIAnimationVariableIntegerChangeHandler2::OnIntegerValueChanged</a> method.
 * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nn-uianimation-iuianimationvariablechangehandler2
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
     * @remarks
     * This method receives updates as <b>DOUBLE</b> values.  
     *          To receive updates as <b>INT32</b> values, use the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged">IUIAnimationVariableIntegerChangeHandler2::OnIntegerValueChanged</a> method.
     * 
     * By default, a call made in a callback method to any other animation method results in the call failing and returning <b>UI_E_ILLEGAL_REENTRANCY</b>. However, there are exceptions to this default. The following methods can be successfully called from <b>IUIAnimationVariableChangeHandler2::OnValueChanged</b>:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getvalue">IUIAnimationVariable2::GetValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue">IUIAnimationVariable2::GetFinalValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue">IUIAnimationVariable2::GetPreviousValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervalue">IUIAnimationVariable2::GetIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue">IUIAnimationVariable2::GetFinalIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue">IUIAnimationVariable2::GetPreviousIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard">IUIAnimationVariable2::GetCurrentStoryboard
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-gettag">IUIAnimationVariable2::GetTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag">IUIAnimationManager2::GetVariableFromTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag">IUIAnimationManager2::GetStoryboardFromTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-gettag">IUIAnimationStoryboard2::GetTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getvalue">IUIAnimationVariable::GetValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getfinalvalue">IUIAnimationVariable::GetFinalValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getpreviousvalue">IUIAnimationVariable::GetPreviousValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getintegervalue">IUIAnimationVariable::GetIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getfinalintegervalue">IUIAnimationVariable::GetFinalIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getpreviousintegervalue">IUIAnimationVariable::GetPreviousIntegerValue
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-getcurrentstoryboard">IUIAnimationVariable::GetCurrentStoryboard
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable-gettag">IUIAnimationVariable::GetTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-getvariablefromtag">IUIAnimationManager::GetVariableFromTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager-getstoryboardfromtag">IUIAnimationManager::GetStoryboardFromTag
     * </a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard-gettag">IUIAnimationStoryboard::GetTag
     * </a>
     * </li>
     * </ul>
     * @param {IUIAnimationStoryboard2} storyboard The storyboard that is animating the animation variable specified by the <i>variable</i> parameter.
     * @param {IUIAnimationVariable2} variable The animation variable that has been updated.
     * @param {Pointer<Float>} newValue The new value of the animation variable.
     * @param {Pointer<Float>} previousValue The previous value of the animation variable.
     * @param {Integer} cDimension The dimension in which the value of the animation variable changed.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api//content/uianimation/nf-uianimation-iuianimationvariablechangehandler2-onvaluechanged
     */
    OnValueChanged(storyboard, variable, newValue, previousValue, cDimension) {
        newValueMarshal := newValue is VarRef ? "double*" : "ptr"
        previousValueMarshal := previousValue is VarRef ? "double*" : "ptr"

        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, newValueMarshal, newValue, previousValueMarshal, previousValue, "uint", cDimension, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
