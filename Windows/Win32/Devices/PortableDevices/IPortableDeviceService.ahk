#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to a service.
 * @see https://docs.microsoft.com/windows/win32/api//portabledeviceapi/nn-portabledeviceapi-iportabledeviceservice
 * @namespace Windows.Win32.Devices.PortableDevices
 * @version v4.0.30319
 */
class IPortableDeviceService extends IUnknown{
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
     * 
     * @param {PWSTR} pszPnPServiceID 
     * @param {Pointer<IPortableDeviceValues>} pClientInfo 
     * @returns {HRESULT} 
     */
    Open(pszPnPServiceID, pClientInfo) {
        pszPnPServiceID := pszPnPServiceID is String ? StrPtr(pszPnPServiceID) : pszPnPServiceID

        result := ComCall(3, this, "ptr", pszPnPServiceID, "ptr", pClientInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceServiceCapabilities>} ppCapabilities 
     * @returns {HRESULT} 
     */
    Capabilities(ppCapabilities) {
        result := ComCall(4, this, "ptr", ppCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceContent2>} ppContent 
     * @returns {HRESULT} 
     */
    Content(ppContent) {
        result := ComCall(5, this, "ptr", ppContent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IPortableDeviceServiceMethods>} ppMethods 
     * @returns {HRESULT} 
     */
    Methods(ppMethods) {
        result := ComCall(6, this, "ptr", ppMethods, "int")
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
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszServiceObjectID 
     * @returns {HRESULT} 
     */
    GetServiceObjectID(ppszServiceObjectID) {
        result := ComCall(9, this, "ptr", ppszServiceObjectID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszPnPServiceID 
     * @returns {HRESULT} 
     */
    GetPnPServiceID(ppszPnPServiceID) {
        result := ComCall(10, this, "ptr", ppszPnPServiceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPortableDeviceEventCallback>} pCallback 
     * @param {Pointer<IPortableDeviceValues>} pParameters 
     * @param {Pointer<PWSTR>} ppszCookie 
     * @returns {HRESULT} 
     */
    Advise(dwFlags, pCallback, pParameters, ppszCookie) {
        result := ComCall(11, this, "uint", dwFlags, "ptr", pCallback, "ptr", pParameters, "ptr", ppszCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszCookie 
     * @returns {HRESULT} 
     */
    Unadvise(pszCookie) {
        pszCookie := pszCookie is String ? StrPtr(pszCookie) : pszCookie

        result := ComCall(12, this, "ptr", pszCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IPortableDeviceValues>} pParameters 
     * @param {Pointer<IPortableDeviceValues>} ppResults 
     * @returns {HRESULT} 
     */
    SendCommand(dwFlags, pParameters, ppResults) {
        result := ComCall(13, this, "uint", dwFlags, "ptr", pParameters, "ptr", ppResults, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
