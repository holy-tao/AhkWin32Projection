#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * Supports collection of XML elements for indexed access.
 * @see https://learn.microsoft.com/windows/win32/api/msxml/nn-msxml-ixmlelementcollection
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLElementCollection extends IDispatch {
    /**
     * The interface identifier for IXMLElementCollection
     * @type {Guid}
     */
    static IID := Guid("{65725580-9b5d-11d0-9bfe-00c04fc99c8e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLElementCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        put_length   : IntPtr
        get_length   : IntPtr
        get__newEnum : IntPtr
        item         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLElementCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Integer} 
     */
    length {
        get => this.get_length()
        set => this.put_length(value)
    }

    /**
     * @type {IUnknown} 
     */
    _newEnum {
        get => this.get__newEnum()
    }

    /**
     * 
     * @param {Integer} v 
     * @returns {HRESULT} 
     */
    put_length(v) {
        result := ComCall(7, this, "int", v, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of elements in the collection. (IXMLElementCollection.get_length)
     * @remarks
     * This method is implemented in MSXML 1.0. It is no longer supported by Microsoft in current versions of MSXML. This documentation is provided for informational purposes only.
     * @returns {Integer} The number of elements in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/msxml/nf-msxml-ixmlelementcollection-get_length
     */
    get_length() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    /**
     * Retrieves the child elements from a collection using their index, name, or both.
     * @remarks
     * This method is implemented in MSXML 1.0. It is no longer supported by Microsoft in current versions of MSXML. This documentation is provided for informational purposes only.
     * @param {VARIANT} var1 A valid index numeric value (within the length of <a href="https://docs.microsoft.com/windows/desktop/api/msxml/nn-msxml-ixmlelementcollection">IXMLElementCollection</a>) or the name of an element in the XML hierarchy.
     * @param {VARIANT} var2 A valid index numeric value (within the length of <a href="https://docs.microsoft.com/windows/desktop/api/msxml/nn-msxml-ixmlelementcollection">IXMLElementCollection</a>) or the name of an element in the XML hierarchy.
     * @returns {IDispatch} TBD
     * @see https://learn.microsoft.com/windows/win32/api/msxml/nf-msxml-ixmlelementcollection-item
     */
    item(var1, var2) {
        result := ComCall(10, this, VARIANT, var1, VARIANT, var2, "ptr*", &ppDisp := 0, "HRESULT")
        return IDispatch(ppDisp)
    }

    Query(iid) {
        if (IXMLElementCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.put_length := CallbackCreate(GetMethod(implObj, "put_length"), flags, 2)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
        this.vtbl.item := CallbackCreate(GetMethod(implObj, "item"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.put_length)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
        CallbackFree(this.vtbl.item)
    }
}
