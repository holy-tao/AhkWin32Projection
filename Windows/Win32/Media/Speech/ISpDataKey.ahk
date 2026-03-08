#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpDataKey.ahk
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
     * @returns {PWSTR} 
     */
    GetStringValue(pszValueName) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName

        result := ComCall(6, this, "ptr", pszValueName, "ptr*", &ppszValue := 0, "HRESULT")
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
     * Deletes a given key protector for the volume.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {PWSTR} pszSubKey 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                          | Description                                                                                                                                                                                                                                                                                                               |
     * |--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                          | The method was successful.<br/>                                                                                                                                                                                                                                                                                     |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl>         | The volume is locked.<br/>                                                                                                                                                                                                                                                                                          |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl>         | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                                                                                                                                                                                                                              |
     * | <dl> <dt>**E\_INVALIDARG**</dt> <dt>2147942487 (0x80070057)</dt> </dl>                  | The *VolumeKeyProtectorID* parameter does not refer to a valid key protector.<br/>                                                                                                                                                                                                                                  |
     * | <dl> <dt>**FVE\_E\_KEY\_REQUIRED**</dt> <dt>2150694941 (0x8031001D)</dt> </dl>          | The last key protector for a partially or fully encrypted volume cannot be removed if key protectors are enabled. Use [**DisableKeyProtectors**](disablekeyprotectors-win32-encryptablevolume.md) before removing this last key protector to ensure that encrypted portions of the volume remain accessible. <br/> |
     * | <dl> <dt>**FVE\_E\_VOLUME\_BOUND\_ALREADY**</dt> <dt>2150694943 (0x8031001F)</dt> </dl> | This key protector cannot be deleted because it is being used to automatically unlock the volume. <br/> Use [**DisableAutoUnlock**](disableautounlock-win32-encryptablevolume.md) to disable automatic unlocking before deleting this key protector.<br/>                                                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/deletekeyprotector-win32-encryptablevolume
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
        result := ComCall(13, this, "uint", Index, "ptr*", &ppszSubKeyName := 0, "HRESULT")
        return ppszSubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {PWSTR} 
     */
    EnumValues(Index) {
        result := ComCall(14, this, "uint", Index, "ptr*", &ppszValueName := 0, "HRESULT")
        return ppszValueName
    }
}
