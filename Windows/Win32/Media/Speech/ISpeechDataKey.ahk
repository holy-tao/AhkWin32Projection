#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include .\ISpeechDataKey.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpeechDataKey extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpeechDataKey
     * @type {Guid}
     */
    static IID => Guid("{ce17c09b-4efa-44d5-a4c9-59d9585ab0cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetBinaryValue", "GetBinaryValue", "SetStringValue", "GetStringValue", "SetLongValue", "GetLongValue", "OpenKey", "CreateKey", "DeleteKey", "DeleteValue", "EnumKeys", "EnumValues"]

    /**
     * 
     * @param {BSTR} _ValueName 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    SetBinaryValue(_ValueName, Value) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(7, this, "ptr", _ValueName, "ptr", Value, "HRESULT")
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
        result := ComCall(8, this, "ptr", _ValueName, "ptr", Value, "HRESULT")
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

        result := ComCall(9, this, "ptr", _ValueName, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {BSTR} 
     */
    GetStringValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        Value := BSTR()
        result := ComCall(10, this, "ptr", _ValueName, "ptr", Value, "HRESULT")
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

        result := ComCall(11, this, "ptr", _ValueName, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {Integer} 
     */
    GetLongValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(12, this, "ptr", _ValueName, "int*", &Value := 0, "HRESULT")
        return Value
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    OpenKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(13, this, "ptr", SubKeyName, "ptr*", &SubKey := 0, "HRESULT")
        return ISpeechDataKey(SubKey)
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    CreateKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(14, this, "ptr", SubKeyName, "ptr*", &SubKey := 0, "HRESULT")
        return ISpeechDataKey(SubKey)
    }

    /**
     * Deletes a given key protector for the volume.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {BSTR} SubKeyName 
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
    DeleteKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(15, this, "ptr", SubKeyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} _ValueName 
     * @returns {HRESULT} 
     */
    DeleteValue(_ValueName) {
        _ValueName := _ValueName is String ? BSTR.Alloc(_ValueName).Value : _ValueName

        result := ComCall(16, this, "ptr", _ValueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumKeys(Index) {
        SubKeyName := BSTR()
        result := ComCall(17, this, "int", Index, "ptr", SubKeyName, "HRESULT")
        return SubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumValues(Index) {
        _ValueName := BSTR()
        result := ComCall(18, this, "int", Index, "ptr", _ValueName, "HRESULT")
        return _ValueName
    }
}
