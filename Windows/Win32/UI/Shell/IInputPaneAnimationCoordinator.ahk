#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\DirectComposition\IDCompositionAnimation.ahk" { IDCompositionAnimation }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IInputPaneAnimationCoordinator extends IUnknown {
    /**
     * The interface identifier for IInputPaneAnimationCoordinator
     * @type {Guid}
     */
    static IID := Guid("{2af16ba9-2de5-4b75-82d9-01372afbffb4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IInputPaneAnimationCoordinator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        AddAnimation : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IInputPaneAnimationCoordinator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} device 
     * @param {IDCompositionAnimation} animation 
     * @returns {HRESULT} 
     */
    AddAnimation(device, animation) {
        result := ComCall(3, this, "ptr", device, "ptr", animation, "HRESULT")
        return result
    }

    Query(iid) {
        if (IInputPaneAnimationCoordinator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddAnimation := CallbackCreate(GetMethod(implObj, "AddAnimation"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddAnimation)
    }
}
