#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling events related to animation variable updates.
 * @remarks
 * 
 * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariablechangehandler-onvaluechanged">OnValueChanged</a> receives animation variable value updates as <b>DOUBLE</b> values.
 *       
 * To receive value updates as <b>INT32</b> values, use <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler-onintegervaluechanged">IUIAnimationVariableIntegerChangeHandler::OnIntegerValueChanged</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariablechangehandler
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariableChangeHandler extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariableChangeHandler
     * @type {Guid}
     */
    static IID => Guid("{6358b7ba-87d2-42d5-bf71-82e919dd5862}")

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
     * 
     * @param {IUIAnimationStoryboard} storyboard 
     * @param {IUIAnimationVariable} variable 
     * @param {Float} newValue 
     * @param {Float} previousValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariablechangehandler-onvaluechanged
     */
    OnValueChanged(storyboard, variable, newValue, previousValue) {
        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, "double", newValue, "double", previousValue, "HRESULT")
        return result
    }
}
