#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IRouterProtocolConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRouterProtocolConfig
     * @type {Guid}
     */
    static IID => Guid("{66a2db16-d706-11d0-a37b-00c04fc9da04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddProtocol", "RemoveProtocol"]

    /**
     * 
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwTransportId 
     * @param {Integer} dwProtocolId 
     * @param {HWND} hWnd 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pRouter 
     * @param {Pointer} uReserved1 
     * @returns {HRESULT} 
     */
    AddProtocol(pszMachineName, dwTransportId, dwProtocolId, hWnd, dwFlags, pRouter, uReserved1) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(3, this, "ptr", pszMachineName, "uint", dwTransportId, "uint", dwProtocolId, "ptr", hWnd, "uint", dwFlags, "ptr", pRouter, "ptr", uReserved1, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszMachineName 
     * @param {Integer} dwTransportId 
     * @param {Integer} dwProtocolId 
     * @param {HWND} hWnd 
     * @param {Integer} dwFlags 
     * @param {IUnknown} pRouter 
     * @param {Pointer} uReserved1 
     * @returns {HRESULT} 
     */
    RemoveProtocol(pszMachineName, dwTransportId, dwProtocolId, hWnd, dwFlags, pRouter, uReserved1) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName
        hWnd := hWnd is Win32Handle ? NumGet(hWnd, "ptr") : hWnd

        result := ComCall(4, this, "ptr", pszMachineName, "uint", dwTransportId, "uint", dwProtocolId, "ptr", hWnd, "uint", dwFlags, "ptr", pRouter, "ptr", uReserved1, "HRESULT")
        return result
    }
}
