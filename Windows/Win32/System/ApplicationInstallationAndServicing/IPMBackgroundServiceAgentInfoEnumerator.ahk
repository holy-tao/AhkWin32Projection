#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPMBackgroundServiceAgentInfo.ahk" { IPMBackgroundServiceAgentInfo }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMBackgroundServiceAgentInfoEnumerator extends IUnknown {
    /**
     * The interface identifier for IPMBackgroundServiceAgentInfoEnumerator
     * @type {Guid}
     */
    static IID := Guid("{18eb2072-ab56-43b3-872c-beafb7a6b391}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMBackgroundServiceAgentInfoEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMBackgroundServiceAgentInfoEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPMBackgroundServiceAgentInfo} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * 
     * @returns {IPMBackgroundServiceAgentInfo} 
     */
    get_Next() {
        result := ComCall(3, this, "ptr*", &ppBSAInfo := 0, "HRESULT")
        return IPMBackgroundServiceAgentInfo(ppBSAInfo)
    }

    Query(iid) {
        if (IPMBackgroundServiceAgentInfoEnumerator.IID.Equals(iid)) {
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
