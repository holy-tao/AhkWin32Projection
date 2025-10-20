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
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<IPortableDeviceKeyCollection>} ppKeys 
     * @returns {HRESULT} 
     */
    GetSupportedResources(pszObjectID, ppKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(3, this, "ptr", pszObjectID, "ptr", ppKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Pointer<IPortableDeviceValues>} ppResourceAttributes 
     * @returns {HRESULT} 
     */
    GetResourceAttributes(pszObjectID, Key, ppResourceAttributes) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(4, this, "ptr", pszObjectID, "ptr", Key, "ptr", ppResourceAttributes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @param {Integer} dwMode 
     * @param {Pointer<UInt32>} pdwOptimalBufferSize 
     * @param {Pointer<IStream>} ppStream 
     * @returns {HRESULT} 
     */
    GetStream(pszObjectID, Key, dwMode, pdwOptimalBufferSize, ppStream) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(5, this, "ptr", pszObjectID, "ptr", Key, "uint", dwMode, "uint*", pdwOptimalBufferSize, "ptr", ppStream, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszObjectID 
     * @param {Pointer<IPortableDeviceKeyCollection>} pKeys 
     * @returns {HRESULT} 
     */
    Delete(pszObjectID, pKeys) {
        pszObjectID := pszObjectID is String ? StrPtr(pszObjectID) : pszObjectID

        result := ComCall(6, this, "ptr", pszObjectID, "ptr", pKeys, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Cancel() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceValues>} pResourceAttributes 
     * @param {Pointer<IStream>} ppData 
     * @param {Pointer<UInt32>} pdwOptimalWriteBufferSize 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {HRESULT} 
     */
    CreateResource(pResourceAttributes, ppData, pdwOptimalWriteBufferSize, ppszCookie) {
        result := ComCall(8, this, "ptr", pResourceAttributes, "ptr", ppData, "uint*", pdwOptimalWriteBufferSize, "ptr", ppszCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
