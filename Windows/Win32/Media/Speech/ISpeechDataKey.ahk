#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk
#Include ..\..\System\Variant\VARIANT.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class ISpeechDataKey extends IDispatch {

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

        Value := BSTR({Value: 0}, True)
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
        SubKeyName := BSTR({Value: 0}, True)
        result := ComCall(17, this, "int", Index, "ptr", SubKeyName, "HRESULT")
        return SubKeyName
    }

    /**
     * 
     * @param {Integer} Index 
     * @returns {BSTR} 
     */
    EnumValues(Index) {
        _ValueName := BSTR({Value: 0}, True)
        result := ComCall(18, this, "int", Index, "ptr", _ValueName, "HRESULT")
        return _ValueName
    }
}
