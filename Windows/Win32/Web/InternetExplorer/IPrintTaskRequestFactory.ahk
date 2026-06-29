#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrintTaskRequestHandler.ahk" { IPrintTaskRequestHandler }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 */
export default struct IPrintTaskRequestFactory extends IUnknown {
    /**
     * The interface identifier for IPrintTaskRequestFactory
     * @type {Guid}
     */
    static IID := Guid("{bb516745-8c34-4f8b-9605-684dcb144be5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintTaskRequestFactory interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreatePrintTaskRequest : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintTaskRequestFactory.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IPrintTaskRequestHandler} pPrintTaskRequestHandler 
     * @returns {HRESULT} 
     */
    CreatePrintTaskRequest(pPrintTaskRequestHandler) {
        result := ComCall(3, this, "ptr", pPrintTaskRequestHandler, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPrintTaskRequestFactory.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreatePrintTaskRequest := CallbackCreate(GetMethod(implObj, "CreatePrintTaskRequest"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreatePrintTaskRequest)
    }
}
