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
     * @param {BSTR} ValueName_ 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    SetBinaryValue(ValueName_, Value) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        result := ComCall(7, this, "ptr", ValueName_, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} ValueName_ 
     * @returns {VARIANT} 
     */
    GetBinaryValue(ValueName_) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        Value := VARIANT()
        result := ComCall(8, this, "ptr", ValueName_, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * SetStringValue Method (SqlServiceAdvancedProperty class)
     * @remarks
     * The property value type must be **string** to be able to set the property to a string value.
     * @param {BSTR} ValueName_ 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/wmi-provider-configuration-classes/sqlserviceadvancedproperty-class/setstringvalue-method-sqlserviceadvancedproperty-class
     */
    SetStringValue(ValueName_, Value) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }
        if(Value is String) {
            pin := BSTR.Alloc(Value)
            Value := pin.Value
        }

        result := ComCall(9, this, "ptr", ValueName_, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} ValueName_ 
     * @returns {BSTR} 
     */
    GetStringValue(ValueName_) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        Value := BSTR()
        result := ComCall(10, this, "ptr", ValueName_, "ptr", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * 
     * @param {BSTR} ValueName_ 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetLongValue(ValueName_, Value) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        result := ComCall(11, this, "ptr", ValueName_, "int", Value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} ValueName_ 
     * @returns {Integer} 
     */
    GetLongValue(ValueName_) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        result := ComCall(12, this, "ptr", ValueName_, "int*", &Value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Value
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    OpenKey(SubKeyName) {
        if(SubKeyName is String) {
            pin := BSTR.Alloc(SubKeyName)
            SubKeyName := pin.Value
        }

        result := ComCall(13, this, "ptr", SubKeyName, "ptr*", &SubKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ISpeechDataKey(SubKey)
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {ISpeechDataKey} 
     */
    CreateKey(SubKeyName) {
        if(SubKeyName is String) {
            pin := BSTR.Alloc(SubKeyName)
            SubKeyName := pin.Value
        }

        result := ComCall(14, this, "ptr", SubKeyName, "ptr*", &SubKey := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

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
     * @see https://learn.microsoft.com/windows/win32/ktop-src/SecProv/deletekeyprotector-win32-encryptablevolume
     */
    DeleteKey(SubKeyName) {
        if(SubKeyName is String) {
            pin := BSTR.Alloc(SubKeyName)
            SubKeyName := pin.Value
        }

        result := ComCall(15, this, "ptr", SubKeyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BSTR} ValueName_ 
     * @returns {HRESULT} 
     */
    DeleteValue(ValueName_) {
        if(ValueName_ is String) {
            pin := BSTR.Alloc(ValueName_)
            ValueName_ := pin.Value
        }

        result := ComCall(16, this, "ptr", ValueName_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumKeys(Index) {
        SubKeyName := BSTR()
        result := ComCall(17, this, "int", Index, "ptr", SubKeyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumValues(Index) {
        ValueName_ := BSTR()
        result := ComCall(18, this, "int", Index, "ptr", ValueName_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ValueName_
    }
}
