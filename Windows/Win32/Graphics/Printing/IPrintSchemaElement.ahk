#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrintSchemaElement extends IDispatch {
    /**
     * The interface identifier for IPrintSchemaElement
     * @type {Guid}
     */
    static IID := Guid("{724c1646-e64b-4bbf-8eb4-d45e4fd580da}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrintSchemaElement interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_XmlNode      : IntPtr
        get_Name         : IntPtr
        get_NamespaceUri : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrintSchemaElement.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    XmlNode {
        get => this.get_XmlNode()
    }

    /**
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {BSTR} 
     */
    NamespaceUri {
        get => this.get_NamespaceUri()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get_XmlNode() {
        result := ComCall(7, this, "ptr*", &ppXmlNode := 0, "HRESULT")
        return IUnknown(ppXmlNode)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(8, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_NamespaceUri() {
        pbstrNamespaceUri := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrNamespaceUri, "HRESULT")
        return pbstrNamespaceUri
    }

    Query(iid) {
        if (IPrintSchemaElement.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_XmlNode := CallbackCreate(GetMethod(implObj, "get_XmlNode"), flags, 2)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_NamespaceUri := CallbackCreate(GetMethod(implObj, "get_NamespaceUri"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_XmlNode)
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_NamespaceUri)
    }
}
