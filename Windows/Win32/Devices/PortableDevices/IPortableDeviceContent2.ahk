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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateObjectWithPropertiesAndData"]

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {IPortableDeviceValues} pProperties 
     * @param {Pointer<IStream>} ppData 
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent2-updateobjectwithpropertiesanddata
     */
    UpdateObjectWithPropertiesAndData(pszObjectID, pProperties, ppData, pdwOptimalWriteBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(13, this, "ptr", pszObjectID, "ptr", pProperties, "ptr*", ppData, "uint*", pdwOptimalWriteBufferSize, "HRESULT")
        return result
    }
}
