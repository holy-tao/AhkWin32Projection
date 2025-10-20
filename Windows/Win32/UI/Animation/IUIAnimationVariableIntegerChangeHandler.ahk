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
     * 
     * @param {IUIAnimationStoryboard} storyboard 
     * @param {IUIAnimationVariable} variable 
     * @param {Integer} newValue 
     * @param {Integer} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler-onintegervaluechanged
     */
    OnIntegerValueChanged(storyboard, variable, newValue, previousValue) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, "int", newValue, "int", previousValue, "HRESULT")
        return result
    }
}
