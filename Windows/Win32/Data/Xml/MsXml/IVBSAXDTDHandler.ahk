#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXDTDHandler extends IDispatch {
    /**
     * The interface identifier for IVBSAXDTDHandler
     * @type {Guid}
     */
    static IID := Guid("{24fb3297-302d-4620-ba39-3a732d850558}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXDTDHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        notationDecl       : IntPtr
        unparsedEntityDecl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXDTDHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    notationDecl(strName, strPublicId, strSystemId) {
        result := ComCall(7, this, BSTR.Ptr, strName, BSTR.Ptr, strPublicId, BSTR.Ptr, strSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @param {Pointer<BSTR>} strNotationName 
     * @returns {HRESULT} 
     */
    unparsedEntityDecl(strName, strPublicId, strSystemId, strNotationName) {
        result := ComCall(8, this, BSTR.Ptr, strName, BSTR.Ptr, strPublicId, BSTR.Ptr, strSystemId, BSTR.Ptr, strNotationName, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXDTDHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.notationDecl := CallbackCreate(GetMethod(implObj, "notationDecl"), flags, 4)
        this.vtbl.unparsedEntityDecl := CallbackCreate(GetMethod(implObj, "unparsedEntityDecl"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.notationDecl)
        CallbackFree(this.vtbl.unparsedEntityDecl)
    }
}
