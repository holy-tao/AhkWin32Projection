#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceKeyCollection.ahk" { IPortableDeviceKeyCollection }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk" { IPropertyStore }
#Import ".\IPortableDevicePropVariantCollection.ahk" { IPortableDevicePropVariantCollection }
#Import ".\IPortableDeviceValuesCollection.ahk" { IPortableDeviceValuesCollection }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IPortableDeviceValues interface holds a collection of PROPERTYKEY/PROPVARIANT pairs.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceValues extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceValues
     * @type {Guid}
     */
    static IID := Guid("{6848f6f2-3155-4f86-b6f5-263eeeab3143}")

    /**
     * The class identifier for PortableDeviceValues
     * @type {Guid}
     */
    static CLSID := Guid("{0c15d503-d017-47ce-9016-7b3f978721cc}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceValues interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCount                                     : IntPtr
        GetAt                                        : IntPtr
        SetValue                                     : IntPtr
        GetValue                                     : IntPtr
        SetStringValue                               : IntPtr
        GetStringValue                               : IntPtr
        SetUnsignedIntegerValue                      : IntPtr
        GetUnsignedIntegerValue                      : IntPtr
        SetSignedIntegerValue                        : IntPtr
        GetSignedIntegerValue                        : IntPtr
        SetUnsignedLargeIntegerValue                 : IntPtr
        GetUnsignedLargeIntegerValue                 : IntPtr
        SetSignedLargeIntegerValue                   : IntPtr
        GetSignedLargeIntegerValue                   : IntPtr
        SetFloatValue                                : IntPtr
        GetFloatValue                                : IntPtr
        SetErrorValue                                : IntPtr
        GetErrorValue                                : IntPtr
        SetKeyValue                                  : IntPtr
        GetKeyValue                                  : IntPtr
        SetBoolValue                                 : IntPtr
        GetBoolValue                                 : IntPtr
        SetIUnknownValue                             : IntPtr
        GetIUnknownValue                             : IntPtr
        SetGuidValue                                 : IntPtr
        GetGuidValue                                 : IntPtr
        SetBufferValue                               : IntPtr
        GetBufferValue                               : IntPtr
        SetIPortableDeviceValuesValue                : IntPtr
        GetIPortableDeviceValuesValue                : IntPtr
        SetIPortableDevicePropVariantCollectionValue : IntPtr
        GetIPortableDevicePropVariantCollectionValue : IntPtr
        SetIPortableDeviceKeyCollectionValue         : IntPtr
        GetIPortableDeviceKeyCollectionValue         : IntPtr
        SetIPortableDeviceValuesCollectionValue      : IntPtr
        GetIPortableDeviceValuesCollectionValue      : IntPtr
        RemoveValue                                  : IntPtr
        CopyValuesFromPropertyStore                  : IntPtr
        CopyValuesToPropertyStore                    : IntPtr
        Clear                                        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceValues.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IPortableDeviceValues::GetCount method - The GetCount method retrieves the number of items in the collection.
     * @param {Pointer<Integer>} pcelt Pointer to a **DWORD** that contains the number of items in the collection.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getcount
     */
    GetCount(pcelt) {
        pceltMarshal := pcelt is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pceltMarshal, pcelt, "HRESULT")
        return result
    }

    /**
     * The GetAt method retrieves a value from the collection using the supplied zero-based index.
     * @remarks
     * If a property indicates a value of type VT\_UNKNOWN, the property will be one of the Windows Portable Devices ([**IPortableDeviceKeyCollection**](iportabledevicekeycollection.md), [**IPortableDeviceValuesCollection**](iportabledevicevaluescollection.md), [**IPortableDeviceValues**](iportabledevicevalues.md) or [**IPortableDevicePropVariantCollection**](iportabledevicepropvariantcollection.md)). No other interfaces can be returned by Windows Portable Devices.
     * @param {Integer} index A **DWORD** that specifies a zero-based index in the collection.
     * @param {Pointer<PROPERTYKEY>} pKey An optional **PROPERTYKEY** pointer that retrieves the key of the specified item.
     * @param {Pointer<PROPVARIANT>} pValue An optional **PROPVARIANT** that retrieves the value of the specified item. The caller must free the memory by calling **PropVariantClear** when done with it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                       |
     * |----------------------------------------------------------------------------------------------|---------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>         | The method succeeded.<br/>                  |
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | An invalid index number was specified.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getat
     */
    GetAt(index, pKey, pValue) {
        result := ComCall(4, this, "uint", index, PROPERTYKEY.Ptr, pKey, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * The SetValue method adds a new PROPVARIANT value or overwrites an existing one.
     * @remarks
     * When the VARTYPE for *pValue* is VT\_VECTOR or VT\_UI1, setting a **NULL** or zero-sized buffer is not supported. For example, neither pValue.caub.pElems = **NULL** nor pValue.caub.cElems = 0 are allowed.
     * 
     * This method can be used to retrieve a value of any type from the collection. However, if you know the value type in advance, use one of the specialized **Set...** methods of this interface to avoid the overhead of working with PROPVARIANT values directly.
     * 
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Pointer<PROPVARIANT>} pValue A **PROPVARIANT** that specifies the new value. The SDK copies the value, so the caller can release the local variable by calling **PropVariantClear** after calling this method.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setvalue
     */
    SetValue(key, pValue) {
        result := ComCall(5, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * The GetValue method retrieves a PROPVARIANT value specified by a key.
     * @remarks
     * When the VARTYPE for *pValue* is VT\_VECTOR or VT\_UI1, retrieving a **NULL** or zero-sized buffer is not supported. For example, neither pValue.caub.pElems = **NULL** nor pValue.caub.cElems = 0 are allowed.
     * 
     * This method can be used to retrieve a value of any type from the collection. However, if you know the value type in advance, use one of the specialized retrieval methods of this interface to avoid the overhead of working with PROPVARIANT values directly.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {PROPVARIANT} Pointer to the retrieved **PROPVARIANT** value. The caller must release the memory by calling **PropVariantClear** when done with it.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getvalue
     */
    GetValue(key) {
        pValue := PROPVARIANT()
        result := ComCall(6, this, PROPERTYKEY.Ptr, key, PROPVARIANT.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The SetStringValue method adds a new string value (type VT\_LPWSTR) or overwrites an existing one.
     * @remarks
     * Any existing key memory will be released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {PWSTR} Value A **LPCWSTR** that specifies the new value. The string is copied, so the caller can release the memory allocated for this value after calling this method.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setstringvalue
     */
    SetStringValue(key, Value) {
        Value := Value is String ? StrPtr(Value) : Value

        result := ComCall(7, this, PROPERTYKEY.Ptr, key, "ptr", Value, "HRESULT")
        return result
    }

    /**
     * The GetStringValue method retrieves a string value (type VT\_LPWSTR) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {PWSTR} Pointer to the retrieved **LPWSTR** value. The caller is responsible for calling **CoTaskMemFree** to release the memory.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getstringvalue
     */
    GetStringValue(key) {
        result := ComCall(8, this, PROPERTYKEY.Ptr, key, PWSTR.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetUnsignedIntegerValue method adds a new ULONG value (type VT\_UI4) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Integer} Value A **ULONG** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setunsignedintegervalue
     */
    SetUnsignedIntegerValue(key, Value) {
        result := ComCall(9, this, PROPERTYKEY.Ptr, key, "uint", Value, "HRESULT")
        return result
    }

    /**
     * The GetUnsignedIntegerValue method retrieves a ULONG value (type VT\_UI4) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Integer} Pointer to the retrieved **ULONG** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getunsignedintegervalue
     */
    GetUnsignedIntegerValue(key) {
        result := ComCall(10, this, PROPERTYKEY.Ptr, key, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetSignedIntegerValue method adds a new LONG value (type VT\_I4) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Integer} Value A **LONG** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setsignedintegervalue
     */
    SetSignedIntegerValue(key, Value) {
        result := ComCall(11, this, PROPERTYKEY.Ptr, key, "int", Value, "HRESULT")
        return result
    }

    /**
     * The GetSignedIntegerValue method retrieves a LONG value (type VT\_I4) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Integer} Pointer to the retrieved **LONG** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getsignedintegervalue
     */
    GetSignedIntegerValue(key) {
        result := ComCall(12, this, PROPERTYKEY.Ptr, key, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetUnsignedLargeIntegerValue method adds a new ULONGLONG value (type VT\_UI8) or overwrites an existing one.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Integer} Value A **ULONGLONG** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setunsignedlargeintegervalue
     */
    SetUnsignedLargeIntegerValue(key, Value) {
        result := ComCall(13, this, PROPERTYKEY.Ptr, key, "uint", Value, "HRESULT")
        return result
    }

    /**
     * The GetUnsignedLargeIntegerValue method retrieves a ULONGLONG value (type VT\_UI8) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Integer} Pointer to the retrieved **ULONGLONG** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getunsignedlargeintegervalue
     */
    GetUnsignedLargeIntegerValue(key) {
        result := ComCall(14, this, PROPERTYKEY.Ptr, key, "uint*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetSignedLargeIntegerValue method adds a new LONGLONG value (type VT\_I8) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Integer} Value A **LONGLONG** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setsignedlargeintegervalue
     */
    SetSignedLargeIntegerValue(key, Value) {
        result := ComCall(15, this, PROPERTYKEY.Ptr, key, "int64", Value, "HRESULT")
        return result
    }

    /**
     * The GetSignedLargeIntegerValue method retrieves a LONGLONG value (type VT\_I8) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Integer} Pointer to the retrieved **ULONG** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getsignedlargeintegervalue
     */
    GetSignedLargeIntegerValue(key) {
        result := ComCall(16, this, PROPERTYKEY.Ptr, key, "int64*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetFloatValue method adds a new FLOAT value (type VT\_R4) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Float} Value A **FLOAT** that contains the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setfloatvalue
     */
    SetFloatValue(key, Value) {
        result := ComCall(17, this, PROPERTYKEY.Ptr, key, "float", Value, "HRESULT")
        return result
    }

    /**
     * The GetFloatValue method retrieves a FLOAT value (type VT\_R4) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Float} Pointer to the retrieved **FLOAT** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getfloatvalue
     */
    GetFloatValue(key) {
        result := ComCall(18, this, PROPERTYKEY.Ptr, key, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetErrorValue method adds a new HRESULT value (type VT\_ERROR) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {HRESULT} Value An **HRESULT** that contains the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-seterrorvalue
     */
    SetErrorValue(key, Value) {
        result := ComCall(19, this, PROPERTYKEY.Ptr, key, "int", Value, "HRESULT")
        return result
    }

    /**
     * The GetErrorValue method retrieves an HRESULT value (type VT\_ERROR) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {HRESULT} Pointer to the retrieved **HRESULT** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-geterrorvalue
     */
    GetErrorValue(key) {
        result := ComCall(20, this, PROPERTYKEY.Ptr, key, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetKeyValue method adds a new REFPROPERTYKEY value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Pointer<PROPERTYKEY>} Value A **REFPROPERTYKEY** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setkeyvalue
     */
    SetKeyValue(key, Value) {
        result := ComCall(21, this, PROPERTYKEY.Ptr, key, PROPERTYKEY.Ptr, Value, "HRESULT")
        return result
    }

    /**
     * The GetKeyValue method retrieves a PROPERTYKEY value specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {PROPERTYKEY} Pointer to the retrieved **PROPERTYKEY** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getkeyvalue
     */
    GetKeyValue(key) {
        pValue := PROPERTYKEY()
        result := ComCall(22, this, PROPERTYKEY.Ptr, key, PROPERTYKEY.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The SetBoolValue method adds a new Boolean value (type VT\_BOOL) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {BOOL} Value A **BOOL** that specifies the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setboolvalue
     */
    SetBoolValue(key, Value) {
        result := ComCall(23, this, PROPERTYKEY.Ptr, key, BOOL, Value, "HRESULT")
        return result
    }

    /**
     * The GetBoolValue method retrieves a Boolean value (type VT\_BOOL) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {BOOL} Pointer to the retrieved **BOOL** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getboolvalue
     */
    GetBoolValue(key) {
        result := ComCall(24, this, PROPERTYKEY.Ptr, key, BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetIUnknownValue method adds a new IUnknown value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {IUnknown} pValue A pointer to an **IUnknown** interface that specifies the new value. The SDK copies a reference to the submitted interface and calls **AddRef** on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiunknownvalue
     */
    SetIUnknownValue(key, pValue) {
        result := ComCall(25, this, PROPERTYKEY.Ptr, key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetIUnknownValue method retrieves an IUnknown interface value (type VT\_UNKNOWN) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {IUnknown} Address of a variable that receives a pointer to the retrieved **IUnknown** interface. The caller is responsible for calling **Release** on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiunknownvalue
     */
    GetIUnknownValue(key) {
        result := ComCall(26, this, PROPERTYKEY.Ptr, key, "ptr*", &ppValue := 0, "HRESULT")
        return IUnknown(ppValue)
    }

    /**
     * The SetGuidValue method adds a new GUID value (type VT\_CLSID) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Pointer<Guid>} Value A **REFGUID** that contains the new value.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setguidvalue
     */
    SetGuidValue(key, Value) {
        result := ComCall(27, this, PROPERTYKEY.Ptr, key, Guid.Ptr, Value, "HRESULT")
        return result
    }

    /**
     * The GetGuidValue method retrieves a GUID value (type VT\_CLSID) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {Guid} Pointer to the retrieved **GUID** value.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getguidvalue
     */
    GetGuidValue(key) {
        pValue := Guid()
        result := ComCall(28, this, PROPERTYKEY.Ptr, key, Guid.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * The SetBufferValue method adds a new BYTE\* value (type VT\_VECTOR \| VT\_UI1) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * 
     * Setting a **NULL** or a zero-sized buffer is not supported.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {Pointer<Integer>} pValue A **BYTE\*** that contains the data to write to the item. The submitted buffer data is copied to the interface, so the caller can free this buffer after making this call.
     * @param {Integer} cbValue The size of the value pointed to by *pValue*, in bytes.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setbuffervalue
     */
    SetBufferValue(key, pValue, cbValue) {
        pValueMarshal := pValue is VarRef ? "char*" : "ptr"

        result := ComCall(29, this, PROPERTYKEY.Ptr, key, pValueMarshal, pValue, "uint", cbValue, "HRESULT")
        return result
    }

    /**
     * The GetBufferValue method retrieves a byte array value (type VT\_VECTOR \| VT\_UI1) specified by a key.
     * @remarks
     * Retrieving a **NULL** buffer or a zero-sized buffer is not supported.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @param {Pointer<Pointer<Integer>>} ppValue Pointer to the retrieved **BYTE\*** value. The caller is responsible for freeing the memory by calling **CoTaskMemFree**.
     * @param {Pointer<Integer>} pcbValue Pointer to the size of *ppValue*, in bytes.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                                            | Description                                                          |
     * |------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>                                   | The method succeeded.<br/>                                     |
     * | <dl> <dt>**DISP\_E\_TYPEMISMATCH**</dt> </dl>                   | The property specified by *key* is not a **BYTE**\* type.<br/> |
     * | <dl> <dt>**HRESULT\_FROM\_WIN32(ERROR\_NOT\_FOUND)**</dt> </dl> | The property specified by *key* is not in the collection.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getbuffervalue
     */
    GetBufferValue(key, ppValue, pcbValue) {
        ppValueMarshal := ppValue is VarRef ? "ptr*" : "ptr"
        pcbValueMarshal := pcbValue is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, PROPERTYKEY.Ptr, key, ppValueMarshal, ppValue, pcbValueMarshal, pcbValue, "HRESULT")
        return result
    }

    /**
     * The SetIPortableDeviceValuesValue method adds a new IPortableDeviceValues value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {IPortableDeviceValues} pValue Pointer to an **IPortableDeviceValues** interface that specifies the new value. The SDK copies a reference to the submitted interface and calls **AddRef** on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicevaluesvalue
     */
    SetIPortableDeviceValuesValue(key, pValue) {
        result := ComCall(31, this, PROPERTYKEY.Ptr, key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetIPortableDeviceValuesValue method retrieves an IPortableDeviceValues value (type VT\_UNKNOWN) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to the retrieved [**IPortableDeviceValues**](iportabledevicevalues.md) interface. The caller is responsible for calling **Release** on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicevaluesvalue
     */
    GetIPortableDeviceValuesValue(key) {
        result := ComCall(32, this, PROPERTYKEY.Ptr, key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceValues(ppValue)
    }

    /**
     * The SetIPortableDevicePropVariantCollectionValue method adds a new IPortableDevicePropVariantCollection value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {IPortableDevicePropVariantCollection} pValue Pointer to an **IPortableDevicePropVariantCollection** interface that specifies the new value. The SDK copies a reference to the submitted interface and calls **AddRef** on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicepropvariantcollectionvalue
     */
    SetIPortableDevicePropVariantCollectionValue(key, pValue) {
        result := ComCall(33, this, PROPERTYKEY.Ptr, key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetIPortableDevicePropVariantCollectionValue method retrieves an IPortableDevicePropVariantCollection value (type VT\_UNKNOWN) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {IPortableDevicePropVariantCollection} Address of a variable that receives a pointer to the retrieved [**IPortableDevicePropVariantCollection**](iportabledevicepropvariantcollection.md) interface. The caller is responsible for calling **Release** on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicepropvariantcollectionvalue
     */
    GetIPortableDevicePropVariantCollectionValue(key) {
        result := ComCall(34, this, PROPERTYKEY.Ptr, key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppValue)
    }

    /**
     * The SetIPortableDeviceKeyCollectionValue method adds a new SetIPortableDeviceKeyCollectionValue value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {IPortableDeviceKeyCollection} pValue Pointer to an **IPortableDeviceKeyCollection** interface that specifies the new value. The SDK copies a reference to the submitted interface and calls **AddRef** on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicekeycollectionvalue
     */
    SetIPortableDeviceKeyCollectionValue(key, pValue) {
        result := ComCall(35, this, PROPERTYKEY.Ptr, key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetIPortableDeviceKeyCollectionValue method retrieves an IPortableDeviceKeyCollection value (type VT\_UNKNOWN) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {IPortableDeviceKeyCollection} Pointer to the retrieved [**IPortableDeviceKeyCollection**](iportabledevicekeycollection.md) interface pointer. The caller is responsible for calling **Release** on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicekeycollectionvalue
     */
    GetIPortableDeviceKeyCollectionValue(key) {
        result := ComCall(36, this, PROPERTYKEY.Ptr, key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppValue)
    }

    /**
     * The SetIPortableDeviceValuesCollectionValue method adds a new IPortableDeviceValuesCollection value (type VT\_UNKNOWN) or overwrites an existing one.
     * @remarks
     * If an existing value has the same key that is specified by the *key* parameter, it overwrites the existing value without any warning. The existing key memory is released appropriately.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to create or overwrite.
     * @param {IPortableDeviceValuesCollection} pValue Pointer to an **IPortableDeviceValuesCollection** interface that specifies the new value. The SDK copies a reference to the submitted interface and calls **AddRef** on it.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-setiportabledevicevaluescollectionvalue
     */
    SetIPortableDeviceValuesCollectionValue(key, pValue) {
        result := ComCall(37, this, PROPERTYKEY.Ptr, key, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * The GetIPortableDeviceValuesCollectionValue method retrieves an IPortableDeviceValuesCollection value (type VT\_UNKNOWN) specified by a key.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** key that specifies the item to retrieve.
     * @returns {IPortableDeviceValuesCollection} Address of a variable that receives a pointer to the retrieved [**IPortableDeviceValuesCollection**](iportabledevicevaluescollection.md) interface. The caller is responsible for calling **Release** on the retrieved interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-getiportabledevicevaluescollectionvalue
     */
    GetIPortableDeviceValuesCollectionValue(key) {
        result := ComCall(38, this, PROPERTYKEY.Ptr, key, "ptr*", &ppValue := 0, "HRESULT")
        return IPortableDeviceValuesCollection(ppValue)
    }

    /**
     * The RemoveValue method removes an item from the collection.
     * @param {Pointer<PROPERTYKEY>} key A **REFPROPERTYKEY** that specifies the item to remove.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-removevalue
     */
    RemoveValue(key) {
        result := ComCall(39, this, PROPERTYKEY.Ptr, key, "HRESULT")
        return result
    }

    /**
     * The CopyValuesFromPropertyStore method copies the contents of an IPropertyStore into the collection.
     * @remarks
     * This method automatically converts all **VT\_BSTR** values to **VT\_LPWSTR** values.
     * 
     * Many external applications or components that communicate with your application, such as some shell applications, use the **IPropertyStore** interface. This method provides a quick and easy way to exchange data with these programs.
     * 
     * This method is supported in Windows Vista and later versions of Windows.
     * @param {IPropertyStore} pStore Pointer to an **IPropertyStore** to copy into the collection.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-copyvaluesfrompropertystore
     */
    CopyValuesFromPropertyStore(pStore) {
        result := ComCall(40, this, "ptr", pStore, "HRESULT")
        return result
    }

    /**
     * The CopyValuesToPropertyStore method copies all the values from a collection into an IPropertyStore interface.
     * @remarks
     * This method does not convert values of VT\_LPWSTR into VT\_BSTR. Many external applications or components that communicate with your application, such as some shell applications, use the **IPropertyStore** interface. This method provides a quick and easy way to exchange data with these programs.
     * 
     * This method is supported in Windows Vista and later versions of Windows.
     * @param {IPropertyStore} pStore Pointer to a store object.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-copyvaluestopropertystore
     */
    CopyValuesToPropertyStore(pStore) {
        result := ComCall(41, this, "ptr", pStore, "HRESULT")
        return result
    }

    /**
     * IPortableDeviceValues::Clear method - The Clear method deletes all items from the collection.
     * @remarks
     * This method frees the memory for all dynamically allocated items in the collection. For interfaces, it calls **Release**.
     * @returns {HRESULT} This method has no parameters.
     * 
     * 
     * The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                          | Description                      |
     * |--------------------------------------------------------------------------------------|----------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl> | The method succeeded.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iportabledevicevalues-clear
     */
    Clear() {
        result := ComCall(42, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceValues.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCount := CallbackCreate(GetMethod(implObj, "GetCount"), flags, 2)
        this.vtbl.GetAt := CallbackCreate(GetMethod(implObj, "GetAt"), flags, 4)
        this.vtbl.SetValue := CallbackCreate(GetMethod(implObj, "SetValue"), flags, 3)
        this.vtbl.GetValue := CallbackCreate(GetMethod(implObj, "GetValue"), flags, 3)
        this.vtbl.SetStringValue := CallbackCreate(GetMethod(implObj, "SetStringValue"), flags, 3)
        this.vtbl.GetStringValue := CallbackCreate(GetMethod(implObj, "GetStringValue"), flags, 3)
        this.vtbl.SetUnsignedIntegerValue := CallbackCreate(GetMethod(implObj, "SetUnsignedIntegerValue"), flags, 3)
        this.vtbl.GetUnsignedIntegerValue := CallbackCreate(GetMethod(implObj, "GetUnsignedIntegerValue"), flags, 3)
        this.vtbl.SetSignedIntegerValue := CallbackCreate(GetMethod(implObj, "SetSignedIntegerValue"), flags, 3)
        this.vtbl.GetSignedIntegerValue := CallbackCreate(GetMethod(implObj, "GetSignedIntegerValue"), flags, 3)
        this.vtbl.SetUnsignedLargeIntegerValue := CallbackCreate(GetMethod(implObj, "SetUnsignedLargeIntegerValue"), flags, 3)
        this.vtbl.GetUnsignedLargeIntegerValue := CallbackCreate(GetMethod(implObj, "GetUnsignedLargeIntegerValue"), flags, 3)
        this.vtbl.SetSignedLargeIntegerValue := CallbackCreate(GetMethod(implObj, "SetSignedLargeIntegerValue"), flags, 3)
        this.vtbl.GetSignedLargeIntegerValue := CallbackCreate(GetMethod(implObj, "GetSignedLargeIntegerValue"), flags, 3)
        this.vtbl.SetFloatValue := CallbackCreate(GetMethod(implObj, "SetFloatValue"), flags, 3)
        this.vtbl.GetFloatValue := CallbackCreate(GetMethod(implObj, "GetFloatValue"), flags, 3)
        this.vtbl.SetErrorValue := CallbackCreate(GetMethod(implObj, "SetErrorValue"), flags, 3)
        this.vtbl.GetErrorValue := CallbackCreate(GetMethod(implObj, "GetErrorValue"), flags, 3)
        this.vtbl.SetKeyValue := CallbackCreate(GetMethod(implObj, "SetKeyValue"), flags, 3)
        this.vtbl.GetKeyValue := CallbackCreate(GetMethod(implObj, "GetKeyValue"), flags, 3)
        this.vtbl.SetBoolValue := CallbackCreate(GetMethod(implObj, "SetBoolValue"), flags, 3)
        this.vtbl.GetBoolValue := CallbackCreate(GetMethod(implObj, "GetBoolValue"), flags, 3)
        this.vtbl.SetIUnknownValue := CallbackCreate(GetMethod(implObj, "SetIUnknownValue"), flags, 3)
        this.vtbl.GetIUnknownValue := CallbackCreate(GetMethod(implObj, "GetIUnknownValue"), flags, 3)
        this.vtbl.SetGuidValue := CallbackCreate(GetMethod(implObj, "SetGuidValue"), flags, 3)
        this.vtbl.GetGuidValue := CallbackCreate(GetMethod(implObj, "GetGuidValue"), flags, 3)
        this.vtbl.SetBufferValue := CallbackCreate(GetMethod(implObj, "SetBufferValue"), flags, 4)
        this.vtbl.GetBufferValue := CallbackCreate(GetMethod(implObj, "GetBufferValue"), flags, 4)
        this.vtbl.SetIPortableDeviceValuesValue := CallbackCreate(GetMethod(implObj, "SetIPortableDeviceValuesValue"), flags, 3)
        this.vtbl.GetIPortableDeviceValuesValue := CallbackCreate(GetMethod(implObj, "GetIPortableDeviceValuesValue"), flags, 3)
        this.vtbl.SetIPortableDevicePropVariantCollectionValue := CallbackCreate(GetMethod(implObj, "SetIPortableDevicePropVariantCollectionValue"), flags, 3)
        this.vtbl.GetIPortableDevicePropVariantCollectionValue := CallbackCreate(GetMethod(implObj, "GetIPortableDevicePropVariantCollectionValue"), flags, 3)
        this.vtbl.SetIPortableDeviceKeyCollectionValue := CallbackCreate(GetMethod(implObj, "SetIPortableDeviceKeyCollectionValue"), flags, 3)
        this.vtbl.GetIPortableDeviceKeyCollectionValue := CallbackCreate(GetMethod(implObj, "GetIPortableDeviceKeyCollectionValue"), flags, 3)
        this.vtbl.SetIPortableDeviceValuesCollectionValue := CallbackCreate(GetMethod(implObj, "SetIPortableDeviceValuesCollectionValue"), flags, 3)
        this.vtbl.GetIPortableDeviceValuesCollectionValue := CallbackCreate(GetMethod(implObj, "GetIPortableDeviceValuesCollectionValue"), flags, 3)
        this.vtbl.RemoveValue := CallbackCreate(GetMethod(implObj, "RemoveValue"), flags, 2)
        this.vtbl.CopyValuesFromPropertyStore := CallbackCreate(GetMethod(implObj, "CopyValuesFromPropertyStore"), flags, 2)
        this.vtbl.CopyValuesToPropertyStore := CallbackCreate(GetMethod(implObj, "CopyValuesToPropertyStore"), flags, 2)
        this.vtbl.Clear := CallbackCreate(GetMethod(implObj, "Clear"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCount)
        CallbackFree(this.vtbl.GetAt)
        CallbackFree(this.vtbl.SetValue)
        CallbackFree(this.vtbl.GetValue)
        CallbackFree(this.vtbl.SetStringValue)
        CallbackFree(this.vtbl.GetStringValue)
        CallbackFree(this.vtbl.SetUnsignedIntegerValue)
        CallbackFree(this.vtbl.GetUnsignedIntegerValue)
        CallbackFree(this.vtbl.SetSignedIntegerValue)
        CallbackFree(this.vtbl.GetSignedIntegerValue)
        CallbackFree(this.vtbl.SetUnsignedLargeIntegerValue)
        CallbackFree(this.vtbl.GetUnsignedLargeIntegerValue)
        CallbackFree(this.vtbl.SetSignedLargeIntegerValue)
        CallbackFree(this.vtbl.GetSignedLargeIntegerValue)
        CallbackFree(this.vtbl.SetFloatValue)
        CallbackFree(this.vtbl.GetFloatValue)
        CallbackFree(this.vtbl.SetErrorValue)
        CallbackFree(this.vtbl.GetErrorValue)
        CallbackFree(this.vtbl.SetKeyValue)
        CallbackFree(this.vtbl.GetKeyValue)
        CallbackFree(this.vtbl.SetBoolValue)
        CallbackFree(this.vtbl.GetBoolValue)
        CallbackFree(this.vtbl.SetIUnknownValue)
        CallbackFree(this.vtbl.GetIUnknownValue)
        CallbackFree(this.vtbl.SetGuidValue)
        CallbackFree(this.vtbl.GetGuidValue)
        CallbackFree(this.vtbl.SetBufferValue)
        CallbackFree(this.vtbl.GetBufferValue)
        CallbackFree(this.vtbl.SetIPortableDeviceValuesValue)
        CallbackFree(this.vtbl.GetIPortableDeviceValuesValue)
        CallbackFree(this.vtbl.SetIPortableDevicePropVariantCollectionValue)
        CallbackFree(this.vtbl.GetIPortableDevicePropVariantCollectionValue)
        CallbackFree(this.vtbl.SetIPortableDeviceKeyCollectionValue)
        CallbackFree(this.vtbl.GetIPortableDeviceKeyCollectionValue)
        CallbackFree(this.vtbl.SetIPortableDeviceValuesCollectionValue)
        CallbackFree(this.vtbl.GetIPortableDeviceValuesCollectionValue)
        CallbackFree(this.vtbl.RemoveValue)
        CallbackFree(this.vtbl.CopyValuesFromPropertyStore)
        CallbackFree(this.vtbl.CopyValuesToPropertyStore)
        CallbackFree(this.vtbl.Clear)
    }
}
