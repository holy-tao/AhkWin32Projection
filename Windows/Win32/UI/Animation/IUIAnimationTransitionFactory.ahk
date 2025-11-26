#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUIAnimationTransition.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines a method for creating transitions from custom interpolators.
 * @remarks
 * 
 * When an application requires animation effects that are not available in the transition library, developers can implement custom transitions that it can use. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from the interpolator. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a>interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//uianimation/nn-uianimation-iuianimationtransitionfactory
 * @namespace Windows.Win32.UI.Animation
 * @version v4.0.30319
 */
class IUIAnimationTransitionFactory extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUIAnimationTransitionFactory
     * @type {Guid}
     */
    static IID => Guid("{fcd91e03-3e3b-45ad-bbb1-6dfc8153743d}")

    /**
     * The class identifier for UIAnimationTransitionFactory
     * @type {Guid}
     */
    static CLSID => Guid("{8a9b1cdd-fcd7-419c-8b44-42fd17db1887}")

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
     * Creates a transition from a custom interpolator.
     * @param {IUIAnimationInterpolator} interpolator The interpolator from which a transition is to be created.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> interface.
     * @returns {IUIAnimationTransition} The new transition.
     * @see https://docs.microsoft.com/windows/win32/api//uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition
     */
    CreateTransition(interpolator) {
        result := ComCall(3, this, "ptr", interpolator, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }
}
