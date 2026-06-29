#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpeechDataKey extends IDispatch {
    /**
     * The interface identifier for ISpeechDataKey
     * @type {Guid}
     */
    static IID := Guid("{ce17c09b-4efa-44d5-a4c9-59d9585ab0cd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpeechDataKey interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        SetBinaryValue : IntPtr
        GetBinaryValue : IntPtr
        SetStringValue : IntPtr
        GetStringValue : IntPtr
        SetLongValue   : IntPtr
        GetLongValue   : IntPtr
        OpenKey        : IntPtr
        CreateKey      : IntPtr
        DeleteKey      : IntPtr
        DeleteValue    : IntPtr
        EnumKeys       : IntPtr
        EnumValues     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpeechDataKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    SetBinaryValue(_ValueName, Value) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(7, this, BSTR, _ValueName, VARIANT, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {VARIANT} 
     */
    GetBinaryValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        Value := VARIANT()
        result := ComCall(8, this, BSTR, _ValueName, VARIANT.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    SetStringValue(_ValueName, Value) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(9, this, BSTR, _ValueName, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {BSTR} 
     */
    GetStringValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        Value := BSTR.Owned()
        result := ComCall(10, this, BSTR, _ValueName, BSTR.Ptr, Value, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetLongValue(_ValueName, Value) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(11, this, BSTR, _ValueName, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {Integer} 
     */
    GetLongValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(12, this, BSTR, _ValueName, "int*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    OpenKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(13, this, BSTR, SubKeyName, "ptr*", &SubKey := 0, "HRESULT")
        return ISpeechDataKey(SubKey)
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    CreateKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(14, this, BSTR, SubKeyName, "ptr*", &SubKey := 0, "HRESULT")
        return ISpeechDataKey(SubKey)
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {HRESULT} 
     */
    DeleteKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(15, this, BSTR, SubKeyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {HRESULT} 
     */
    DeleteValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(16, this, BSTR, _ValueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumKeys(Index) {
        SubKeyName := BSTR.Owned()
        result := ComCall(17, this, "int", Index, BSTR.Ptr, SubKeyName, "HRESULT")
        return SubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumValues(Index) {
        _ValueName := BSTR.Owned()
        result := ComCall(18, this, "int", Index, BSTR.Ptr, _ValueName, "HRESULT")
        return _ValueName
    }

    Query(iid) {
        if (ISpeechDataKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetBinaryValue := CallbackCreate(GetMethod(implObj, "SetBinaryValue"), flags, 3)
        this.vtbl.GetBinaryValue := CallbackCreate(GetMethod(implObj, "GetBinaryValue"), flags, 3)
        this.vtbl.SetStringValue := CallbackCreate(GetMethod(implObj, "SetStringValue"), flags, 3)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.SetLongValue := CallbackCreate(GetMethod(implObj, "SetLongValue"), flags, 3)
        this.vtbl.GetLongValue := CallbackCreate(GetMethod(implObj, "GetLongValue"), flags, 3)
        this.vtbl.OpenKey := CallbackCreate(GetMethod(implObj, "OpenKey"), flags, 3)
        this.vtbl.CreateKey := CallbackCreate(GetMethod(implObj, "CreateKey"), flags, 3)
        this.vtbl.DeleteKey := CallbackCreate(GetMethod(implObj, "DeleteKey"), flags, 2)
        this.vtbl.DeleteValue := CallbackCreate(GetMethod(implObj, "DeleteValue"), flags, 2)
        this.vtbl.EnumKeys := CallbackCreate(GetMethod(implObj, "EnumKeys"), flags, 3)
        this.vtbl.EnumValues := CallbackCreate(GetMethod(implObj, "EnumValues"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetBinaryValue)
        CallbackFree(this.vtbl.GetBinaryValue)
        CallbackFree(this.vtbl.SetStringValue)
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.SetLongValue)
        CallbackFree(this.vtbl.GetLongValue)
        CallbackFree(this.vtbl.OpenKey)
        CallbackFree(this.vtbl.CreateKey)
        CallbackFree(this.vtbl.DeleteKey)
        CallbackFree(this.vtbl.DeleteValue)
        CallbackFree(this.vtbl.EnumKeys)
        CallbackFree(this.vtbl.EnumValues)
    }
}
