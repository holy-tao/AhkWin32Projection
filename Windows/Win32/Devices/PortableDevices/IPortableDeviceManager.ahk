#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enumerates devices that are connected to the computer and provides a simple way to request installation information, including manufacturer, friendly name, and description.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledevicemanager
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceManager extends IUnknown{
    /**
     * The interface identifier for IPortableDeviceManager
     * @type {Guid}
     */
    static IID => Guid("{a1567595-4c2f-4574-a6fa-ecef917b9a40}")

    /**
     * The class identifier for PortableDeviceManager
     * @type {Guid}
     */
    static CLSID => Guid("{0af10cec-2ecd-4b92-9581-34f6ae0637f3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pPnPDeviceIDs 
     * @param {Pointer<UInt32>} pcPnPDeviceIDs 
     * @returns {HRESULT} 
     */
    GetDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        result := ComCall(3, this, "ptr", pPnPDeviceIDs, "uint*", pcPnPDeviceIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RefreshDeviceList() {
        result := ComCall(4, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceFriendlyName 
     * @param {Pointer<UInt32>} pcchDeviceFriendlyName 
     * @returns {HRESULT} 
     */
    GetDeviceFriendlyName(pszPnPDeviceID, pDeviceFriendlyName, pcchDeviceFriendlyName) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceFriendlyName := pDeviceFriendlyName is String ? StrPtr(pDeviceFriendlyName) : pDeviceFriendlyName

        result := ComCall(5, this, "ptr", pszPnPDeviceID, "ptr", pDeviceFriendlyName, "uint*", pcchDeviceFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceDescription 
     * @param {Pointer<UInt32>} pcchDeviceDescription 
     * @returns {HRESULT} 
     */
    GetDeviceDescription(pszPnPDeviceID, pDeviceDescription, pcchDeviceDescription) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceDescription := pDeviceDescription is String ? StrPtr(pDeviceDescription) : pDeviceDescription

        result := ComCall(6, this, "ptr", pszPnPDeviceID, "ptr", pDeviceDescription, "uint*", pcchDeviceDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceManufacturer 
     * @param {Pointer<UInt32>} pcchDeviceManufacturer 
     * @returns {HRESULT} 
     */
    GetDeviceManufacturer(pszPnPDeviceID, pDeviceManufacturer, pcchDeviceManufacturer) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceManufacturer := pDeviceManufacturer is String ? StrPtr(pDeviceManufacturer) : pDeviceManufacturer

        result := ComCall(7, this, "ptr", pszPnPDeviceID, "ptr", pDeviceManufacturer, "uint*", pcchDeviceManufacturer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pszDevicePropertyName 
     * @param {Pointer<Byte>} pData 
     * @param {Pointer<UInt32>} pcbData 
     * @param {Pointer<UInt32>} pdwType 
     * @returns {HRESULT} 
     */
    GetDeviceProperty(pszPnPDeviceID, pszDevicePropertyName, pData, pcbData, pdwType) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pszDevicePropertyName := pszDevicePropertyName is String ? StrPtr(pszDevicePropertyName) : pszDevicePropertyName

        result := ComCall(8, this, "ptr", pszPnPDeviceID, "ptr", pszDevicePropertyName, "char*", pData, "uint*", pcbData, "uint*", pdwType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pPnPDeviceIDs 
     * @param {Pointer<UInt32>} pcPnPDeviceIDs 
     * @returns {HRESULT} 
     */
    GetPrivateDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        result := ComCall(9, this, "ptr", pPnPDeviceIDs, "uint*", pcPnPDeviceIDs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
