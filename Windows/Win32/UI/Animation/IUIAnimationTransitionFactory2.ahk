#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUIAnimationTransition2.ahk" { IUIAnimationTransition2 }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IUIAnimationInterpolator2.ahk" { IUIAnimationInterpolator2 }

/**
 * Defines a method for creating transitions from custom interpolators. supports the creation of transitions in a specified dimension.
 * @remarks
 * When an application requires animation effects that are not available in the transition library, developers can implement custom transitions that the application can use. A custom transition is created by first implementing the interpolator function for the transition, and then by using a factory object to generate transitions from the interpolator. An interpolator must implement either the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator">IUIAnimationInterpolator</a> interface or the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator2">IUIAnimationInterpolator2</a> interface; an implementation of the transition factory object is provided by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/dd317024(v=vs.85)">UIAnimationTransitionFactory</a> or by <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448667(v=vs.85)">UIAnimationTransitionFactory2</a>.
 * @see https://learn.microsoft.com/windows/win32/api/uianimation/nn-uianimation-iuianimationtransitionfactory2
 * @namespace Windows.Win32.UI.Animation
 */
export default struct IUIAnimationTransitionFactory2 extends IUnknown {
    /**
     * The interface identifier for IUIAnimationTransitionFactory2
     * @type {Guid}
     */
    static IID := Guid("{937d4916-c1a6-42d5-88d8-30344d6efe31}")

    /**
     * The class identifier for UIAnimationTransitionFactory2
     * @type {Guid}
     */
    static CLSID := Guid("{84302f97-7f7b-4040-b190-72ac9d18e420}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUIAnimationTransitionFactory2 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateTransition : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUIAnimationTransitionFactory2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Creates a transition from a custom interpolator for a given dimension.
     * @param {IUIAnimationInterpolator2} interpolator The interpolator from which a transition is to be created.  
     *                
     * The specified object must implement the <a href="https://docs.microsoft.com/windows/desktop/api/uianimation/nn-uianimation-iuianimationinterpolator2">IUIAnimationInterpolator2</a> interface.
     * @returns {IUIAnimationTransition2} The new transition.
     * @see https://learn.microsoft.com/windows/win32/api/uianimation/nf-uianimation-iuianimationtransitionfactory2-createtransition
     */
    CreateTransition(interpolator) {
        result := ComCall(3, this, "ptr", interpolator, "ptr*", &transition := 0, "HRESULT")
        return IUIAnimationTransition2(transition)
    }

    Query(iid) {
        if (IUIAnimationTransitionFactory2.IID.Equals(iid)) {
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
