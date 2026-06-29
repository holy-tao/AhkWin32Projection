#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IReferenceTrackerTarget.ahk" { IReferenceTrackerTarget }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

/**
 * Defines the interface for callbacks from IReferenceTracker::FindTrackerTargets. The implementation of this interface must pass any IReferenceTrackerTarget instances it finds to the FoundTrackerTarget method.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.hosting.referencetracker/nn-windows-ui-xaml-hosting-referencetracker-ifindreferencetargetscallback
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IFindReferenceTargetsCallback extends IUnknown {
    /**
     * The interface identifier for IFindReferenceTargetsCallback
     * @type {Guid}
     */
    static IID := Guid("{04b3486c-4687-4229-8d14-505ab584dd88}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFindReferenceTargetsCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        FoundTrackerTarget : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFindReferenceTargetsCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IReferenceTrackerTarget} target 
     * @returns {HRESULT} 
     */
    FoundTrackerTarget(target) {
        result := ComCall(3, this, "ptr", target, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFindReferenceTargetsCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.FoundTrackerTarget := CallbackCreate(GetMethod(implObj, "FoundTrackerTarget"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.FoundTrackerTarget)
    }
}
