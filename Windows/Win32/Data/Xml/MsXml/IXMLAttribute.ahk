#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLAttribute extends IDispatch {
    /**
     * The interface identifier for IXMLAttribute
     * @type {Guid}
     */
    static IID := Guid("{d4d4a0fc-3b73-11d1-b2b4-00c04fb92596}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLAttribute interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_name  : IntPtr
        get_value : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLAttribute.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    name {
        get => this.get_name()
    }

    /**
     * @type {BSTR} 
     */
    value {
        get => this.get_value()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_name() {
        n := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, n, "HRESULT")
        return n
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_value() {
        v := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, v, "HRESULT")
        return v
    }

    Query(iid) {
        if (IXMLAttribute.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_name := CallbackCreate(GetMethod(implObj, "get_name"), flags, 2)
        this.vtbl.get_value := CallbackCreate(GetMethod(implObj, "get_value"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_name)
        CallbackFree(this.vtbl.get_value)
    }
}
