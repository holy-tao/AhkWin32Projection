#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IUpdateSearcher.ahk" { IUpdateSearcher }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Searches for updates on a server. (IUpdateSearcher2)
 * @remarks
 * The <b>IUpdateSearcher2</b> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/nn-wuapi-iupdatesearcher2
 * @namespace Windows.Win32.System.UpdateAgent
 */
export default struct IUpdateSearcher2 extends IUpdateSearcher {
    /**
     * The interface identifier for IUpdateSearcher2
     * @type {Guid}
     */
    static IID := Guid("{4cbdcb2d-1589-4beb-bd1c-3e582ff0add0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IUpdateSearcher2 interfaces
    */
    struct Vtbl extends IUpdateSearcher.Vtbl {
        get_IgnoreDownloadPriority : IntPtr
        put_IgnoreDownloadPriority : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IUpdateSearcher2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    IgnoreDownloadPriority {
        get => this.get_IgnoreDownloadPriority()
        set => this.put_IgnoreDownloadPriority(value)
    }

    /**
     * Gets and sets a Boolean value that indicates whether to ignore the download priority. (Get)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher2">IUpdateSearcher2</a> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher2-get_ignoredownloadpriority
     */
    get_IgnoreDownloadPriority() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets a Boolean value that indicates whether to ignore the download priority. (Put)
     * @remarks
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher2">IUpdateSearcher2</a> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher2-put_ignoredownloadpriority
     */
    put_IgnoreDownloadPriority(value) {
        result := ComCall(26, this, VARIANT_BOOL, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IUpdateSearcher2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IgnoreDownloadPriority := CallbackCreate(GetMethod(implObj, "get_IgnoreDownloadPriority"), flags, 2)
        this.vtbl.put_IgnoreDownloadPriority := CallbackCreate(GetMethod(implObj, "put_IgnoreDownloadPriority"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IgnoreDownloadPriority)
        CallbackFree(this.vtbl.put_IgnoreDownloadPriority)
    }
}
