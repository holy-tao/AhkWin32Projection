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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevices", "RefreshDeviceList", "GetDeviceFriendlyName", "GetDeviceDescription", "GetDeviceManufacturer", "GetDeviceProperty", "GetPrivateDevices"]

    /**
     * 
     * @param {Pointer<PWSTR>} pPnPDeviceIDs 
     * @param {Pointer<Integer>} pcPnPDeviceIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevices
     */
    GetDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        pPnPDeviceIDsMarshal := pPnPDeviceIDs is VarRef ? "ptr*" : "ptr"
        pcPnPDeviceIDsMarshal := pcPnPDeviceIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pPnPDeviceIDsMarshal, pPnPDeviceIDs, pcPnPDeviceIDsMarshal, pcPnPDeviceIDs, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-refreshdevicelist
     */
    RefreshDeviceList() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceFriendlyName 
     * @param {Pointer<Integer>} pcchDeviceFriendlyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicefriendlyname
     */
    GetDeviceFriendlyName(pszPnPDeviceID, pDeviceFriendlyName, pcchDeviceFriendlyName) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceFriendlyName := pDeviceFriendlyName is String ? StrPtr(pDeviceFriendlyName) : pDeviceFriendlyName

        pcchDeviceFriendlyNameMarshal := pcchDeviceFriendlyName is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "ptr", pszPnPDeviceID, "ptr", pDeviceFriendlyName, pcchDeviceFriendlyNameMarshal, pcchDeviceFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceDescription 
     * @param {Pointer<Integer>} pcchDeviceDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicedescription
     */
    GetDeviceDescription(pszPnPDeviceID, pDeviceDescription, pcchDeviceDescription) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceDescription := pDeviceDescription is String ? StrPtr(pDeviceDescription) : pDeviceDescription

        pcchDeviceDescriptionMarshal := pcchDeviceDescription is VarRef ? "uint*" : "ptr"

        result := ComCall(6, this, "ptr", pszPnPDeviceID, "ptr", pDeviceDescription, pcchDeviceDescriptionMarshal, pcchDeviceDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pDeviceManufacturer 
     * @param {Pointer<Integer>} pcchDeviceManufacturer 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdevicemanufacturer
     */
    GetDeviceManufacturer(pszPnPDeviceID, pDeviceManufacturer, pcchDeviceManufacturer) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pDeviceManufacturer := pDeviceManufacturer is String ? StrPtr(pDeviceManufacturer) : pDeviceManufacturer

        pcchDeviceManufacturerMarshal := pcchDeviceManufacturer is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, "ptr", pszPnPDeviceID, "ptr", pDeviceManufacturer, pcchDeviceManufacturerMarshal, pcchDeviceManufacturer, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPnPDeviceID 
     * @param {PWSTR} pszDevicePropertyName 
     * @param {Pointer<Integer>} pData 
     * @param {Pointer<Integer>} pcbData 
     * @param {Pointer<Integer>} pdwType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getdeviceproperty
     */
    GetDeviceProperty(pszPnPDeviceID, pszDevicePropertyName, pData, pcbData, pdwType) {
        pszPnPDeviceID := pszPnPDeviceID is String ? StrPtr(pszPnPDeviceID) : pszPnPDeviceID
        pszDevicePropertyName := pszDevicePropertyName is String ? StrPtr(pszDevicePropertyName) : pszDevicePropertyName

        pDataMarshal := pData is VarRef ? "char*" : "ptr"
        pcbDataMarshal := pcbData is VarRef ? "uint*" : "ptr"
        pdwTypeMarshal := pdwType is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pszPnPDeviceID, "ptr", pszDevicePropertyName, pDataMarshal, pData, pcbDataMarshal, pcbData, pdwTypeMarshal, pdwType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pPnPDeviceIDs 
     * @param {Pointer<Integer>} pcPnPDeviceIDs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledevicemanager-getprivatedevices
     */
    GetPrivateDevices(pPnPDeviceIDs, pcPnPDeviceIDs) {
        pPnPDeviceIDsMarshal := pPnPDeviceIDs is VarRef ? "ptr*" : "ptr"
        pcPnPDeviceIDsMarshal := pcPnPDeviceIDs is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pPnPDeviceIDsMarshal, pPnPDeviceIDs, pcPnPDeviceIDsMarshal, pcPnPDeviceIDs, "HRESULT")
        return result
    }
}
