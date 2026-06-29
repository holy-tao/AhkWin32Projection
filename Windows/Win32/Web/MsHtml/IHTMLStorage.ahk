#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IHTMLStorage extends IDispatch {
    /**
     * The interface identifier for IHTMLStorage
     * @type {Guid}
     */
    static IID := Guid("{30510474-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The class identifier for HTMLStorage
     * @type {Guid}
     */
    static CLSID := Guid("{30510475-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IHTMLStorage interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_length         : IntPtr
        get_remainingSpace : IntPtr
        key                : IntPtr
        getItem            : IntPtr
        setItem            : IntPtr
        removeItem         : IntPtr
        clear              : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IHTMLStorage.Vtbl()
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
     * @type {Integer} 
     */
    remainingSpace {
        get => this.get_remainingSpace()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(7, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_remainingSpace() {
        result := ComCall(8, this, "int*", &p := 0, "HRESULT")
        return p
    }

    /**
     * 
     * @param {Integer} lIndex 
     * @returns {BSTR} 
     */
    key(lIndex) {
        __MIDL__IHTMLStorage0000 := BSTR.Owned()
        result := ComCall(9, this, "int", lIndex, BSTR.Ptr, __MIDL__IHTMLStorage0000, "HRESULT")
        return __MIDL__IHTMLStorage0000
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {VARIANT} 
     */
    getItem(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        __MIDL__IHTMLStorage0001 := VARIANT()
        result := ComCall(10, this, BSTR, bstrKey, VARIANT.Ptr, __MIDL__IHTMLStorage0001, "HRESULT")
        return __MIDL__IHTMLStorage0001
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    setItem(bstrKey, bstrValue) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(11, this, BSTR, bstrKey, BSTR, bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrKey 
     * @returns {HRESULT} 
     */
    removeItem(bstrKey) {
        bstrKey := bstrKey is String ? BSTR.Alloc(bstrKey).Value : bstrKey

        result := ComCall(12, this, BSTR, bstrKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    clear() {
        result := ComCall(13, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IHTMLStorage.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_length := CallbackCreate(GetMethod(implObj, "get_length"), flags, 2)
        this.vtbl.get_remainingSpace := CallbackCreate(GetMethod(implObj, "get_remainingSpace"), flags, 2)
        this.vtbl.key := CallbackCreate(GetMethod(implObj, "key"), flags, 3)
        this.vtbl.getItem := CallbackCreate(GetMethod(implObj, "getItem"), flags, 3)
        this.vtbl.setItem := CallbackCreate(GetMethod(implObj, "setItem"), flags, 3)
        this.vtbl.removeItem := CallbackCreate(GetMethod(implObj, "removeItem"), flags, 2)
        this.vtbl.clear := CallbackCreate(GetMethod(implObj, "clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_length)
        CallbackFree(this.vtbl.get_remainingSpace)
        CallbackFree(this.vtbl.key)
        CallbackFree(this.vtbl.getItem)
        CallbackFree(this.vtbl.setItem)
        CallbackFree(this.vtbl.removeItem)
        CallbackFree(this.vtbl.clear)
    }
}
