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
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetInitialValue(value) {
        result := ComCall(3, this, "double", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} velocity 
     * @returns {HRESULT} 
     */
    SetInitialVelocity(velocity) {
        result := ComCall(4, this, "double", velocity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsDurationKnown() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} duration 
     * @returns {HRESULT} 
     */
    GetDuration(duration) {
        result := ComCall(6, this, "double*", duration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
