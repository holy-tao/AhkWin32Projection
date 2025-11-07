#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IPortableDevicePropertiesBulk interface queries or sets multiple properties on multiple objects on a device, asynchronously.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicepropertiesbulk
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDevicePropertiesBulk extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDevicePropertiesBulk
     * @type {Guid}
     */
    static IID => Guid("{482b05c0-4056-44ed-9e0f-5e23b009da93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueueGetValuesByObjectList", "QueueGetValuesByObjectFormat", "QueueSetValuesByObjectList", "Start", "Cancel"]

    /**
     * 
     * @param {IPortableDevicePropVariantCollection} pObjectIDs 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @param {IPortableDevicePropertiesBulkCallback} pCallback 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuegetvaluesbyobjectlist
     */
    QueueGetValuesByObjectList(pObjectIDs, pKeys, pCallback) {
        pContext := Guid()
        result := ComCall(3, this, "ptr", pObjectIDs, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectFormat 
     * @param {PWSTR} pszParentObjectID 
     * @param {Integer} dwDepth 
     * @param {IPortableDeviceKeyCollection} pKeys 
     * @param {IPortableDevicePropertiesBulkCallback} pCallback 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuegetvaluesbyobjectformat
     */
    QueueGetValuesByObjectFormat(pguidObjectFormat, pszParentObjectID, dwDepth, pKeys, pCallback) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        pContext := Guid()
        result := ComCall(4, this, "ptr", pguidObjectFormat, "ptr", pszParentObjectID, "uint", dwDepth, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * 
     * @param {IPortableDeviceValuesCollection} pObjectValues 
     * @param {IPortableDevicePropertiesBulkCallback} pCallback 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-queuesetvaluesbyobjectlist
     */
    QueueSetValuesByObjectList(pObjectValues, pCallback) {
        pContext := Guid()
        result := ComCall(5, this, "ptr", pObjectValues, "ptr", pCallback, "ptr", pContext, "HRESULT")
        return pContext
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-start
     */
    Start(pContext) {
        result := ComCall(6, this, "ptr", pContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicepropertiesbulk-cancel
     */
    Cancel(pContext) {
        result := ComCall(7, this, "ptr", pContext, "HRESULT")
        return result
    }
}
