#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for creating transitions from custom interpolators. supports the creation of transitions in a specified dimension.
 * @remarks
 * 
  * When an application requires animation effects that are not available in the transition library, developers can implement custom transitions that the application can use. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from the interpolator. An interpolator must implement either the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a>interface or the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator2">IUIAnimationInterpolator2</a> interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a> or by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448667(v=vs.85)">UIAnimationTransitionFactory2</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransitionfactory2
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransitionFactory2 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransitionFactory2
     * @type {Guid}
     */
    static IID => Guid("{937d4916-c1a6-42d5-88d8-30344d6efe31}")

    /**
     * The class identifier for UIAnimationTransitionFactory2
     * @type {Guid}
     */
    static CLSID => Guid("{84302f97-7f7b-4040-b190-72ac9d18e420}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateTransition"]

    /**
     * 
     * @param {IUIAnimationInterpolator2} interpolator 
     * @param {Pointer<IUIAnimationTransition2>} transition 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionfactory2-createtransition
     */
    CreateTransition(interpolator, transition) {
        result := ComCall(3, this, "ptr", interpolator, "ptr*", transition, "HRESULT")
        return result
    }
}
