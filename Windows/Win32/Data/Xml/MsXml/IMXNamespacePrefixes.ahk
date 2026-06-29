#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IMXNamespacePrefixes extends IDispatch {
    /**
     * The interface identifier for IMXNamespacePrefixes
     * @type {Guid}
     */
    static IID := Guid("{c90352f4-643c-4fbc-bb23-e996eb2d51fd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMXNamespacePrefixes interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_item     : IntPtr
        get_length   : IntPtr
        get__newEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMXNamespacePrefixes.Vtbl()
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
     * @returns {BSTR} 
     */
    get_item(index) {
        prefix := BSTR.Owned()
        result := ComCall(7, this, "int", index, BSTR.Ptr, prefix, "HRESULT")
        return prefix
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(8, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(9, this, "ptr*", &ppUnk := 0, "HRESULT")
        return IUnknown(ppUnk)
    }

    Query(iid) {
        if (IMXNamespacePrefixes.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_item := CallbackCreate(GetMethod(implObj, "get_item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_item)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get__newEnum)
    }
}
