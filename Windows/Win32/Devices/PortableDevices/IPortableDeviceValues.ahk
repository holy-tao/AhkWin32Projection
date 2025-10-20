#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceValues extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceValues
     * @type {Guid}
     */
    static IID => Guid("{6848f6f2-3155-4f86-b6f5-263eeeab3143}")

    /**
     * The class identifier for PortableDeviceValues
     * @type {Guid}
     */
    static CLSID => Guid("{0c15d503-d017-47ce-9016-7b3f978721cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt32>} pcelt 
     * @returns {HRESULT} 
     */
    GetCount(pcelt) {
        result := ComCall(3, this, "uint*", pcelt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetAt(index, pKey, pValue) {
        result := ComCall(4, this, "uint", index, "ptr", pKey, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    SetValue(key, pValue) {
        result := ComCall(5, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    GetValue(key, pValue) {
        result := ComCall(6, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     */
    SetStringValue(key, Value) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, "ptr", key, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PWSTR>} pValue 
     * @returns {HRESULT} 
     */
    GetStringValue(key, pValue) {
        result := ComCall(8, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetUnsignedIntegerValue(key, Value) {
        result := ComCall(9, this, "ptr", key, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<UInt32>} pValue 
     * @returns {HRESULT} 
     */
    GetUnsignedIntegerValue(key, pValue) {
        result := ComCall(10, this, "ptr", key, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetSignedIntegerValue(key, Value) {
        result := ComCall(11, this, "ptr", key, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    GetSignedIntegerValue(key, pValue) {
        result := ComCall(12, this, "ptr", key, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetUnsignedLargeIntegerValue(key, Value) {
        result := ComCall(13, this, "ptr", key, "uint", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<UInt64>} pValue 
     * @returns {HRESULT} 
     */
    GetUnsignedLargeIntegerValue(key, pValue) {
        result := ComCall(14, this, "ptr", key, "uint*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    SetSignedLargeIntegerValue(key, Value) {
        result := ComCall(15, this, "ptr", key, "int64", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Int64>} pValue 
     * @returns {HRESULT} 
     */
    GetSignedLargeIntegerValue(key, pValue) {
        result := ComCall(16, this, "ptr", key, "int64*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    SetFloatValue(key, Value) {
        result := ComCall(17, this, "ptr", key, "float", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetFloatValue(key, pValue) {
        result := ComCall(18, this, "ptr", key, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {HRESULT} Value 
     * @returns {HRESULT} 
     */
    SetErrorValue(key, Value) {
        result := ComCall(19, this, "ptr", key, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<HRESULT>} pValue 
     * @returns {HRESULT} 
     */
    GetErrorValue(key, pValue) {
        result := ComCall(20, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPERTYKEY>} Value 
     * @returns {HRESULT} 
     */
    SetKeyValue(key, Value) {
        result := ComCall(21, this, "ptr", key, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPERTYKEY>} pValue 
     * @returns {HRESULT} 
     */
    GetKeyValue(key, pValue) {
        result := ComCall(22, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {BOOL} Value 
     * @returns {HRESULT} 
     */
    SetBoolValue(key, Value) {
        result := ComCall(23, this, "ptr", key, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<BOOL>} pValue 
     * @returns {HRESULT} 
     */
    GetBoolValue(key, pValue) {
        result := ComCall(24, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IUnknown>} pValue 
     * @returns {HRESULT} 
     */
    SetIUnknownValue(key, pValue) {
        result := ComCall(25, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IUnknown>} ppValue 
     * @returns {HRESULT} 
     */
    GetIUnknownValue(key, ppValue) {
        result := ComCall(26, this, "ptr", key, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Guid>} Value 
     * @returns {HRESULT} 
     */
    SetGuidValue(key, Value) {
        result := ComCall(27, this, "ptr", key, "ptr", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Guid>} pValue 
     * @returns {HRESULT} 
     */
    GetGuidValue(key, pValue) {
        result := ComCall(28, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Byte>} pValue 
     * @param {Integer} cbValue 
     * @returns {HRESULT} 
     */
    SetBufferValue(key, pValue, cbValue) {
        result := ComCall(29, this, "ptr", key, "char*", pValue, "uint", cbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Byte>} ppValue 
     * @param {Pointer<UInt32>} pcbValue 
     * @returns {HRESULT} 
     */
    GetBufferValue(key, ppValue, pcbValue) {
        result := ComCall(30, this, "ptr", key, "char*", ppValue, "uint*", pcbValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceValues>} pValue 
     * @returns {HRESULT} 
     */
    SetIPortableDeviceValuesValue(key, pValue) {
        result := ComCall(31, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceValues>} ppValue 
     * @returns {HRESULT} 
     */
    GetIPortableDeviceValuesValue(key, ppValue) {
        result := ComCall(32, this, "ptr", key, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDevicePropVariantCollection>} pValue 
     * @returns {HRESULT} 
     */
    SetIPortableDevicePropVariantCollectionValue(key, pValue) {
        result := ComCall(33, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppValue 
     * @returns {HRESULT} 
     */
    GetIPortableDevicePropVariantCollectionValue(key, ppValue) {
        result := ComCall(34, this, "ptr", key, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceKeyCollection>} pValue 
     * @returns {HRESULT} 
     */
    SetIPortableDeviceKeyCollectionValue(key, pValue) {
        result := ComCall(35, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppValue 
     * @returns {HRESULT} 
     */
    GetIPortableDeviceKeyCollectionValue(key, ppValue) {
        result := ComCall(36, this, "ptr", key, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceValuesCollection>} pValue 
     * @returns {HRESULT} 
     */
    SetIPortableDeviceValuesCollectionValue(key, pValue) {
        result := ComCall(37, this, "ptr", key, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<IPortableDeviceValuesCollection>} ppValue 
     * @returns {HRESULT} 
     */
    GetIPortableDeviceValuesCollectionValue(key, ppValue) {
        result := ComCall(38, this, "ptr", key, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     */
    RemoveValue(key) {
        result := ComCall(39, this, "ptr", key, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} pStore 
     * @returns {HRESULT} 
     */
    CopyValuesFromPropertyStore(pStore) {
        result := ComCall(40, this, "ptr", pStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPropertyStore>} pStore 
     * @returns {HRESULT} 
     */
    CopyValuesToPropertyStore(pStore) {
        result := ComCall(41, this, "ptr", pStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(42, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
