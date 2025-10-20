#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<IUIAnimationInterpolator>} interpolator 
     * @param {Pointer<IUIAnimationTransition>} transition 
     * @returns {HRESULT} 
     */
    CreateTransition(interpolator, transition) {
        result := ComCall(3, this, "ptr", interpolator, "ptr", transition, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
