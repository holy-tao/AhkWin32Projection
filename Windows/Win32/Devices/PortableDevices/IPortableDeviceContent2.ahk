#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceContent.ahk

/**
 * Defines additional methods that provide access to content found on a device.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent2
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceContent2 extends IPortableDeviceContent{
    /**
     * The interface identifier for IPortableDeviceContent2
     * @type {Guid}
     */
    static IID => Guid("{9b4add96-f6bf-4034-8708-eca72bf10554}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 13

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<IPortableDeviceValues>} pProperties 
     * @param {Pointer<IStream>} ppData 
     * @param {Pointer<UInt32>} pdwOptimalWriteBufferSize 
     * @returns {HRESULT} 
     */
    UpdateObjectWithPropertiesAndData(pszObjectID, pProperties, ppData, pdwOptimalWriteBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(13, this, "ptr", pszObjectID, "ptr", pProperties, "ptr", ppData, "uint*", pdwOptimalWriteBufferSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
