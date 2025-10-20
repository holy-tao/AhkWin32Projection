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
     * 
     * @param {Pointer<IUIAnimationStoryboard2>} storyboard 
     * @param {Pointer<IUIAnimationVariable2>} variable 
     * @param {Pointer<Double>} newValue 
     * @param {Pointer<Double>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     */
    OnValueChanged(storyboard, variable, newValue, previousValue, cDimension) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, "double*", newValue, "double*", previousValue, "uint", cDimension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
