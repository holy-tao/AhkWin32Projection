#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a transition, which determines how an animation variable changes over time.
 * @remarks
 * 
  * <b>IUIAnimationTransition</b> is one of the primary interfaces used to add animation to an application,
  *          along with 
  *          the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationvariable">IUIAnimationVariable</a> and 
  *          <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationstoryboard">IUIAnimationStoryboard</a> interfaces.
  * 
  * 
  * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317028(v=vs.85)">UIAnimationTransitionLibrary</a> implements
  *          a library of standard transitions.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransition
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransition
     * @type {Guid}
     */
    static IID => Guid("{dc6ce252-f731-41cf-b610-614b6ca049ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetInitialValue", "SetInitialVelocity", "IsDurationKnown", "GetDuration"]

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(3, this, "double", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(4, this, "double", velocity, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransition-getduration
     */
    GetDuration() {
        result := ComCall(6, this, "double*", &duration := 0, "HRESULT")
        return duration
    }
}
