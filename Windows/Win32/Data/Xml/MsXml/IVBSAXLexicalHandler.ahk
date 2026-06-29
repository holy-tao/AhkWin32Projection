#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXLexicalHandler extends IDispatch {
    /**
     * The interface identifier for IVBSAXLexicalHandler
     * @type {Guid}
     */
    static IID := Guid("{032aac35-8c0e-4d9d-979f-e3b702935576}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXLexicalHandler interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        startDTD    : IntPtr
        endDTD      : IntPtr
        startEntity : IntPtr
        endEntity   : IntPtr
        startCDATA  : IntPtr
        endCDATA    : IntPtr
        comment     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXLexicalHandler.Vtbl()
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
    startDTD(strName, strPublicId, strSystemId) {
        result := ComCall(7, this, BSTR.Ptr, strName, BSTR.Ptr, strPublicId, BSTR.Ptr, strSystemId, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endDTD() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    startEntity(strName) {
        result := ComCall(9, this, BSTR.Ptr, strName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strName 
     * @returns {HRESULT} 
     */
    endEntity(strName) {
        result := ComCall(10, this, BSTR.Ptr, strName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    startCDATA() {
        result := ComCall(11, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    endCDATA() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} strChars 
     * @returns {HRESULT} 
     */
    comment(strChars) {
        result := ComCall(13, this, BSTR.Ptr, strChars, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXLexicalHandler.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.startDTD := CallbackCreate(GetMethod(implObj, "startDTD"), flags, 4)
        this.vtbl.endDTD := CallbackCreate(GetMethod(implObj, "endDTD"), flags, 1)
        this.vtbl.startEntity := CallbackCreate(GetMethod(implObj, "startEntity"), flags, 2)
        this.vtbl.endEntity := CallbackCreate(GetMethod(implObj, "endEntity"), flags, 2)
        this.vtbl.startCDATA := CallbackCreate(GetMethod(implObj, "startCDATA"), flags, 1)
        this.vtbl.endCDATA := CallbackCreate(GetMethod(implObj, "endCDATA"), flags, 1)
        this.vtbl.comment := CallbackCreate(GetMethod(implObj, "comment"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.startDTD)
        CallbackFree(this.vtbl.endDTD)
        CallbackFree(this.vtbl.startEntity)
        CallbackFree(this.vtbl.endEntity)
        CallbackFree(this.vtbl.startCDATA)
        CallbackFree(this.vtbl.endCDATA)
        CallbackFree(this.vtbl.comment)
    }
}
