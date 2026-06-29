#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ECustomDumpFlavor.ahk" { ECustomDumpFlavor }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\BucketParameters.ahk" { BucketParameters }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import ".\CustomDumpItem.ahk" { CustomDumpItem }

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct ICLRErrorReportingManager extends IUnknown {
    /**
     * The interface identifier for ICLRErrorReportingManager
     * @type {Guid}
     */
    static IID := Guid("{980d2f1a-bf79-4c08-812a-bb9778928f78}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICLRErrorReportingManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetBucketParametersForCurrentException : IntPtr
        BeginCustomDump                        : IntPtr
        EndCustomDump                          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICLRErrorReportingManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BucketParameters} 
     */
    GetBucketParametersForCurrentException() {
        pParams := BucketParameters()
        result := ComCall(3, this, BucketParameters.Ptr, pParams, "HRESULT")
        return pParams
    }

    /**
     * 
     * @param {ECustomDumpFlavor} dwFlavor 
     * @param {Integer} dwNumItems 
     * @param {Pointer<CustomDumpItem>} items 
     * @param {Integer} dwReserved 
     * @returns {HRESULT} 
     */
    BeginCustomDump(dwFlavor, dwNumItems, items, dwReserved) {
        result := ComCall(4, this, ECustomDumpFlavor, dwFlavor, "uint", dwNumItems, CustomDumpItem.Ptr, items, "uint", dwReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndCustomDump() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICLRErrorReportingManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBucketParametersForCurrentException := CallbackCreate(GetMethod(implObj, "GetBucketParametersForCurrentException"), flags, 2)
        this.vtbl.BeginCustomDump := CallbackCreate(GetMethod(implObj, "BeginCustomDump"), flags, 5)
        this.vtbl.EndCustomDump := CallbackCreate(GetMethod(implObj, "EndCustomDump"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBucketParametersForCurrentException)
        CallbackFree(this.vtbl.BeginCustomDump)
        CallbackFree(this.vtbl.EndCustomDump)
    }
}
