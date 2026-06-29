#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IGPMClientSideExtension interface supports methods that allow you to query client-side extension properties when you use the Group Policy Management Console (GPMC) interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmclientsideextension
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct IGPMClientSideExtension extends IDispatch {
    /**
     * The interface identifier for IGPMClientSideExtension
     * @type {Guid}
     */
    static IID := Guid("{69da7488-b8db-415e-9266-901be4d49928}")

    /**
     * The class identifier for GPMClientSideExtension
     * @type {Guid}
     */
    static CLSID := Guid("{c1a2e70e-659c-4b1a-940b-f88b0af9c8a4}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IGPMClientSideExtension interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ID            : IntPtr
        get_DisplayName   : IntPtr
        IsUserEnabled     : IntPtr
        IsComputerEnabled : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IGPMClientSideExtension.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ID {
        get => this.get_ID()
    }

    /**
     * @type {BSTR} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ID() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_DisplayName() {
        pVal := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * Checks whether the client-side extension can be called during the processing of user policy.
     * @returns {VARIANT_BOOL} Value that indicates whether the client-side extension can be called during the processing of user policy. If <b>VARIANT_TRUE</b>, the client-side extension is called during the processing of user policy, provided that there are policy settings for the client-side extension in the user portion of one or more of the applied GPOs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmclientsideextension-isuserenabled
     */
    IsUserEnabled() {
        result := ComCall(9, this, VARIANT_BOOL.Ptr, &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }

    /**
     * Checks whether the client-side extension can be called during the processing of computer policy.
     * @returns {VARIANT_BOOL} Value that indicates whether the client-side extension can be called during the processing of computer policy. If <b>VARIANT_TRUE</b>, the client-side extension is called during the processing of computer policy, provided that there are policy settings for the client-side extension in the computer portion of one or more of the applied GPOs.
     * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nf-gpmgmt-igpmclientsideextension-iscomputerenabled
     */
    IsComputerEnabled() {
        result := ComCall(10, this, VARIANT_BOOL.Ptr, &pvbEnabled := 0, "HRESULT")
        return pvbEnabled
    }

    Query(iid) {
        if (IGPMClientSideExtension.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ID := CallbackCreate(GetMethod(implObj, "get_ID"), flags, 2)
        this.vtbl.get_DisplayName := CallbackCreate(GetMethod(implObj, "get_DisplayName"), flags, 2)
        this.vtbl.IsUserEnabled := CallbackCreate(GetMethod(implObj, "IsUserEnabled"), flags, 2)
        this.vtbl.IsComputerEnabled := CallbackCreate(GetMethod(implObj, "IsComputerEnabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ID)
        CallbackFree(this.vtbl.get_DisplayName)
        CallbackFree(this.vtbl.IsUserEnabled)
        CallbackFree(this.vtbl.IsComputerEnabled)
    }
}
