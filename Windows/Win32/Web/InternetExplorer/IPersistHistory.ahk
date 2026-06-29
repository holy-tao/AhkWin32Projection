#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IStream.ahk" { IStream }
#Import "..\..\System\Com\IBindCtx.ahk" { IBindCtx }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IPersist.ahk" { IPersist }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IPersistHistory extends IPersist {
    /**
     * The interface identifier for IPersistHistory
     * @type {Guid}
     */
    static IID := Guid("{91a565c1-e38f-11d0-94bf-00a0c9055cbf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistHistory interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        LoadHistory       : IntPtr
        SaveHistory       : IntPtr
        SetPositionCookie : IntPtr
        GetPositionCookie : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistHistory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IStream} pStream 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     */
    LoadHistory(pStream, pbc) {
        result := ComCall(4, this, "ptr", pStream, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    SaveHistory(pStream) {
        result := ComCall(5, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPositioncookie 
     * @returns {HRESULT} 
     */
    SetPositionCookie(dwPositioncookie) {
        result := ComCall(6, this, "uint", dwPositioncookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPositionCookie() {
        result := ComCall(7, this, "uint*", &pdwPositioncookie := 0, "HRESULT")
        return pdwPositioncookie
    }

    Query(iid) {
        if (IPersistHistory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.LoadHistory := CallbackCreate(GetMethod(implObj, "LoadHistory"), flags, 3)
        this.vtbl.SaveHistory := CallbackCreate(GetMethod(implObj, "SaveHistory"), flags, 2)
        this.vtbl.SetPositionCookie := CallbackCreate(GetMethod(implObj, "SetPositionCookie"), flags, 2)
        this.vtbl.GetPositionCookie := CallbackCreate(GetMethod(implObj, "GetPositionCookie"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.LoadHistory)
        CallbackFree(this.vtbl.SaveHistory)
        CallbackFree(this.vtbl.SetPositionCookie)
        CallbackFree(this.vtbl.GetPositionCookie)
    }
}
