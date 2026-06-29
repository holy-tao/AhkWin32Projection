#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IVBSAXXMLReader.ahk" { IVBSAXXMLReader }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IVBSAXXMLFilter extends IDispatch {
    /**
     * The interface identifier for IVBSAXXMLFilter
     * @type {Guid}
     */
    static IID := Guid("{1299eb1b-5b88-433e-82de-82ca75ad4e04}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVBSAXXMLFilter interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_parent    : IntPtr
        putref_parent : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVBSAXXMLFilter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IVBSAXXMLReader} 
     */
    parent {
        get => this.get_parent()
    }

    /**
     * 
     * @returns {IVBSAXXMLReader} 
     */
    get_parent() {
        result := ComCall(7, this, "ptr*", &oReader := 0, "HRESULT")
        return IVBSAXXMLReader(oReader)
    }

    /**
     * 
     * @param {IVBSAXXMLReader} oReader 
     * @returns {HRESULT} 
     */
    putref_parent(oReader) {
        result := ComCall(8, this, "ptr", oReader, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVBSAXXMLFilter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_parent := CallbackCreate(GetMethod(implObj, "get_parent"), flags, 2)
        this.vtbl.putref_parent := CallbackCreate(GetMethod(implObj, "putref_parent"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_parent)
        CallbackFree(this.vtbl.putref_parent)
    }
}
