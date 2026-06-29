#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\ISchemaItem.ahk" { ISchemaItem }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct ISchemaItemCollection extends IDispatch {
    /**
     * The interface identifier for ISchemaItemCollection
     * @type {Guid}
     */
    static IID := Guid("{50ea08b2-dd1b-4664-9a50-c2f40f4bd79a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISchemaItemCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_item     : IntPtr
        itemByName   : IntPtr
        itemByQName  : IntPtr
        get_length   : IntPtr
        get__newEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISchemaItemCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {ISchemaItem} 
     */
    get_item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {ISchemaItem} 
     */
    itemByName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, BSTR, name, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @returns {ISchemaItem} 
     */
    itemByQName(name, namespaceURI) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(9, this, BSTR, name, BSTR, namespaceURI, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    Query(iid) {
        if (ISchemaItemCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_item := CallbackCreate(GetMethod(implObj, "get_item"), flags, 3)
        this.vtbl.itemByName := CallbackCreate(GetMethod(implObj, "itemByName"), flags, 3)
        this.vtbl.itemByQName := CallbackCreate(GetMethod(implObj, "itemByQName"), flags, 4)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_item)
        CallbackFree(this.vtbl.itemByName)
        CallbackFree(this.vtbl.itemByQName)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
    }
}
