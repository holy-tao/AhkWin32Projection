#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMProcessingInstruction extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMProcessingInstruction
     * @type {Guid}
     */
    static IID := Guid("{2933bf89-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMProcessingInstruction interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_target : IntPtr
        get_data   : IntPtr
        put_data   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMProcessingInstruction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    target {
        get => this.get_target()
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_target() {
        name := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, name, "HRESULT")
        return name
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        value := BSTR.Owned()
        result := ComCall(44, this, BSTR.Ptr, value, "HRESULT")
        return value
    }

    /**
     * 
     * @param {BSTR} value 
     * @returns {HRESULT} 
     */
    put_data(value) {
        value := value is String ? BSTR.Alloc(value).Value : value

        result := ComCall(45, this, BSTR, value, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMProcessingInstruction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_target := CallbackCreate(GetMethod(implObj, "get_target"), flags, 2)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_target)
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.put_data)
    }
}
