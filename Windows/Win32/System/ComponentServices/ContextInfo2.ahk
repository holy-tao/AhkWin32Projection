#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ContextInfo.ahk" { ContextInfo }

/**
 * Provides additional information about an object's context, supplementing the information that is available through the ContextInfo interface.
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-contextinfo2
 * @namespace Windows.Win32.System.ComponentServices
 */
export default struct ContextInfo2 extends ContextInfo {
    /**
     * The interface identifier for ContextInfo2
     * @type {Guid}
     */
    static IID := Guid("{c99d6e75-2375-11d4-8331-00c04f605588}")

    /**
     * The class identifier for ContextInfo2
     * @type {Guid}
     */
    static CLSID := Guid("{c99d6e75-2375-11d4-8331-00c04f605588}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ContextInfo2 interfaces
    */
    struct Vtbl extends ContextInfo.Vtbl {
        GetPartitionId           : IntPtr
        GetApplicationId         : IntPtr
        GetApplicationInstanceId : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ContextInfo2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Retrieves the GUID of the COM+ partition of the current object context.
     * @returns {BSTR} A reference to the partition identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getpartitionid
     */
    GetPartitionId() {
        __MIDL__ContextInfo20000 := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, __MIDL__ContextInfo20000, "HRESULT")
        return __MIDL__ContextInfo20000
    }

    /**
     * Retrieves the GUID of the application of the current object context.
     * @returns {BSTR} A reference to the application identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getapplicationid
     */
    GetApplicationId() {
        __MIDL__ContextInfo20001 := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, __MIDL__ContextInfo20001, "HRESULT")
        return __MIDL__ContextInfo20001
    }

    /**
     * Retrieves the GUID of the application instance of the current object context.
     * @returns {BSTR} A reference to the application instance identifier.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-contextinfo2-getapplicationinstanceid
     */
    GetApplicationInstanceId() {
        __MIDL__ContextInfo20002 := BSTR.Owned()
        result := ComCall(14, this, BSTR.Ptr, __MIDL__ContextInfo20002, "HRESULT")
        return __MIDL__ContextInfo20002
    }

    Query(iid) {
        if (ContextInfo2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPartitionId := CallbackCreate(GetMethod(implObj, "GetPartitionId"), flags, 2)
        this.vtbl.GetApplicationId := CallbackCreate(GetMethod(implObj, "GetApplicationId"), flags, 2)
        this.vtbl.GetApplicationInstanceId := CallbackCreate(GetMethod(implObj, "GetApplicationInstanceId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPartitionId)
        CallbackFree(this.vtbl.GetApplicationId)
        CallbackFree(this.vtbl.GetApplicationInstanceId)
    }
}
