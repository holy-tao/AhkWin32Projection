#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IPortableDeviceValues.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValuesCollection.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceValues extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCount", "GetAt", "SetValue", "GetValue", "SetStringValue", "GetStringValue", "SetUnsignedIntegerValue", "GetUnsignedIntegerValue", "SetSignedIntegerValue", "GetSignedIntegerValue", "SetUnsignedLargeIntegerValue", "GetUnsignedLargeIntegerValue", "SetSignedLargeIntegerValue", "GetSignedLargeIntegerValue", "SetFloatValue", "GetFloatValue", "SetErrorValue", "GetErrorValue", "SetKeyValue", "GetKeyValue", "SetBoolValue", "GetBoolValue", "SetIUnknownValue", "GetIUnknownValue", "SetGuidValue", "GetGuidValue", "SetBufferValue", "GetBufferValue", "SetIPortableDeviceValuesValue", "GetIPortableDeviceValuesValue", "SetIPortableDevicePropVariantCollectionValue", "GetIPortableDevicePropVariantCollectionValue", "SetIPortableDeviceKeyCollectionValue", "GetIPortableDeviceKeyCollectionValue", "SetIPortableDeviceValuesCollectionValue", "GetIPortableDeviceValuesCollectionValue", "RemoveValue", "CopyValuesFromPropertyStore", "CopyValuesToPropertyStore", "Clear"]

    /**
     * 
     * @param {Pointer<Integer>} pcelt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getcount
     */
    GetCount(pcelt) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pceltMarshal, pcelt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getat
     */
    GetAt(index, pKey, pValue) {
        result := ComCall(4, this, "uint", index, "ptr", pKey, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setvalue
     */
    SetValue(key, pValue) {
        result := ComCall(5, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPVARIANT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getvalue
     */
    GetValue(key) {
        pValue := PROPVARIANT()
        result := ComCall(6, this, "ptr", key, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {PWSTR} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setstringvalue
     */
    SetStringValue(key, Value) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, "ptr", key, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getstringvalue
     */
    GetStringValue(key) {
        result := ComCall(8, this, "ptr", key, "ptr*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setunsignedintegervalue
     */
    SetUnsignedIntegerValue(key, Value) {
        result := ComCall(9, this, "ptr", key, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getunsignedintegervalue
     */
    GetUnsignedIntegerValue(key) {
        result := ComCall(10, this, "ptr", key, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setsignedintegervalue
     */
    SetSignedIntegerValue(key, Value) {
        result := ComCall(11, this, "ptr", key, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getsignedintegervalue
     */
    GetSignedIntegerValue(key) {
        result := ComCall(12, this, "ptr", key, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setunsignedlargeintegervalue
     */
    SetUnsignedLargeIntegerValue(key, Value) {
        result := ComCall(13, this, "ptr", key, "uint", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getunsignedlargeintegervalue
     */
    GetUnsignedLargeIntegerValue(key) {
        result := ComCall(14, this, "ptr", key, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setsignedlargeintegervalue
     */
    SetSignedLargeIntegerValue(key, Value) {
        result := ComCall(15, this, "ptr", key, "int64", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getsignedlargeintegervalue
     */
    GetSignedLargeIntegerValue(key) {
        result := ComCall(16, this, "ptr", key, "int64*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Float} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setfloatvalue
     */
    SetFloatValue(key, Value) {
        result := ComCall(17, this, "ptr", key, "float", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getfloatvalue
     */
    GetFloatValue(key) {
        result := ComCall(18, this, "ptr", key, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {HRESULT} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-seterrorvalue
     */
    SetErrorValue(key, Value) {
        result := ComCall(19, this, "ptr", key, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-geterrorvalue
     */
    GetErrorValue(key) {
        result := ComCall(20, this, "ptr", key, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<PROPERTYKEY>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setkeyvalue
     */
    SetKeyValue(key, Value) {
        result := ComCall(21, this, "ptr", key, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {PROPERTYKEY} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getkeyvalue
     */
    GetKeyValue(key) {
        pValue := PROPERTYKEY()
        result := ComCall(22, this, "ptr", key, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {BOOL} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setboolvalue
     */
    SetBoolValue(key, Value) {
        result := ComCall(23, this, "ptr", key, "int", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getboolvalue
     */
    GetBoolValue(key) {
        result := ComCall(24, this, "ptr", key, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {IUnknown} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiunknownvalue
     */
    SetIUnknownValue(key, pValue) {
        result := ComCall(25, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiunknownvalue
     */
    GetIUnknownValue(key) {
        result := ComCall(26, this, "ptr", key, "ptr*", &ppValue := 0, "HRESULT")
        return IUnknown(ppValue)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Guid>} Value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setguidvalue
     */
    SetGuidValue(key, Value) {
        result := ComCall(27, this, "ptr", key, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getguidvalue
     */
    GetGuidValue(key) {
        pValue := Guid()
        result := ComCall(28, this, "ptr", key, "ptr", pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Integer>} pValue 
     * @param {Integer} cbValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setbuffervalue
     */
    SetBufferValue(key, pValue, cbValue) {
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, "ptr", key, pValueMarshal, pValue, "uint", cbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {Pointer<Pointer<Integer>>} ppValue 
     * @param {Pointer<Integer>} pcbValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getbuffervalue
     */
    GetBufferValue(key, ppValue, pcbValue) {
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "ptr", key, ppValueMarshal, ppValue, pcbValueMarshal, pcbValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {IPortableDeviceValues} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicevaluesvalue
     */
    SetIPortableDeviceValuesValue(key, pValue) {
        result := ComCall(31, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicevaluesvalue
     */
    GetIPortableDeviceValuesValue(key) {
        result := ComCall(32, this, "ptr", key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceValues(ppValue)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {IPortableDevicePropVariantCollection} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicepropvariantcollectionvalue
     */
    SetIPortableDevicePropVariantCollectionValue(key, pValue) {
        result := ComCall(33, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicepropvariantcollectionvalue
     */
    GetIPortableDevicePropVariantCollectionValue(key) {
        result := ComCall(34, this, "ptr", key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppValue)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {IPortableDeviceKeyCollection} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicekeycollectionvalue
     */
    SetIPortableDeviceKeyCollectionValue(key, pValue) {
        result := ComCall(35, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicekeycollectionvalue
     */
    GetIPortableDeviceKeyCollectionValue(key) {
        result := ComCall(36, this, "ptr", key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppValue)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @param {IPortableDeviceValuesCollection} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicevaluescollectionvalue
     */
    SetIPortableDeviceValuesCollectionValue(key, pValue) {
        result := ComCall(37, this, "ptr", key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {IPortableDeviceValuesCollection} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicevaluescollectionvalue
     */
    GetIPortableDeviceValuesCollectionValue(key) {
        result := ComCall(38, this, "ptr", key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceValuesCollection(ppValue)
    }

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} key 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-removevalue
     */
    RemoveValue(key) {
        result := ComCall(39, this, "ptr", key, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyStore} pStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-copyvaluesfrompropertystore
     */
    CopyValuesFromPropertyStore(pStore) {
        result := ComCall(40, this, "ptr", pStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPropertyStore} pStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-copyvaluestopropertystore
     */
    CopyValuesToPropertyStore(pStore) {
        result := ComCall(41, this, "ptr", pStore, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-clear
     */
    Clear() {
        result := ComCall(42, this, "HRESULT")
        return result
    }
}
