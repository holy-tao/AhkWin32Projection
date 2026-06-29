#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICSSFilterSite.ahk" { ICSSFilterSite }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct ICSSFilter extends IUnknown {
    /**
     * The interface identifier for ICSSFilter
     * @type {Guid}
     */
    static IID := Guid("{3050f3ec-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICSSFilter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetSite                 : IntPtr
        OnAmbientPropertyChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICSSFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {ICSSFilterSite} pSink 
     * @returns {HRESULT} 
     */
    SetSite(pSink) {
        result := ComCall(3, this, "ptr", pSink, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dispid 
     * @returns {HRESULT} 
     */
    OnAmbientPropertyChange(dispid) {
        result := ComCall(4, this, "int", dispid, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICSSFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetSite := CallbackCreate(GetMethod(implObj, "SetSite"), flags, 2)
        this.vtbl.OnAmbientPropertyChange := CallbackCreate(GetMethod(implObj, "OnAmbientPropertyChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetSite)
        CallbackFree(this.vtbl.OnAmbientPropertyChange)
    }
}
