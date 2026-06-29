#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPartPrintTicket.ahk" { IPartPrintTicket }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IFixedDocumentSequence extends IUnknown {
    /**
     * The interface identifier for IFixedDocumentSequence
     * @type {Guid}
     */
    static IID := Guid("{8028d181-2c32-4249-8493-1bfb22045574}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFixedDocumentSequence interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetUri         : IntPtr
        GetPrintTicket : IntPtr
        SetPrintTicket : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFixedDocumentSequence.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    GetUri() {
        uri := BSTR.Owned()
        result := ComCall(3, this, BSTR.Ptr, uri, "HRESULT")
        return uri
    }

    /**
     * 
     * @returns {IPartPrintTicket} 
     */
    GetPrintTicket() {
        result := ComCall(4, this, "ptr*", &ppPrintTicket := 0, "HRESULT")
        return IPartPrintTicket(ppPrintTicket)
    }

    /**
     * 
     * @param {IPartPrintTicket} pPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(pPrintTicket) {
        result := ComCall(5, this, "ptr", pPrintTicket, "HRESULT")
        return result
    }

    Query(iid) {
        if (IFixedDocumentSequence.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetUri := CallbackCreate(GetMethod(implObj, "GetUri"), flags, 2)
        this.vtbl.GetPrintTicket := CallbackCreate(GetMethod(implObj, "GetPrintTicket"), flags, 2)
        this.vtbl.SetPrintTicket := CallbackCreate(GetMethod(implObj, "SetPrintTicket"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetUri)
        CallbackFree(this.vtbl.GetPrintTicket)
        CallbackFree(this.vtbl.SetPrintTicket)
    }
}
