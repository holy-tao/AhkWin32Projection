#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IWpdSerializer extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWpdSerializer
     * @type {Guid}
     */
    static IID => Guid("{b32f4002-bb27-45ff-af4f-06631c1e8dad}")

    /**
     * The class identifier for WpdSerializer
     * @type {Guid}
     */
    static CLSID => Guid("{0b91a74b-ad7c-4a9d-b563-29eef9167172}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetIPortableDeviceValuesFromBuffer", "WriteIPortableDeviceValuesToBuffer", "GetBufferFromIPortableDeviceValues", "GetSerializedSize"]

    /**
     * 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Integer} dwInputBufferLength 
     * @param {Pointer<IPortableDeviceValues>} ppParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getiportabledevicevaluesfrombuffer
     */
    GetIPortableDeviceValuesFromBuffer(pBuffer, dwInputBufferLength, ppParams) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, pBufferMarshal, pBuffer, "uint", dwInputBufferLength, "ptr*", ppParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwOutputBufferLength 
     * @param {IPortableDeviceValues} pResults 
     * @param {Pointer<Integer>} pBuffer 
     * @param {Pointer<Integer>} pdwBytesWritten 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-writeiportabledevicevaluestobuffer
     */
    WriteIPortableDeviceValuesToBuffer(dwOutputBufferLength, pResults, pBuffer, pdwBytesWritten) {
        pBufferMarshal := pBuffer is VarRef ? "char*" : "ptr"
        pdwBytesWrittenMarshal := pdwBytesWritten is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", dwOutputBufferLength, "ptr", pResults, pBufferMarshal, pBuffer, pdwBytesWrittenMarshal, pdwBytesWritten, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pSource 
     * @param {Pointer<Pointer<Integer>>} ppBuffer 
     * @param {Pointer<Integer>} pdwBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getbufferfromiportabledevicevalues
     */
    GetBufferFromIPortableDeviceValues(pSource, ppBuffer, pdwBufferSize) {
        ppBufferMarshal := ppBuffer is VarRef ? "ptr*" : "ptr"
        pdwBufferSizeMarshal := pdwBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pSource, ppBufferMarshal, ppBuffer, pdwBufferSizeMarshal, pdwBufferSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pSource 
     * @param {Pointer<Integer>} pdwSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/wpd_sdk/iwpdserializer-getserializedsize
     */
    GetSerializedSize(pSource, pdwSize) {
        pdwSizeMarshal := pdwSize is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pSource, pdwSizeMarshal, pdwSize, "HRESULT")
        return result
    }
}
