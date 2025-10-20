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
     * 
     * @param {Pointer<IPortableDevicePropVariantCollection>} pObjectIDs 
     * @param {Pointer<IPortableDeviceKeyCollection>} pKeys 
     * @param {Pointer<IPortableDevicePropertiesBulkCallback>} pCallback 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     */
    QueueGetValuesByObjectList(pObjectIDs, pKeys, pCallback, pContext) {
        result := ComCall(3, this, "ptr", pObjectIDs, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidObjectFormat 
     * @param {PWSTR} pszParentObjectID 
     * @param {Integer} dwDepth 
     * @param {Pointer<IPortableDeviceKeyCollection>} pKeys 
     * @param {Pointer<IPortableDevicePropertiesBulkCallback>} pCallback 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     */
    QueueGetValuesByObjectFormat(pguidObjectFormat, pszParentObjectID, dwDepth, pKeys, pCallback, pContext) {
        pszParentObjectID := pszParentObjectID is String ? StrPtr(pszParentObjectID) : pszParentObjectID

        result := ComCall(4, this, "ptr", pguidObjectFormat, "ptr", pszParentObjectID, "uint", dwDepth, "ptr", pKeys, "ptr", pCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValuesCollection>} pObjectValues 
     * @param {Pointer<IPortableDevicePropertiesBulkCallback>} pCallback 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     */
    QueueSetValuesByObjectList(pObjectValues, pCallback, pContext) {
        result := ComCall(5, this, "ptr", pObjectValues, "ptr", pCallback, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     */
    Start(pContext) {
        result := ComCall(6, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pContext 
     * @returns {HRESULT} 
     */
    Cancel(pContext) {
        result := ComCall(7, this, "ptr", pContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
