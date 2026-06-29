#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\BINDINFO.ahk" { BINDINFO }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IMoniker.ahk" { IMoniker }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IDownloadManager extends IUnknown {
    /**
     * The interface identifier for IDownloadManager
     * @type {Guid}
     */
    static IID := Guid("{988934a4-064b-11d3-bb80-00104b35e7f9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDownloadManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Download : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDownloadManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IMoniker} pmk 
     * @param {IBindCtx} pbc 
     * @param {Integer} dwBindVerb 
     * @param {Integer} grfBINDF 
     * @param {Pointer<BINDINFO>} pBindInfo 
     * @param {PWSTR} pszHeaders 
     * @param {PWSTR} pszRedir 
     * @param {Integer} uiCP 
     * @returns {HRESULT} 
     */
    Download(pmk, pbc, dwBindVerb, grfBINDF, pBindInfo, pszHeaders, pszRedir, uiCP) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders
        pszRedir := pszRedir is String ? StrPtr(pszRedir) : pszRedir

        result := ComCall(3, this, "ptr", pmk, "ptr", pbc, "uint", dwBindVerb, "int", grfBINDF, BINDINFO.Ptr, pBindInfo, "ptr", pszHeaders, "ptr", pszRedir, "uint", uiCP, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDownloadManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Download := CallbackCreate(GetMethod(implObj, "Download"), flags, 9)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Download)
    }
}
