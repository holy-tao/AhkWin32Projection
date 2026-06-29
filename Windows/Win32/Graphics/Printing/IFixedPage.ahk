#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPrintWriteStream.ahk" { IPrintWriteStream }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\IPartBase.ahk" { IPartBase }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXpsPartIterator.ahk" { IXpsPartIterator }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IPartPrintTicket.ahk" { IPartPrintTicket }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IFixedPage extends IPartBase {
    /**
     * The interface identifier for IFixedPage
     * @type {Guid}
     */
    static IID := Guid("{3d9f6448-7e95-4cb5-94fb-0180c2883a57}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IFixedPage interfaces
    */
    struct Vtbl extends IPartBase.Vtbl {
        GetPrintTicket     : IntPtr
        GetPagePart        : IntPtr
        GetWriteStream     : IntPtr
        SetPrintTicket     : IntPtr
        SetPagePart        : IntPtr
        DeleteResource     : IntPtr
        GetXpsPartIterator : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IFixedPage.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @returns {IPartPrintTicket} 
     */
    GetPrintTicket() {
        result := ComCall(7, this, "ptr*", &ppPrintTicket := 0, "HRESULT")
        return IPartPrintTicket(ppPrintTicket)
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {IUnknown} 
     */
    GetPagePart(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(8, this, "ptr", uri, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * 
     * @returns {IPrintWriteStream} 
     */
    GetWriteStream() {
        result := ComCall(9, this, "ptr*", &ppWriteStream := 0, "HRESULT")
        return IPrintWriteStream(ppWriteStream)
    }

    /**
     * 
     * @param {IPartPrintTicket} ppPrintTicket 
     * @returns {HRESULT} 
     */
    SetPrintTicket(ppPrintTicket) {
        result := ComCall(10, this, "ptr", ppPrintTicket, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnk 
     * @returns {HRESULT} 
     */
    SetPagePart(pUnk) {
        result := ComCall(11, this, "ptr", pUnk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @returns {HRESULT} 
     */
    DeleteResource(uri) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(12, this, "ptr", uri, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IXpsPartIterator} 
     */
    GetXpsPartIterator() {
        result := ComCall(13, this, "ptr*", &pXpsPartIt := 0, "HRESULT")
        return IXpsPartIterator(pXpsPartIt)
    }

    Query(iid) {
        if (IFixedPage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetPrintTicket := CallbackCreate(GetMethod(implObj, "GetPrintTicket"), flags, 2)
        this.vtbl.GetPagePart := CallbackCreate(GetMethod(implObj, "GetPagePart"), flags, 3)
        this.vtbl.GetWriteStream := CallbackCreate(GetMethod(implObj, "GetWriteStream"), flags, 2)
        this.vtbl.SetPrintTicket := CallbackCreate(GetMethod(implObj, "SetPrintTicket"), flags, 2)
        this.vtbl.SetPagePart := CallbackCreate(GetMethod(implObj, "SetPagePart"), flags, 2)
        this.vtbl.DeleteResource := CallbackCreate(GetMethod(implObj, "DeleteResource"), flags, 2)
        this.vtbl.GetXpsPartIterator := CallbackCreate(GetMethod(implObj, "GetXpsPartIterator"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetPrintTicket)
        CallbackFree(this.vtbl.GetPagePart)
        CallbackFree(this.vtbl.GetWriteStream)
        CallbackFree(this.vtbl.SetPrintTicket)
        CallbackFree(this.vtbl.SetPagePart)
        CallbackFree(this.vtbl.DeleteResource)
        CallbackFree(this.vtbl.GetXpsPartIterator)
    }
}
