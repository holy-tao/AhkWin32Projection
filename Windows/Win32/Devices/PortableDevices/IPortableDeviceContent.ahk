#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IEnumPortableDeviceObjectIDs>} ppEnum 
     * @returns {HRESULT} If the function succeeds, the return value is the last value returned by the callback function. Its meaning is user-defined.
     * 
     * If the objects cannot be enumerated (for example, there are too many objects), the function returns zero without calling the callback function.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-enumobjects
     */
    EnumObjects(dwFlags, pszParentObjectID, pFilter, ppEnum) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        result := ComCall(3, this, "uint", dwFlags, "ptr", pszParentObjectID, "ptr", pFilter, "ptr*", ppEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceProperties>} ppProperties 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-properties
     */
    Properties(ppProperties) {
        result := ComCall(4, this, "ptr*", ppProperties, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceResources>} ppResources 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-transfer
     */
    Transfer(ppResources) {
        result := ComCall(5, this, "ptr*", ppResources, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pValues 
     * @param {Pointer<PWSTR>} ppszObjectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesonly
     */
    CreateObjectWithPropertiesOnly(pValues, ppszObjectID) {
        result := ComCall(6, this, "ptr", pValues, "ptr", ppszObjectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IPortableDeviceValues} pValues 
     * @param {Pointer<IStream>} ppData 
     * @param {Pointer<Integer>} pdwOptimalWriteBufferSize 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-createobjectwithpropertiesanddata
     */
    CreateObjectWithPropertiesAndData(pValues, ppData, pdwOptimalWriteBufferSize, ppszCookie) {
        result := ComCall(7, this, "ptr", pValues, "ptr*", ppData, "uint*", pdwOptimalWriteBufferSize, "ptr", ppszCookie, "HRESULT")
        return result
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
     * @param {Pointer<IPortableDevicePropVariantCollection>} ppObjectIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicecontent-getobjectidsfrompersistentuniqueids
     */
    GetObjectIDsFromPersistentUniqueIDs(pPersistentUniqueIDs, ppObjectIDs) {
        result := ComCall(9, this, "ptr", pPersistentUniqueIDs, "ptr*", ppObjectIDs, "HRESULT")
        return result
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
