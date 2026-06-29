#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents the download content of an update. (IUpdateDownloadContent)
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatedownloadcontent
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateDownloadContent extends IDispatch {
    /**
     * The interface identifier for IUpdateDownloadContent
     * @type {Guid}
     */
    static IID := Guid("{54a2cb2d-9a0c-48b6-8a50-9abb69ee2d02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateDownloadContent interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_DownloadUrl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateDownloadContent.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    DownloadUrl {
        get => this.get_DownloadUrl()
    }

    /**
     * Gets the location of the download content on the server that hosts the update.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontent-get_downloadurl
     */
    get_DownloadUrl() {
        retval := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, retval, "HRESULT")
        return retval
    }

    Query(iid) {
        if (IUpdateDownloadContent.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_DownloadUrl := CallbackCreate(GetMethod(implObj, "get_DownloadUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_DownloadUrl)
    }
}
