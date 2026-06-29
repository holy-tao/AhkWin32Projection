#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IPrinterScriptableStream.ahk" { IPrinterScriptableStream }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct IPrinterScriptablePropertyBag extends IDispatch {
    /**
     * The interface identifier for IPrinterScriptablePropertyBag
     * @type {Guid}
     */
    static IID := Guid("{91c7765f-ed57-49ad-8b01-dc24816a5294}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPrinterScriptablePropertyBag interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        GetBool        : IntPtr
        SetBool        : IntPtr
        GetInt32       : IntPtr
        SetInt32       : IntPtr
        GetString      : IntPtr
        SetString      : IntPtr
        GetBytes       : IntPtr
        SetBytes       : IntPtr
        GetReadStream  : IntPtr
        GetWriteStream : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPrinterScriptablePropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {BOOL} 
     */
    GetBool(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(7, this, BSTR, bstrName, BOOL.Ptr, &pbValue := 0, "HRESULT")
        return pbValue
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BOOL} bValue 
     * @returns {HRESULT} 
     */
    SetBool(bstrName, bValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(8, this, BSTR, bstrName, BOOL, bValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {Integer} 
     */
    GetInt32(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(9, this, BSTR, bstrName, "int*", &pnValue := 0, "HRESULT")
        return pnValue
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {Integer} nValue 
     * @returns {HRESULT} 
     */
    SetInt32(bstrName, nValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(10, this, BSTR, bstrName, "int", nValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {BSTR} 
     */
    GetString(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        pbstrValue := BSTR.Owned()
        result := ComCall(11, this, BSTR, bstrName, BSTR.Ptr, pbstrValue, "HRESULT")
        return pbstrValue
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {BSTR} bstrValue 
     * @returns {HRESULT} 
     */
    SetString(bstrName, bstrValue) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName
        bstrValue := bstrValue is String ? BSTR.Alloc(bstrValue).Value : bstrValue

        result := ComCall(12, this, BSTR, bstrName, BSTR, bstrValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IDispatch} 
     */
    GetBytes(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(13, this, BSTR, bstrName, "ptr*", &ppArray := 0, "HRESULT")
        return IDispatch(ppArray)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @param {IDispatch} pArray 
     * @returns {HRESULT} 
     */
    SetBytes(bstrName, pArray) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(14, this, BSTR, bstrName, "ptr", pArray, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IPrinterScriptableStream} 
     */
    GetReadStream(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(15, this, BSTR, bstrName, "ptr*", &ppStream := 0, "HRESULT")
        return IPrinterScriptableStream(ppStream)
    }

    /**
     * 
     * @param {BSTR} bstrName 
     * @returns {IPrinterScriptableStream} 
     */
    GetWriteStream(bstrName) {
        bstrName := bstrName is String ? BSTR.Alloc(bstrName).Value : bstrName

        result := ComCall(16, this, BSTR, bstrName, "ptr*", &ppStream := 0, "HRESULT")
        return IPrinterScriptableStream(ppStream)
    }

    Query(iid) {
        if (IPrinterScriptablePropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetBool := CallbackCreate(GetMethod(implObj, "GetBool"), flags, 3)
        this.vtbl.SetBool := CallbackCreate(GetMethod(implObj, "SetBool"), flags, 3)
        this.vtbl.GetInt32 := CallbackCreate(GetMethod(implObj, "GetInt32"), flags, 3)
        this.vtbl.SetInt32 := CallbackCreate(GetMethod(implObj, "SetInt32"), flags, 3)
        this.vtbl.GetString := CallbackCreate(GetMethod(implObj, "GetString"), flags, 3)
        this.vtbl.SetString := CallbackCreate(GetMethod(implObj, "SetString"), flags, 3)
        this.vtbl.GetBytes := CallbackCreate(GetMethod(implObj, "GetBytes"), flags, 3)
        this.vtbl.SetBytes := CallbackCreate(GetMethod(implObj, "SetBytes"), flags, 3)
        this.vtbl.GetReadStream := CallbackCreate(GetMethod(implObj, "GetReadStream"), flags, 3)
        this.vtbl.GetWriteStream := CallbackCreate(GetMethod(implObj, "GetWriteStream"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetBool)
        CallbackFree(this.vtbl.SetBool)
        CallbackFree(this.vtbl.GetInt32)
        CallbackFree(this.vtbl.SetInt32)
        CallbackFree(this.vtbl.GetString)
        CallbackFree(this.vtbl.SetString)
        CallbackFree(this.vtbl.GetBytes)
        CallbackFree(this.vtbl.SetBytes)
        CallbackFree(this.vtbl.GetReadStream)
        CallbackFree(this.vtbl.GetWriteStream)
    }
}
