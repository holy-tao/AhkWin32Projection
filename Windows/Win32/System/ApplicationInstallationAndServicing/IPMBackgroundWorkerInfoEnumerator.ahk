#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPMBackgroundWorkerInfo.ahk" { IPMBackgroundWorkerInfo }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMBackgroundWorkerInfoEnumerator extends IUnknown {
    /**
     * The interface identifier for IPMBackgroundWorkerInfoEnumerator
     * @type {Guid}
     */
    static IID := Guid("{87f479f8-90d8-4ec7-92b9-72787e2f636b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMBackgroundWorkerInfoEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMBackgroundWorkerInfoEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPMBackgroundWorkerInfo} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * 
     * @returns {IPMBackgroundWorkerInfo} 
     */
    get_Next() {
        result := ComCall(3, this, "ptr*", &ppBWInfo := 0, "HRESULT")
        return IPMBackgroundWorkerInfo(ppBWInfo)
    }

    Query(iid) {
        if (IPMBackgroundWorkerInfoEnumerator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Next := CallbackCreate(GetMethod(implObj, "get_Next"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Next)
    }
}
