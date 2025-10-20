#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IWpdSerializer extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Integer} dwInputBufferLength 
     * @param {Pointer<IPortableDeviceValues>} ppParams 
     * @returns {HRESULT} 
     */
    GetIPortableDeviceValuesFromBuffer(pBuffer, dwInputBufferLength, ppParams) {
        result := ComCall(3, this, "char*", pBuffer, "uint", dwInputBufferLength, "ptr", ppParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwOutputBufferLength 
     * @param {Pointer<IPortableDeviceValues>} pResults 
     * @param {Pointer<Byte>} pBuffer 
     * @param {Pointer<UInt32>} pdwBytesWritten 
     * @returns {HRESULT} 
     */
    WriteIPortableDeviceValuesToBuffer(dwOutputBufferLength, pResults, pBuffer, pdwBytesWritten) {
        result := ComCall(4, this, "uint", dwOutputBufferLength, "ptr", pResults, "char*", pBuffer, "uint*", pdwBytesWritten, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pSource 
     * @param {Pointer<Byte>} ppBuffer 
     * @param {Pointer<UInt32>} pdwBufferSize 
     * @returns {HRESULT} 
     */
    GetBufferFromIPortableDeviceValues(pSource, ppBuffer, pdwBufferSize) {
        result := ComCall(5, this, "ptr", pSource, "char*", ppBuffer, "uint*", pdwBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pSource 
     * @param {Pointer<UInt32>} pdwSize 
     * @returns {HRESULT} 
     */
    GetSerializedSize(pSource, pdwSize) {
        result := ComCall(6, this, "ptr", pSource, "uint*", pdwSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
