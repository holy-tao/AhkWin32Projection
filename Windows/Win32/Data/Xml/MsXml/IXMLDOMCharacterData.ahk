#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IXMLDOMNode.ahk" { IXMLDOMNode }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMCharacterData extends IXMLDOMNode {
    /**
     * The interface identifier for IXMLDOMCharacterData
     * @type {Guid}
     */
    static IID := Guid("{2933bf84-7b36-11d2-b20e-00c04f983e60}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMCharacterData interfaces
    */
    struct Vtbl extends IXMLDOMNode.Vtbl {
        get_data      : IntPtr
        put_data      : IntPtr
        get_length    : IntPtr
        substringData : IntPtr
        appendData    : IntPtr
        insertData    : IntPtr
        deleteData    : IntPtr
        replaceData   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMCharacterData.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    data {
        get => this.get_data()
        set => this.put_data(value)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_data() {
        data := BSTR.Owned()
        result := ComCall(43, this, BSTR.Ptr, data, "HRESULT")
        return data
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    put_data(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(44, this, BSTR, data, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(45, this, "int*", &dataLength := 0, "HRESULT")
        return dataLength
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {BSTR} 
     */
    substringData(offset, count) {
        data := BSTR.Owned()
        result := ComCall(46, this, "int", offset, "int", count, BSTR.Ptr, data, "HRESULT")
        return data
    }

    /**
     * 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    appendData(data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(47, this, BSTR, data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    insertData(offset, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(48, this, "int", offset, BSTR, data, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @returns {HRESULT} 
     */
    deleteData(offset, count) {
        result := ComCall(49, this, "int", offset, "int", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} offset 
     * @param {Integer} count 
     * @param {BSTR} data 
     * @returns {HRESULT} 
     */
    replaceData(offset, count, data) {
        data := data is String ? BSTR.Alloc(data).Value : data

        result := ComCall(50, this, "int", offset, "int", count, BSTR, data, "HRESULT")
        return result
    }

    Query(iid) {
        if (IXMLDOMCharacterData.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_data := CallbackCreate(GetMethod(implObj, "get_data"), flags, 2)
        this.vtbl.put_data := CallbackCreate(GetMethod(implObj, "put_data"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.substringData := CallbackCreate(GetMethod(implObj, "substringData"), flags, 4)
        this.vtbl.appendData := CallbackCreate(GetMethod(implObj, "appendData"), flags, 2)
        this.vtbl.insertData := CallbackCreate(GetMethod(implObj, "insertData"), flags, 3)
        this.vtbl.deleteData := CallbackCreate(GetMethod(implObj, "deleteData"), flags, 3)
        this.vtbl.replaceData := CallbackCreate(GetMethod(implObj, "replaceData"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_data)
        CallbackFree(this.vtbl.put_data)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.substringData)
        CallbackFree(this.vtbl.appendData)
        CallbackFree(this.vtbl.insertData)
        CallbackFree(this.vtbl.deleteData)
        CallbackFree(this.vtbl.replaceData)
    }
}
