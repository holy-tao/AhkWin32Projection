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
     * 
     * @param {IUIAnimationStoryboard2} storyboard 
     * @param {IUIAnimationVariable2} variable 
     * @param {Pointer<Integer>} newValue 
     * @param {Pointer<Integer>} previousValue 
     * @param {Integer} cDimension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariableintegerchangehandler2-onintegervaluechanged
     */
    OnIntegerValueChanged(storyboard, variable, newValue, previousValue, cDimension) {
        newValueMarshal := newValue is VarRef ? "int*" : "ptr"
        previousValueMarshal := previousValue is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, "ptr", storyboard, "ptr", variable, newValueMarshal, newValue, previousValueMarshal, previousValue, "uint", cDimension, "HRESULT")
        return result
    }
}
