#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXDeclHandler extends IDispatch {
    /**
     * The interface identifier for IVBSAXDeclHandler
     * @type {Guid}
     */
    static IID := Guid("{e8917260-7579-4be1-b5dd-7afbfa6f077b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXDeclHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        elementDecl        : IntPtr
        attributeDecl      : IntPtr
        internalEntityDecl : IntPtr
        externalEntityDecl : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXDeclHandler.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strModel 
     * @returns {HRESULT} 
     */
    elementDecl(strName, strModel) {
        result := ComCall(7, this, BSTR.Ptr, strName, BSTR.Ptr, strModel, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strElementName 
     * @param {Pointer<BSTR>} strAttributeName 
     * @param {Pointer<BSTR>} strType 
     * @param {Pointer<BSTR>} strValueDefault 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    attributeDecl(strElementName, strAttributeName, strType, strValueDefault, strValue) {
        result := ComCall(8, this, BSTR.Ptr, strElementName, BSTR.Ptr, strAttributeName, BSTR.Ptr, strType, BSTR.Ptr, strValueDefault, BSTR.Ptr, strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strValue 
     * @returns {HRESULT} 
     */
    internalEntityDecl(strName, strValue) {
        result := ComCall(9, this, BSTR.Ptr, strName, BSTR.Ptr, strValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @param {Pointer<BSTR>} strPublicId 
     * @param {Pointer<BSTR>} strSystemId 
     * @returns {HRESULT} 
     */
    externalEntityDecl(strName, strPublicId, strSystemId) {
        result := ComCall(10, this, BSTR.Ptr, strName, BSTR.Ptr, strPublicId, BSTR.Ptr, strSystemId, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXDeclHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.elementDecl := CallbackCreate(GetMethod(implObj, "elementDecl"), flags, 3)
        this.vtbl.attributeDecl := CallbackCreate(GetMethod(implObj, "attributeDecl"), flags, 6)
        this.vtbl.internalEntityDecl := CallbackCreate(GetMethod(implObj, "internalEntityDecl"), flags, 3)
        this.vtbl.externalEntityDecl := CallbackCreate(GetMethod(implObj, "externalEntityDecl"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.elementDecl)
        CallbackFree(this.vtbl.attributeDecl)
        CallbackFree(this.vtbl.internalEntityDecl)
        CallbackFree(this.vtbl.externalEntityDecl)
    }
}
