#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumPortableDeviceObjectIDs.ahk
#Include .\IPortableDeviceProperties.ahk
#Include .\IPortableDeviceResources.ahk
#Include ..\..\System\Com\IStream.ahk
#Include .\IPortableDevicePropVariantCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceContent interface provides methods to create, enumerate, examine, and delete content on a device. To get this interface, call IPortableDevice::Content.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicecontent
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceContent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceContent
     * @type {Guid}
     */
    static IID => Guid("{6a96ed84-7c73-4480-9938-bf5af477d426}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["EnumObjects", "Properties", "Transfer", "CreateObjectWithPropertiesOnly", "CreateObjectWithPropertiesAndData", "Delete", "GetObjectIDsFromPersistentUniqueIDs", "Cancel", "Move", "Copy"]

    /**
     * The EnumObjects function enumerates the pens or brushes available for the specified device context (DC).
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszParentObjectID 
     * @param {IPortableDeviceValues} pFilter 
     * @returns {IEnumPortableDeviceObjectIDs} 
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(dwFlags, pszParentObjectID, pFilter) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszParentObjectID, "ptr", pFilter, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumPortableDeviceObjectIDs(ppEnum)
    }

    /**
     * 
     * @returns {IPortableDeviceProperties} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-properties
     */
    Properties() {
        result := ComCall(4, this, "ptr*", &ppProperties := 0, "HRESULT")
        return IPortableDeviceProperties(ppProperties)
    }

    /**
     * 
     * @returns {IPortableDeviceResources} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-transfer
     */
    Transfer() {
        result := ComCall(5, this, "ptr*", &ppResources := 0, "HRESULT")
        return IPortableDeviceResources(ppResources)
    }

    /**
     * 
     * @param {IPortableDeviceValues} pValues 
     * @param {Pointer<PWSTR>} ppszObjectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesonly
     */
    CreateObjectWithPropertiesOnly(pValues, ppszObjectID) {
        ppszObjectIDMarshal := ppszObjectID is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", pValues, ppszObjectIDMarshal, ppszObjectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pValues 
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {IStream} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata
     */
    CreateObjectWithPropertiesAndData(pValues, pdwOptimalWriteBufferSize, ppszCookie) {
        pdwOptimalWriteBufferSizeMarshal := pdwOptimalWriteBufferSize is VarRef ? "uint*" : "ptr"
        ppszCookieMarshal := ppszCookie is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pValues, "ptr*", &ppData := 0, pdwOptimalWriteBufferSizeMarshal, pdwOptimalWriteBufferSize, ppszCookieMarshal, ppszCookie, "HRESULT")
        return IStream(ppData)
    }

    /**
     * 
     * @param {Integer} dwOptions 
     * @param {IPortableDevicePropVariantCollection} pObjectIDs 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-delete
     */
    Delete(dwOptions, pObjectIDs, ppResults) {
        result := ComCall(8, this, "uint", dwOptions, "ptr", pObjectIDs, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDevicePropVariantCollection} pPersistentUniqueIDs 
     * @returns {IPortableDevicePropVariantCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-getobjectidsfrompersistentuniqueids
     */
    GetObjectIDsFromPersistentUniqueIDs(pPersistentUniqueIDs) {
        result := ComCall(9, this, "ptr", pPersistentUniqueIDs, "ptr*", &ppObjectIDs := 0, "HRESULT")
        return IPortableDevicePropVariantCollection(ppObjectIDs)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-cancel
     */
    Cancel() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDevicePropVariantCollection} pObjectIDs 
     * @param {PWSTR} pszDestinationFolderObjectID 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-move
     */
    Move(pObjectIDs, pszDestinationFolderObjectID, ppResults) {
        pszDestinationFolderObjectID := pszDestinationFolderObjectID is String ? StrPtr(pszDestinationFolderObjectID) : pszDestinationFolderObjectID

        result := ComCall(11, this, "ptr", pObjectIDs, "ptr", pszDestinationFolderObjectID, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDevicePropVariantCollection} pObjectIDs 
     * @param {PWSTR} pszDestinationFolderObjectID 
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-copy
     */
    Copy(pObjectIDs, pszDestinationFolderObjectID, ppResults) {
        pszDestinationFolderObjectID := pszDestinationFolderObjectID is String ? StrPtr(pszDestinationFolderObjectID) : pszDestinationFolderObjectID

        result := ComCall(12, this, "ptr", pObjectIDs, "ptr", pszDestinationFolderObjectID, "ptr*", ppResults, "HRESULT")
        return result
    }
}
