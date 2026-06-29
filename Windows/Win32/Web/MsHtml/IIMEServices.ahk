#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\UI\Input\Ime\IActiveIMMApp.ahk" { IActiveIMMApp }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IIMEServices extends IUnknown {
    /**
     * The interface identifier for IIMEServices
     * @type {Guid}
     */
    static IID := Guid("{3050f6ca-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IIMEServices interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetActiveIMM : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IIMEServices.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IActiveIMMApp} 
     */
    GetActiveIMM() {
        result := ComCall(3, this, "ptr*", &ppActiveIMM := 0, "HRESULT")
        return IActiveIMMApp(ppActiveIMM)
    }

    Query(iid) {
        if (IIMEServices.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetActiveIMM := CallbackCreate(GetMethod(implObj, "GetActiveIMM"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetActiveIMM)
    }
}
