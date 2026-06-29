#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAnimationTransition.ahk" { IUIAnimationTransition }
#Import ".\IUIAnimationInterpolator.ahk" { IUIAnimationInterpolator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines a method for creating transitions from custom interpolators.
 * @remarks
 * When an application requires animation effects that are not available in the transition library, developers can implement custom transitions that it can use. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from the interpolator. An interpolator must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransitionfactory
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTransitionFactory extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTransitionFactory
     * @type {Guid}
     */
    static IID := Guid("{fcd91e03-3e3b-45ad-bbb1-6dfc8153743d}")

    /**
     * The class identifier for UIAnimationTransitionFactory
     * @type {Guid}
     */
    static CLSID := Guid("{8a9b1cdd-fcd7-419c-8b44-42fd17db1887}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTransitionFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTransition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTransitionFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a transition from a custom interpolator.
     * @param {IUIAnimationInterpolator} interpolator The interpolator from which a transition is to be created.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> interface.
     * @returns {IUIAnimationTransition} The new transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionfactory-createtransition
     */
    CreateTransition(interpolator) {
        result := ComCall(3, this, "ptr", interpolator, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition(transition)
    }

    Query(iid) {
        if (IUIAnimationTransitionFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateTransition := CallbackCreate(GetMethod(implObj, "CreateTransition"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateTransition)
    }
}
