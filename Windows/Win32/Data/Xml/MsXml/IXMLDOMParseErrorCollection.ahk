#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IXMLDOMParseError2.ahk" { IXMLDOMParseError2 }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 */
export default struct IXMLDOMParseErrorCollection extends IDispatch {
    /**
     * The interface identifier for IXMLDOMParseErrorCollection
     * @type {Guid}
     */
    static IID := Guid("{3efaa429-272f-11d2-836f-0000f87a7782}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IXMLDOMParseErrorCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_item     : IntPtr
        get_length   : IntPtr
        get_next     : IntPtr
        reset        : IntPtr
        get__newEnum : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IXMLDOMParseErrorCollection.Vtbl()
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
     * @type {IXMLDOMParseError2} 
     */
    next {
        get => this.get_next()
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
     * @returns {IXMLDOMParseError2} 
     */
    get_item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &_error := 0, "HRESULT")
        return IXMLDOMParseError2(_error)
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
     * @returns {IXMLDOMParseError2} 
     */
    get_next() {
        result := ComCall(9, this, "ptr*", &_error := 0, "HRESULT")
        return IXMLDOMParseError2(_error)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    reset() {
        result := ComCall(10, this, "HRESULT")
        return result
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
        if (IXMLDOMParseErrorCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_item := CallbackCreate(GetMethod(implObj, "get_item"), flags, 3)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_next := CallbackCreate(GetMethod(implObj, "get_next"), flags, 2)
        this.vtbl.reset := CallbackCreate(GetMethod(implObj, "reset"), flags, 1)
        this.vtbl.get__newEnum := CallbackCreate(GetMethod(implObj, "get__newEnum"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_item)
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_next)
        CallbackFree(this.vtbl.reset)
        CallbackFree(this.vtbl.get__newEnum)
    }
}
