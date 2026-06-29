#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWpdSerializer interface is used by the device driver to serialize IPortableDeviceValues interfaces to and from the raw data buffers used to communicate with the application.Applications do not need to use this interface, because the data is serialized and deserialized automatically when calling IPortableDevice::SendCommand.To get this interface, call CoCreateInstance and pass in IID\_IWpdSerializer.
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IWpdSerializer extends IUnknown {
    /**
     * The interface identifier for IWpdSerializer
     * @type {Guid}
     */
    static IID := Guid("{b32f4002-bb27-45ff-af4f-06631c1e8dad}")

    /**
     * The class identifier for WpdSerializer
     * @type {Guid}
     */
    static CLSID := Guid("{0b91a74b-ad7c-4a9d-b563-29eef9167172}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWpdSerializer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetIPortableDeviceValuesFromBuffer : IntPtr
        WriteIPortableDeviceValuesToBuffer : IntPtr
        GetBufferFromIPortableDeviceValues : IntPtr
        GetSerializedSize                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWpdSerializer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetIPortableDeviceValuesFromBuffer method deserializes a byte array to an IPortableDeviceValues interface.
     * @param {Pointer<Integer>} pBuffer Pointer to the buffer to deserialize.
     * @param {Integer} dwInputBufferLength 
     * @returns {IPortableDeviceValues} Address of a variable that receives a pointer to an [**IPortableDeviceValues**](iportabledevicevalues.md) interface created from the buffer. The application is responsible for calling **Release** on the interface.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getiportabledevicevaluesfrombuffer
     */
    GetIPortableDeviceValuesFromBuffer(pBuffer, dwInputBufferLength) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwInputBufferLength, "ptr*", &ppParams := 0, "HRESULT")
        return IPortableDeviceValues(ppParams)
    }

    /**
     * The WriteIPortableDeviceValuesToBuffer method serializes an IPortableDeviceValues interface to a caller-allocated byte array.
     * @remarks
     * This method copies an **IPortableDeviceValues** interface into an existing buffer. If you want to allocate a new buffer, use [**GetBufferFromIPortableDeviceValues**](iwpdserializer-getbufferfromiportabledevicevalues.md).
     * @param {Integer} dwOutputBufferLength 
     * @param {IPortableDeviceValues} pResults Pointer to an [**IPortableDeviceValues**](iportabledevicevalues.md) interface to serialize.
     * @param {Pointer<Integer>} pBuffer Pointer to a caller-allocated buffer. To learn the size of the required buffer, call **GetSerializedSize**.
     * @param {Pointer<Integer>} pdwBytesWritten Pointer to a **DWORD** that indicates the number of bytes that was actually written to the caller-allocated buffer.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                   | Description                                               |
     * |-----------------------------------------------------------------------------------------------|-----------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>          | The method succeeded.<br/>                          |
     * | <dl> <dt>**E\_POINTER**</dt> </dl>     | A required pointer argument was **NULL**.<br/>      |
     * | <dl> <dt>**E\_OUTOFMEMORY**</dt> </dl> | The caller-provided buffer was not big enough.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-writeiportabledevicevaluestobuffer
     */
    WriteIPortableDeviceValuesToBuffer(dwOutputBufferLength, pResults, pBuffer, pdwBytesWritten) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwBytesWrittenMarshal := pdwBytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwOutputBufferLength, "ptr", pResults, pBufferMarshal, pBuffer, pdwBytesWrittenMarshal, pdwBytesWritten, "HRESULT")
        return result
    }

    /**
     * The GetBufferFromIPortableDeviceValues method serializes a submitted IPortableDeviceValues interface to an allocated byte array. The byte array returned is allocated for the caller and should be freed by the caller using CoTaskMemFree.
     * @param {IPortableDeviceValues} pSource Pointer to an [**IPortableDeviceValues**](iportabledevicevalues.md) interface to serialize.
     * @param {Pointer<Pointer<Integer>>} ppBuffer Pointer to a **BYTE\*** that contains the serialized data. Windows Portable Devices allocates this memory; the caller must free it by calling **CoTaskMemFree**.
     * @param {Pointer<Integer>} pdwBufferSize Pointer to a **DWORD** that specifies the size of allocated buffer, in bytes.
     * @returns {HRESULT} The method returns an **HRESULT**. Possible values include, but are not limited to, those in the following table.
     * 
     * 
     * 
     * | Return code                                                                                   | Description                                                            |
     * |-----------------------------------------------------------------------------------------------|------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> </dl>          | The method succeeded.<br/>                                       |
     * | <dl> <dt>**E\_POINTER**</dt> </dl>     | A required pointer argument was **NULL**.<br/>                   |
     * | <dl> <dt>**E\_OUTOFMEMORY**</dt> </dl> | There was not enough memory available to create the buffer.<br/> |
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getbufferfromiportabledevicevalues
     */
    GetBufferFromIPortableDeviceValues(pSource, ppBuffer, pdwBufferSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pSource, ppBufferMarshal, ppBuffer, pdwBufferSizeMarshal, pdwBufferSize, "HRESULT")
        return result
    }

    /**
     * The GetSerializedSize method calculates the buffer size that is required to hold a serialized IPortableDeviceValues interface.
     * @param {IPortableDeviceValues} pSource Pointer to an [**IPortableDeviceValues**](iportabledevicevalues.md) interface whose size you want to request.
     * @returns {Integer} Pointer to a **DWORD** that indicates the buffer size that is required to serialize *pSource*, in bytes.
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getserializedsize
     */
    GetSerializedSize(pSource) {
        result := ComCall(6, this, "ptr", pSource, "uint*", &pdwSize := 0, "HRESULT")
        return pdwSize
    }

    Query(iid) {
        if (IWpdSerializer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetIPortableDeviceValuesFromBuffer := CallbackCreate(GetMethod(implObj, "GetIPortableDeviceValuesFromBuffer"), flags, 4)
        this.vtbl.WriteIPortableDeviceValuesToBuffer := CallbackCreate(GetMethod(implObj, "WriteIPortableDeviceValuesToBuffer"), flags, 5)
        this.vtbl.GetBufferFromIPortableDeviceValues := CallbackCreate(GetMethod(implObj, "GetBufferFromIPortableDeviceValues"), flags, 4)
        this.vtbl.GetSerializedSize := CallbackCreate(GetMethod(implObj, "GetSerializedSize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetIPortableDeviceValuesFromBuffer)
        CallbackFree(this.vtbl.WriteIPortableDeviceValuesToBuffer)
        CallbackFree(this.vtbl.GetBufferFromIPortableDeviceValues)
        CallbackFree(this.vtbl.GetSerializedSize)
    }
}
