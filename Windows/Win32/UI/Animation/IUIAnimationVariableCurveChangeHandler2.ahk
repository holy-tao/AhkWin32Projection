#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for handling animation curve update events.
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationvariablecurvechangehandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationVariableCurveChangeHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationVariableCurveChangeHandler2
     * @type {Guid}
     */
    static IID => Guid("{72895e91-0145-4c21-9192-5aab40eddf80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnCurveChanged"]

    /**
     * 
     * @param {IUIAnimationVariable2} variable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationvariablecurvechangehandler2-oncurvechanged
     */
    OnCurveChanged(variable) {
        result := ComCall(3, this, "ptr", variable, "HRESULT")
        return result
    }
}
