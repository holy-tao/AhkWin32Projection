#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDeviceProperties interface retrieves, adds, or deletes properties from an object on a device, or the device itself.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceproperties
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceProperties extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceProperties
     * @type {Guid}
     */
    static IID => Guid("{7f6d695c-03df-4439-a809-59266beee3a6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedProperties", "GetPropertyAttributes", "GetValues", "SetValues", "Delete", "Cancel"]

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getsupportedproperties
     */
    GetSupportedProperties(pszObjectID, ppKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr*", ppKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<IPortableDeviceValues>} ppAttributes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getpropertyattributes
     */
    GetPropertyAttributes(pszObjectID, Key, ppAttributes) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr*", ppAttributes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @param {Pointer<IPortableDeviceValues>} ppValues 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-getvalues
     */
    GetValues(pszObjectID, pKeys, ppValues) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", pKeys, "ptr*", ppValues, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {IPortableDeviceValues} pValues 
     * @param {Pointer<IPortableDeviceValues>} ppResults 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-setvalues
     */
    SetValues(pszObjectID, pValues, ppResults) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pValues, "ptr*", ppResults, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-delete
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(7, this, "ptr", pszObjectID, "ptr", pKeys, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceproperties-cancel
     */
    Cancel() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
