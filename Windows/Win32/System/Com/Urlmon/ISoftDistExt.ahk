#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IBindCtx.ahk" { IBindCtx }
#Import ".\SOFTDISTINFO.ahk" { SOFTDISTINFO }
#Import ".\CODEBASEHOLD.ahk" { CODEBASEHOLD }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\Data\Xml\MsXml\IXMLElement.ahk" { IXMLElement }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct ISoftDistExt extends IUnknown {
    /**
     * The interface identifier for ISoftDistExt
     * @type {Guid}
     */
    static IID := Guid("{b15b8dc1-c7e1-11d0-8680-00aa00bdcb71}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISoftDistExt interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ProcessSoftDist              : IntPtr
        GetFirstCodeBase             : IntPtr
        GetNextCodeBase              : IntPtr
        AsyncInstallDistributionUnit : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISoftDistExt.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} szCDFURL 
     * @param {IXMLElement} pSoftDistElement 
     * @param {Pointer<SOFTDISTINFO>} lpsdi 
     * @returns {HRESULT} 
     */
    ProcessSoftDist(szCDFURL, pSoftDistElement, lpsdi) {
        szCDFURL := szCDFURL is String ? StrPtr(szCDFURL) : szCDFURL

        result := ComCall(3, this, "ptr", szCDFURL, "ptr", pSoftDistElement, SOFTDISTINFO.Ptr, lpsdi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szCodeBase 
     * @param {Pointer<Integer>} dwMaxSize 
     * @returns {HRESULT} 
     */
    GetFirstCodeBase(szCodeBase, dwMaxSize) {
        szCodeBaseMarshal := szCodeBase is VarRef ? "ptr*" : "ptr"
        dwMaxSizeMarshal := dwMaxSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, szCodeBaseMarshal, szCodeBase, dwMaxSizeMarshal, dwMaxSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} szCodeBase 
     * @param {Pointer<Integer>} dwMaxSize 
     * @returns {HRESULT} 
     */
    GetNextCodeBase(szCodeBase, dwMaxSize) {
        szCodeBaseMarshal := szCodeBase is VarRef ? "ptr*" : "ptr"
        dwMaxSizeMarshal := dwMaxSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, szCodeBaseMarshal, szCodeBase, dwMaxSizeMarshal, dwMaxSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IBindCtx} pbc 
     * @param {Pointer<Void>} pvReserved 
     * @param {Integer} flags 
     * @param {Pointer<CODEBASEHOLD>} lpcbh 
     * @returns {HRESULT} 
     */
    AsyncInstallDistributionUnit(pbc, pvReserved, flags, lpcbh) {
        pvReservedMarshal := pvReserved is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "ptr", pbc, pvReservedMarshal, pvReserved, "uint", flags, CODEBASEHOLD.Ptr, lpcbh, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISoftDistExt.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessSoftDist := CallbackCreate(GetMethod(implObj, "ProcessSoftDist"), flags, 4)
        this.vtbl.GetFirstCodeBase := CallbackCreate(GetMethod(implObj, "GetFirstCodeBase"), flags, 3)
        this.vtbl.GetNextCodeBase := CallbackCreate(GetMethod(implObj, "GetNextCodeBase"), flags, 3)
        this.vtbl.AsyncInstallDistributionUnit := CallbackCreate(GetMethod(implObj, "AsyncInstallDistributionUnit"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessSoftDist)
        CallbackFree(this.vtbl.GetFirstCodeBase)
        CallbackFree(this.vtbl.GetNextCodeBase)
        CallbackFree(this.vtbl.AsyncInstallDistributionUnit)
    }
}
