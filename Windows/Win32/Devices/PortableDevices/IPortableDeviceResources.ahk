#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceKeyCollection.ahk
#Include .\IPortableDeviceValues.ahk
#Include ..\..\System\Com\IStream.ahk
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
     * @returns {IPortableDeviceKeyCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getsupportedresources
     */
    GetSupportedResources(pszObjectID) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", &ppKeys := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppKeys)
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getresourceattributes
     */
    GetResourceAttributes(pszObjectID, Key) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr*", &ppResourceAttributes := 0, "HRESULT")
        return IPortableDeviceValues(ppResourceAttributes)
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Integer} dwMode 
     * @param {Pointer<Integer>} pdwOptimalBufferSize 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-getstream
     */
    GetStream(pszObjectID, Key, dwMode, pdwOptimalBufferSize) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        pdwOptimalBufferSizeMarshal := pdwOptimalBufferSize is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", Key, "uint", dwMode, pdwOptimalBufferSizeMarshal, pdwOptimalBufferSize, "ptr*", &ppStream := 0, "HRESULT")
        return IStream(ppStream)
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
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceresources-createresource
     */
    CreateResource(pResourceAttributes, pdwOptimalWriteBufferSize, ppszCookie) {
        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"
        ppszCookieMarshal := ppszCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pResourceAttributes, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, ppszCookieMarshal, ppszCookie, "HRESULT")
        return IStream(ppData)
    }
}
