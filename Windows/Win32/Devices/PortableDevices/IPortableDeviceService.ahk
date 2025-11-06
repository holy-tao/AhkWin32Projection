#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPortableDeviceServiceCapabilities.ahk
#Include .\IPortableDeviceContent2.ahk
#Include .\IPortableDeviceServiceMethods.ahk
#Include .\IPortableDeviceValues.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a service.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceService extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPortableDeviceService
     * @type {Guid}
     */
    static IID => Guid("{d3bd3a44-d7b5-40a9-98b7-2fa4d01dec08}")

    /**
     * The class identifier for PortableDeviceService
     * @type {Guid}
     */
    static CLSID => Guid("{ef5db4c2-9312-422c-9152-411cd9c4dd84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Capabilities", "Content", "Methods", "Cancel", "Close", "GetServiceObjectID", "GetPnPServiceID", "Advise", "Unadvise", "SendCommand"]

    /**
     * 
     * @param {PWSTR} pszPnPServiceID 
     * @param {IPortableDeviceValues} pClientInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-open
     */
    Open(pszPnPServiceID, pClientInfo) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IPortableDeviceServiceCapabilities} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-capabilities
     */
    Capabilities() {
        result := ComCall(4, this, "ptr*", &ppCapabilities := 0, "HRESULT")
        return IPortableDeviceServiceCapabilities(ppCapabilities)
    }

    /**
     * 
     * @returns {IPortableDeviceContent2} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-content
     */
    Content() {
        result := ComCall(5, this, "ptr*", &ppContent := 0, "HRESULT")
        return IPortableDeviceContent2(ppContent)
    }

    /**
     * 
     * @returns {IPortableDeviceServiceMethods} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-methods
     */
    Methods() {
        result := ComCall(6, this, "ptr*", &ppMethods := 0, "HRESULT")
        return IPortableDeviceServiceMethods(ppMethods)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-cancel
     */
    Cancel() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-close
     */
    Close() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getserviceobjectid
     */
    GetServiceObjectID() {
        result := ComCall(9, this, "ptr*", &ppszServiceObjectID := 0, "HRESULT")
        return ppszServiceObjectID
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-getpnpserviceid
     */
    GetPnPServiceID() {
        result := ComCall(10, this, "ptr*", &ppszPnPServiceID := 0, "HRESULT")
        return ppszPnPServiceID
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IPortableDeviceEventCallback} pCallback 
     * @param {IPortableDeviceValues} pParameters 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-advise
     */
    Advise(dwFlags, pCallback, pParameters) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, "ptr*", &ppszCookie := 0, "HRESULT")
        return ppszCookie
    }

    /**
     * 
     * @param {PWSTR} pszCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-unadvise
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(12, this, "ptr", pszCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {IPortableDeviceValues} pParameters 
     * @returns {IPortableDeviceValues} 
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservice-sendcommand
     */
    SendCommand(dwFlags, pParameters) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", pParameters, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }
}
