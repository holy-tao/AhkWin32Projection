#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class IBidiSpl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBidiSpl
     * @type {Guid}
     */
    static IID => Guid("{d580dc0e-de39-4649-baa8-bf0b85a03a97}")

    /**
     * The class identifier for BidiSpl
     * @type {Guid}
     */
    static CLSID => Guid("{2a614240-a4c5-4c33-bd87-1bc709331639}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindDevice", "UnbindDevice", "SendRecv", "MultiSendRecv"]

    /**
     * 
     * @param {PWSTR} pszDeviceName 
     * @param {Integer} dwAccess 
     * @returns {HRESULT} 
     */
    BindDevice(pszDeviceName, dwAccess) {
        pszDeviceName := pszDeviceName is String ? StrPtr(pszDeviceName) : pszDeviceName

        result := ComCall(3, this, "ptr", pszDeviceName, "uint", dwAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    UnbindDevice() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAction 
     * @param {IBidiRequest} pRequest 
     * @returns {HRESULT} 
     */
    SendRecv(pszAction, pRequest) {
        pszAction := pszAction is String ? StrPtr(pszAction) : pszAction

        result := ComCall(5, this, "ptr", pszAction, "ptr", pRequest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAction 
     * @param {IBidiRequestContainer} pRequestContainer 
     * @returns {HRESULT} 
     */
    MultiSendRecv(pszAction, pRequestContainer) {
        pszAction := pszAction is String ? StrPtr(pszAction) : pszAction

        result := ComCall(6, this, "ptr", pszAction, "ptr", pRequestContainer, "HRESULT")
        return result
    }
}
