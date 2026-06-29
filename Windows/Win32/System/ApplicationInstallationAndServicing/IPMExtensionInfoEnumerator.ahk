#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPMExtensionInfo.ahk" { IPMExtensionInfo }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionInfoEnumerator extends IUnknown {
    /**
     * The interface identifier for IPMExtensionInfoEnumerator
     * @type {Guid}
     */
    static IID := Guid("{403b9e82-1171-4573-8e6f-6f33f39b83dd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionInfoEnumerator interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Next : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionInfoEnumerator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IPMExtensionInfo} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * 
     * @returns {IPMExtensionInfo} 
     */
    get_Next() {
        result := ComCall(3, this, "ptr*", &ppExtensionInfo := 0, "HRESULT")
        return IPMExtensionInfo(ppExtensionInfo)
    }

    Query(iid) {
        if (IPMExtensionInfoEnumerator.IID.Equals(iid)) {
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
