#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\SAFEARRAY.ahk" { SAFEARRAY }

/**
 * @namespace Windows.Win32.System.TransactionServer
 */
export default struct IComponentUtil extends IDispatch {
    /**
     * The interface identifier for IComponentUtil
     * @type {Guid}
     */
    static IID := Guid("{6eb22873-8a19-11d0-81b6-00a0c9231c29}")

    /**
     * The class identifier for ComponentUtil
     * @type {Guid}
     */
    static CLSID := Guid("{6eb22884-8a19-11d0-81b6-00a0c9231c29}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IComponentUtil interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        InstallComponent      : IntPtr
        ImportComponent       : IntPtr
        ImportComponentByName : IntPtr
        GetCLSIDs             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IComponentUtil.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {BSTR} bstrProxyStubDLLFile 
     * @returns {HRESULT} 
     */
    InstallComponent(bstrDLLFile, bstrTypelibFile, bstrProxyStubDLLFile) {
        bstrDLLFile := bstrDLLFile is String ? BSTR.Alloc(bstrDLLFile).Value : bstrDLLFile
        bstrTypelibFile := bstrTypelibFile is String ? BSTR.Alloc(bstrTypelibFile).Value : bstrTypelibFile
        bstrProxyStubDLLFile := bstrProxyStubDLLFile is String ? BSTR.Alloc(bstrProxyStubDLLFile).Value : bstrProxyStubDLLFile

        result := ComCall(7, this, BSTR, bstrDLLFile, BSTR, bstrTypelibFile, BSTR, bstrProxyStubDLLFile, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCLSID 
     * @returns {HRESULT} 
     */
    ImportComponent(bstrCLSID) {
        bstrCLSID := bstrCLSID is String ? BSTR.Alloc(bstrCLSID).Value : bstrCLSID

        result := ComCall(8, this, BSTR, bstrCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProgID 
     * @returns {HRESULT} 
     */
    ImportComponentByName(bstrProgID) {
        bstrProgID := bstrProgID is String ? BSTR.Alloc(bstrProgID).Value : bstrProgID

        result := ComCall(9, this, BSTR, bstrProgID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDLLFile 
     * @param {BSTR} bstrTypelibFile 
     * @param {Pointer<Pointer<SAFEARRAY>>} aCLSIDs 
     * @returns {HRESULT} 
     */
    GetCLSIDs(bstrDLLFile, bstrTypelibFile, aCLSIDs) {
        bstrDLLFile := bstrDLLFile is String ? BSTR.Alloc(bstrDLLFile).Value : bstrDLLFile
        bstrTypelibFile := bstrTypelibFile is String ? BSTR.Alloc(bstrTypelibFile).Value : bstrTypelibFile

        aCLSIDsMarshal := aCLSIDs is VarRef ? "ptr*" : "ptr"

        result := ComCall(10, this, BSTR, bstrDLLFile, BSTR, bstrTypelibFile, aCLSIDsMarshal, aCLSIDs, "HRESULT")
        return result
    }

    Query(iid) {
        if (IComponentUtil.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InstallComponent := CallbackCreate(GetMethod(implObj, "InstallComponent"), flags, 4)
        this.vtbl.ImportComponent := CallbackCreate(GetMethod(implObj, "ImportComponent"), flags, 2)
        this.vtbl.ImportComponentByName := CallbackCreate(GetMethod(implObj, "ImportComponentByName"), flags, 2)
        this.vtbl.GetCLSIDs := CallbackCreate(GetMethod(implObj, "GetCLSIDs"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InstallComponent)
        CallbackFree(this.vtbl.ImportComponent)
        CallbackFree(this.vtbl.ImportComponentByName)
        CallbackFree(this.vtbl.GetCLSIDs)
    }
}
