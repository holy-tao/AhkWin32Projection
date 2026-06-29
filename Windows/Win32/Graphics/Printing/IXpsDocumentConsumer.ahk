#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IFixedDocument.ahk" { IFixedDocument }
#Import ".\IFixedPage.ahk" { IFixedPage }
#Import ".\IFixedDocumentSequence.ahk" { IFixedDocumentSequence }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IXpsDocument.ahk" { IXpsDocument }
#Import ".\IPrintWriteStream.ahk" { IPrintWriteStream }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IXpsDocumentConsumer extends IUnknown {
    /**
     * The interface identifier for IXpsDocumentConsumer
     * @type {Guid}
     */
    static IID := Guid("{4368d8a2-4181-4a9f-b295-3d9a38bb9ba0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXpsDocumentConsumer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SendXpsUnknown            : IntPtr
        SendXpsDocument           : IntPtr
        SendFixedDocumentSequence : IntPtr
        SendFixedDocument         : IntPtr
        SendFixedPage             : IntPtr
        CloseSender               : IntPtr
        GetNewEmptyPart           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXpsDocumentConsumer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {IUnknown} pUnknown 
     * @returns {HRESULT} 
     */
    SendXpsUnknown(pUnknown) {
        result := ComCall(3, this, "ptr", pUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IXpsDocument} pIXpsDocument 
     * @returns {HRESULT} 
     */
    SendXpsDocument(pIXpsDocument) {
        result := ComCall(4, this, "ptr", pIXpsDocument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedDocumentSequence} pIFixedDocumentSequence 
     * @returns {HRESULT} 
     */
    SendFixedDocumentSequence(pIFixedDocumentSequence) {
        result := ComCall(5, this, "ptr", pIFixedDocumentSequence, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedDocument} pIFixedDocument 
     * @returns {HRESULT} 
     */
    SendFixedDocument(pIFixedDocument) {
        result := ComCall(6, this, "ptr", pIFixedDocument, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFixedPage} pIFixedPage 
     * @returns {HRESULT} 
     */
    SendFixedPage(pIFixedPage) {
        result := ComCall(7, this, "ptr", pIFixedPage, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CloseSender() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppNewObject 
     * @param {Pointer<IPrintWriteStream>} ppWriteStream 
     * @returns {HRESULT} 
     */
    GetNewEmptyPart(uri, riid, ppNewObject, ppWriteStream) {
        uri := uri is String ? StrPtr(uri) : uri

        ppNewObjectMarshal := ppNewObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", uri, Guid.Ptr, riid, ppNewObjectMarshal, ppNewObject, IPrintWriteStream.Ptr, ppWriteStream, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXpsDocumentConsumer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SendXpsUnknown := CallbackCreate(GetMethod(implObj, "SendXpsUnknown"), flags, 2)
        this.vtbl.SendXpsDocument := CallbackCreate(GetMethod(implObj, "SendXpsDocument"), flags, 2)
        this.vtbl.SendFixedDocumentSequence := CallbackCreate(GetMethod(implObj, "SendFixedDocumentSequence"), flags, 2)
        this.vtbl.SendFixedDocument := CallbackCreate(GetMethod(implObj, "SendFixedDocument"), flags, 2)
        this.vtbl.SendFixedPage := CallbackCreate(GetMethod(implObj, "SendFixedPage"), flags, 2)
        this.vtbl.CloseSender := CallbackCreate(GetMethod(implObj, "CloseSender"), flags, 1)
        this.vtbl.GetNewEmptyPart := CallbackCreate(GetMethod(implObj, "GetNewEmptyPart"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SendXpsUnknown)
        CallbackFree(this.vtbl.SendXpsDocument)
        CallbackFree(this.vtbl.SendFixedDocumentSequence)
        CallbackFree(this.vtbl.SendFixedDocument)
        CallbackFree(this.vtbl.SendFixedPage)
        CallbackFree(this.vtbl.CloseSender)
        CallbackFree(this.vtbl.GetNewEmptyPart)
    }
}
