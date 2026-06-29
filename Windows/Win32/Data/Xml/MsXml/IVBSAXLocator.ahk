#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXLocator extends IDispatch {
    /**
     * The interface identifier for IVBSAXLocator
     * @type {Guid}
     */
    static IID := Guid("{796e7ac5-5aa2-4eff-acad-3faaf01a3288}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXLocator interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_columnNumber : IntPtr
        get_lineNumber   : IntPtr
        get_publicId     : IntPtr
        get_systemId     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXLocator.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    columnNumber {
        get => this.get_columnNumber()
    }

    /**
     * @type {Integer} 
     */
    lineNumber {
        get => this.get_lineNumber()
    }

    /**
     * @type {BSTR} 
     */
    publicId {
        get => this.get_publicId()
    }

    /**
     * @type {BSTR} 
     */
    systemId {
        get => this.get_systemId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_columnNumber() {
        result := ComCall(7, this, "int*", &nColumn := 0, "HRESULT")
        return nColumn
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_lineNumber() {
        result := ComCall(8, this, "int*", &nLine := 0, "HRESULT")
        return nLine
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_publicId() {
        strPublicId := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, strPublicId, "HRESULT")
        return strPublicId
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_systemId() {
        strSystemId := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, strSystemId, "HRESULT")
        return strSystemId
    }

    Query(iid) {
        if (IVBSAXLocator.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_columnNumber := CallbackCreate(GetMethod(implObj, "get_columnNumber"), flags, 2)
        this.vtbl.get_lineNumber := CallbackCreate(GetMethod(implObj, "get_lineNumber"), flags, 2)
        this.vtbl.get_publicId := CallbackCreate(GetMethod(implObj, "get_publicId"), flags, 2)
        this.vtbl.get_systemId := CallbackCreate(GetMethod(implObj, "get_systemId"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_columnNumber)
        CallbackFree(this.vtbl.get_lineNumber)
        CallbackFree(this.vtbl.get_publicId)
        CallbackFree(this.vtbl.get_systemId)
    }
}
