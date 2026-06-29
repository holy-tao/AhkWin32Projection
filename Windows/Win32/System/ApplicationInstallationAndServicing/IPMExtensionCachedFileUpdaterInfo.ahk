#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */
export default struct IPMExtensionCachedFileUpdaterInfo extends IUnknown {
    /**
     * The interface identifier for IPMExtensionCachedFileUpdaterInfo
     * @type {Guid}
     */
    static IID := Guid("{e2d77509-4e58-4ba9-af7e-b642e370e1b0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPMExtensionCachedFileUpdaterInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_SupportsUpdates : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPMExtensionCachedFileUpdaterInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BOOL} 
     */
    SupportsUpdates {
        get => this.get_SupportsUpdates()
    }

    /**
     * 
     * @returns {BOOL} 
     */
    get_SupportsUpdates() {
        result := ComCall(3, this, BOOL.Ptr, &pSupportsUpdates := 0, "HRESULT")
        return pSupportsUpdates
    }

    Query(iid) {
        if (IPMExtensionCachedFileUpdaterInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SupportsUpdates := CallbackCreate(GetMethod(implObj, "get_SupportsUpdates"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SupportsUpdates)
    }
}
