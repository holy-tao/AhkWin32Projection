#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @param {BSTR} ValueName 
     * @param {VARIANT} Value 
     * @returns {HRESULT} 
     */
    SetBinaryValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(7, this, "ptr", ValueName, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @param {Pointer<VARIANT>} Value 
     * @returns {HRESULT} 
     */
    GetBinaryValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(8, this, "ptr", ValueName, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    SetStringValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(9, this, "ptr", ValueName, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @param {Pointer<BSTR>} Value 
     * @returns {HRESULT} 
     */
    GetStringValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(10, this, "ptr", ValueName, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetLongValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(11, this, "ptr", ValueName, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @param {Pointer<Integer>} Value 
     * @returns {HRESULT} 
     */
    GetLongValue(ValueName, Value) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(12, this, "ptr", ValueName, "int*", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @param {Pointer<ISpeechDataKey>} SubKey 
     * @returns {HRESULT} 
     */
    OpenKey(SubKeyName, SubKey) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(13, this, "ptr", SubKeyName, "ptr*", SubKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @param {Pointer<ISpeechDataKey>} SubKey 
     * @returns {HRESULT} 
     */
    CreateKey(SubKeyName, SubKey) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(14, this, "ptr", SubKeyName, "ptr*", SubKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} SubKeyName 
     * @returns {HRESULT} 
     */
    DeleteKey(SubKeyName) {
        SubKeyName := SubKeyName is String ? BSTR.Alloc(SubKeyName).Value : SubKeyName

        result := ComCall(15, this, "ptr", SubKeyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} ValueName 
     * @returns {HRESULT} 
     */
    DeleteValue(ValueName) {
        ValueName := ValueName is String ? BSTR.Alloc(ValueName).Value : ValueName

        result := ComCall(16, this, "ptr", ValueName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BSTR>} SubKeyName 
     * @returns {HRESULT} 
     */
    EnumKeys(Index, SubKeyName) {
        result := ComCall(17, this, "int", Index, "ptr", SubKeyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Index 
     * @param {Pointer<BSTR>} ValueName 
     * @returns {HRESULT} 
     */
    EnumValues(Index, ValueName) {
        result := ComCall(18, this, "int", Index, "ptr", ValueName, "HRESULT")
        return result
    }
}
