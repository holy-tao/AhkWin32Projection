#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines methods for handling storyboard events.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationstoryboardeventhandler2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationStoryboardEventHandler2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationStoryboardEventHandler2
     * @type {Guid}
     */
    static IID => Guid("{bac5f55a-ba7c-414c-b599-fbf850f553c6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStoryboardStatusChanged", "OnStoryboardUpdated"]

    /**
     * Handles storyboard status change events.
     * @remarks
     * By default, a call made in a callback method to any other animation method results in the call failing and returning <b>UI_E_ILLEGAL_REENTRANCY</b>. However, there are exceptions to this default. The following methods can be successfully called from <b>OnStoryboardStatusChanged</b>:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-createanimationvariable">IUIAnimationManager2::CreateAnimationVariable</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-createstoryboard">IUIAnimationManager2::CreateStoryboard</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag">IUIAnimationManager2::GetStoryboardFromTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag">IUIAnimationManager2::GetVariableFromTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-abandon">IUIAnimationStoryboard2::Abandon</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeatoffset">IUIAnimationStoryboard2::AddKeyframeAtOffset</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-addkeyframeaftertransition">IUIAnimationStoryboard2::AddKeyframeAfterTransition</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransition">IUIAnimationStoryboard2::AddTransition</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionatkeyframe">IUIAnimationStoryboard2::AddTransitionAtKeyframe</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-addtransitionbetweenkeyframes">IUIAnimationStoryboard2::AddTransitionBetweenKeyframes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-conclude">IUIAnimationStoryboard2::Conclude</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-finish">IUIAnimationStoryboard2::Finish</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-gettag">IUIAnimationStoryboard2::GetTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-holdvariable">IUIAnimationStoryboard2::HoldVariable</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-repeatbetweenkeyframes">IUIAnimationStoryboard2::RepeatBetweenKeyframes</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-setlongestacceptabledelay">IUIAnimationStoryboard2::SetLongestAcceptableDelay</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-setstoryboardeventhandler">IUIAnimationStoryboard2::SetStoryboardEventHandler</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-settag">IUIAnimationStoryboard2::SetTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-schedule">IUIAnimationStoryboard2::Schedule</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-getduration">IUIAnimationTransition2::GetDuration</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-isdurationknown">IUIAnimationTransition2::IsDurationKnown</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvalue">IUIAnimationTransition2::SetInitialValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationtransition2-setinitialvelocity">IUIAnimationTransition2::SetInitialVelocity</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard">IUIAnimationVariable2::GetCurrentStoryboard</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue">IUIAnimationVariable2::GetFinalIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue">IUIAnimationVariable2::GetFinalValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervalue">IUIAnimationVariable2::GetIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue">IUIAnimationVariable2::GetPreviousIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue">IUIAnimationVariable2::GetPreviousValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-gettag">IUIAnimationVariable2::GetTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getvalue">IUIAnimationVariable2::GetValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-settag">IUIAnimationVariable2::SetTag</a>
     * </li>
     * </ul>
     * @param {IUIAnimationStoryboard2} storyboard The storyboard for which the status has changed.
     * @param {Integer} newStatus The new status.
     * @param {Integer} previousStatus The previous status.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardstatuschanged
     */
    OnStoryboardStatusChanged(storyboard, newStatus, previousStatus) {
        result := ComCall(3, this, "ptr", storyboard, "int", newStatus, "int", previousStatus, "HRESULT")
        return result
    }

    /**
     * Handles storyboard update events.
     * @remarks
     * This method is called when the value of at least one of the variables that a storyboard is animating has changed since the last call to the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-update">IUIAnimationManager2::Update</a> method.
     * 
     * By default, a call made in a callback method to any other animation method results in the call failing and returning <b>UI_E_ILLEGAL_REENTRANCY</b>. However, there are exceptions to this default. The following methods can be successfully called from <b>OnStoryboardUpdated</b>:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getstoryboardfromtag">IUIAnimationManager2::GetStoryboardFromTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationmanager2-getvariablefromtag">IUIAnimationManager2::GetVariableFromTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationstoryboard2-gettag">IUIAnimationStoryboard2::GetTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getcurrentstoryboard">IUIAnimationVariable2::GetCurrentStoryboard</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalintegervalue">IUIAnimationVariable2::GetFinalIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getfinalvalue">IUIAnimationVariable2::GetFinalValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getintegervalue">IUIAnimationVariable2::GetIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousintegervalue">IUIAnimationVariable2::GetPreviousIntegerValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getpreviousvalue">IUIAnimationVariable2::GetPreviousValue</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-gettag">IUIAnimationVariable2::GetTag</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nf-uianimation-iuianimationvariable2-getvalue">IUIAnimationVariable2::GetValue</a>
     * </li>
     * </ul>
     * @param {IUIAnimationStoryboard2} storyboard The storyboard that has been updated.
     * @returns {HRESULT} If this method succeeds, it returns S_OK. Otherwise, it returns an  <b>HRESULT</b> error code. See <a href="https://docs.microsoft.com/windows/desktop/UIAnimation/uianimation-error-codes">Windows Animation Error Codes</a> for a list of error codes.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationstoryboardeventhandler2-onstoryboardupdated
     */
    OnStoryboardUpdated(storyboard) {
        result := ComCall(4, this, "ptr", storyboard, "HRESULT")
        return result
    }
}
