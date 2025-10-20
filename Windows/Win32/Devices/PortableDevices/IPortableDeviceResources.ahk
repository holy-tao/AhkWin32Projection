#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceResources interface provides access to an object's raw data. Use this interface to read or write resources in an object. To get this interface, call IPortableDeviceContent::Transfer.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceresources
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceResources extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceResources
     * @type {Guid}
     */
    static IID => Guid("{fd8878ac-d841-4d17-891c-e6829cdb6934}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedResources", "GetResourceAttributes", "GetStream", "Delete", "Cancel", "CreateResource"]

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources
     */
    GetSupportedResources(pszObjectID, ppKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", ppKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<IPortableDeviceValues>} ppResourceAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getresourceattributes
     */
    GetResourceAttributes(pszObjectID, Key, ppResourceAttributes) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr*", ppResourceAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Integer} dwMode 
     * @param {Pointer<Integer>} pdwOptimalBufferSize 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getstream
     */
    GetStream(pszObjectID, Key, dwMode, pdwOptimalBufferSize, ppStream) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", Key, "uint", dwMode, "uint*", pdwOptimalBufferSize, "ptr*", ppStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-delete
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pResourceAttributes 
     * @param {Pointer<IStream>} ppData 
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-createresource
     */
    CreateResource(pResourceAttributes, ppData, pdwOptimalWriteBufferSize, ppszCookie) {
        result := ComCall(8, this, "ptr", pResourceAttributes, "ptr*", ppData, "uint*", pdwOptimalWriteBufferSize, "ptr", ppszCookie, "HRESULT")
        return result
    }
}
