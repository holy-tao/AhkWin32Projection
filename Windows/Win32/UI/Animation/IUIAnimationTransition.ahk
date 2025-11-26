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
     * Sets the initial value for the transition.
     * @param {Float} value The initial value for the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtransition-setinitialvalue
     */
    SetInitialValue(value) {
        result := ComCall(3, this, "double", value, "HRESULT")
        return result
    }

    /**
     * Sets the initial velocity for the transition.
     * @param {Float} velocity The initial velocity for the transition.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. Otherwise, it returns an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtransition-setinitialvelocity
     */
    SetInitialVelocity(velocity) {
        result := ComCall(4, this, "double", velocity, "HRESULT")
        return result
    }

    /**
     * Determines whether a transition's duration is currently known.
     * @returns {HRESULT} Returns S_OK if the duration is known, S_FALSE if the duration is not known, or an <b>HRESULT</b> error code. See <a href="/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>UI_E_STORYBOARD_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The storyboard for this transition is currently in schedule.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtransition-isdurationknown
     */
    IsDurationKnown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the duration of the transition.
     * @returns {Float} The duration of the transition, in seconds.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtransition-getduration
     */
    GetDuration() {
        result := ComCall(6, this, "double*", &duration := 0, "HRESULT")
        return duration
    }
}
