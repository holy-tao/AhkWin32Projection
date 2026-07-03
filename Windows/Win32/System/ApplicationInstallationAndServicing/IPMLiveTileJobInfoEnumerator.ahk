#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPMLiveTileJobInfo.ahk" { IPMLiveTileJobInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMLiveTileJobInfoEnumerator extends IUnknown {
    /**
     * The interface identifier for IPMLiveTileJobInfoEnumerator
     * @type {Guid}
     */
    static IID := Guid("{bc042582-9415-4f36-9f99-06f104c07c03}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMLiveTileJobInfoEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMLiveTileJobInfoEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPMLiveTileJobInfo} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * 
     * @returns {IPMLiveTileJobInfo} 
     */
    get_Next() {
        result := ComCall(3, this, "ptr*", &ppLiveTileJobInfo := 0, "HRESULT")
        return IPMLiveTileJobInfo(ppLiveTileJobInfo)
    }

    Query(iid) {
        if (IPMLiveTileJobInfoEnumerator.IID.Equals(iid)) {
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
