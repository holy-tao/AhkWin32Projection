#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpDataKey extends IUnknown {
    /**
     * The interface identifier for ISpDataKey
     * @type {Guid}
     */
    static IID := Guid("{14056581-e16c-11d2-bb90-00c04f8ee6c0}")

    /**
     * The class identifier for SpDataKey
     * @type {Guid}
     */
    static CLSID := Guid("{d9f6ee60-58c9-458b-88e1-2f908fd7f87c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpDataKey interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetData        : IntPtr
        GetData        : IntPtr
        SetStringValue : IntPtr
        GetStringValue : IntPtr
        SetDWORD       : IntPtr
        GetDWORD       : IntPtr
        OpenKey        : IntPtr
        CreateKey      : IntPtr
        DeleteKey      : IntPtr
        DeleteValue    : IntPtr
        EnumKeys       : IntPtr
        EnumValues     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpDataKey.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @param {Integer} cbData 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     */
    SetData(pszValueName, cbData, pData) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "ptr", pszValueName, "uint", cbData, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Integer>} pData 
     * @returns {HRESULT} 
     */
    GetData(pszValueName, pcbData, pData) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pDataMarshal := pData is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, "ptr", pszValueName, pcbDataMarshal, pcbData, pDataMarshal, pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @param {PWSTR} pszValue 
     * @returns {HRESULT} 
     */
    SetStringValue(pszValueName, pszValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := ComCall(5, this, "ptr", pszValueName, "ptr", pszValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @returns {PWSTR} 
     */
    GetStringValue(pszValueName) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := ComCall(6, this, "ptr", pszValueName, PWSTR.Ptr, &ppszValue := 0, "HRESULT")
        return ppszValue
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @param {Integer} dwValue 
     * @returns {HRESULT} 
     */
    SetDWORD(pszValueName, dwValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := ComCall(7, this, "ptr", pszValueName, "uint", dwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @param {Pointer<Integer>} pdwValue 
     * @returns {HRESULT} 
     */
    GetDWORD(pszValueName, pdwValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        pdwValueMarshal := pdwValue is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pszValueName, pdwValueMarshal, pdwValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubKeyName 
     * @returns {ISpDataKey} 
     */
    OpenKey(pszSubKeyName) {
        pszSubKeyName := pszSubKeyName is String ? StrPtr(pszSubKeyName) : pszSubKeyName

        result := ComCall(9, this, "ptr", pszSubKeyName, "ptr*", &ppSubKey := 0, "HRESULT")
        return ISpDataKey(ppSubKey)
    }

    /**
     * 
     * @param {PWSTR} pszSubKey 
     * @returns {ISpDataKey} 
     */
    CreateKey(pszSubKey) {
        pszSubKey := pszSubKey is String ? StrPtr(pszSubKey) : pszSubKey

        result := ComCall(10, this, "ptr", pszSubKey, "ptr*", &ppSubKey := 0, "HRESULT")
        return ISpDataKey(ppSubKey)
    }

    /**
     * 
     * @param {PWSTR} pszSubKey 
     * @returns {HRESULT} 
     */
    DeleteKey(pszSubKey) {
        pszSubKey := pszSubKey is String ? StrPtr(pszSubKey) : pszSubKey

        result := ComCall(11, this, "ptr", pszSubKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszValueName 
     * @returns {HRESULT} 
     */
    DeleteValue(pszValueName) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := ComCall(12, this, "ptr", pszValueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PWSTR} 
     */
    EnumKeys(Index) {
        result := ComCall(13, this, "uint", Index, PWSTR.Ptr, &ppszSubKeyName := 0, "HRESULT")
        return ppszSubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PWSTR} 
     */
    EnumValues(Index) {
        result := ComCall(14, this, "uint", Index, PWSTR.Ptr, &ppszValueName := 0, "HRESULT")
        return ppszValueName
    }

    Query(iid) {
        if (ISpDataKey.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetData := CallbackCreate(GetMethod(implObj, "SetData"), flags, 4)
        this.vtbl.GetData := CallbackCreate(GetMethod(implObj, "GetData"), flags, 4)
        this.vtbl.SetStringValue := CallbackCreate(GetMethod(implObj, "SetStringValue"), flags, 3)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.SetDWORD := CallbackCreate(GetMethod(implObj, "SetDWORD"), flags, 3)
        this.vtbl.GetDWORD := CallbackCreate(GetMethod(implObj, "GetDWORD"), flags, 3)
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
        CallbackFree(this.vtbl.SetData)
        CallbackFree(this.vtbl.GetData)
        CallbackFree(this.vtbl.SetStringValue)
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.SetDWORD)
        CallbackFree(this.vtbl.GetDWORD)
        CallbackFree(this.vtbl.OpenKey)
        CallbackFree(this.vtbl.CreateKey)
        CallbackFree(this.vtbl.DeleteKey)
        CallbackFree(this.vtbl.DeleteValue)
        CallbackFree(this.vtbl.EnumKeys)
        CallbackFree(this.vtbl.EnumValues)
    }
}
