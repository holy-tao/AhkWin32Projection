#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpDataKey extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpDataKey
     * @type {Guid}
     */
    static IID => Guid("{14056581-e16c-11d2-bb90-00c04f8ee6c0}")

    /**
     * The class identifier for SpDataKey
     * @type {Guid}
     */
    static CLSID => Guid("{d9f6ee60-58c9-458b-88e1-2f908fd7f87c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetData", "GetData", "SetStringValue", "GetStringValue", "SetDWORD", "GetDWORD", "OpenKey", "CreateKey", "DeleteKey", "DeleteValue", "EnumKeys", "EnumValues"]

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
     * @param {Pointer<PWSTR>} ppszValue 
     * @returns {HRESULT} 
     */
    GetStringValue(pszValueName, ppszValue) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := ComCall(6, this, "ptr", pszValueName, "ptr", ppszValue, "HRESULT")
        return result
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
     * @param {Pointer<ISpDataKey>} ppSubKey 
     * @returns {HRESULT} 
     */
    OpenKey(pszSubKeyName, ppSubKey) {
        pszSubKeyName := pszSubKeyName is String ? StrPtr(pszSubKeyName) : pszSubKeyName

        result := ComCall(9, this, "ptr", pszSubKeyName, "ptr*", ppSubKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubKey 
     * @param {Pointer<ISpDataKey>} ppSubKey 
     * @returns {HRESULT} 
     */
    CreateKey(pszSubKey, ppSubKey) {
        pszSubKey := pszSubKey is String ? StrPtr(pszSubKey) : pszSubKey

        result := ComCall(10, this, "ptr", pszSubKey, "ptr*", ppSubKey, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} ppszSubKeyName 
     * @returns {HRESULT} 
     */
    EnumKeys(Index, ppszSubKeyName) {
        result := ComCall(13, this, "uint", Index, "ptr", ppszSubKeyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<PWSTR>} ppszValueName 
     * @returns {HRESULT} 
     */
    EnumValues(Index, ppszValueName) {
        result := ComCall(14, this, "uint", Index, "ptr", ppszValueName, "HRESULT")
        return result
    }
}
