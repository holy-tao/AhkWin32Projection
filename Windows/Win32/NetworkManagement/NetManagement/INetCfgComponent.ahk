#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Registry\HKEY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponent extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponent
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae99-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDisplayName", "SetDisplayName", "GetHelpText", "GetId", "GetCharacteristics", "GetInstanceGuid", "GetPnpDevNodeId", "GetClassGuid", "GetBindName", "GetDeviceStatus", "OpenParamKey", "RaisePropertyUi"]

    /**
     * 
     * @returns {PWSTR} 
     */
    GetDisplayName() {
        result := ComCall(3, this, "ptr*", &ppszwDisplayName := 0, "HRESULT")
        return ppszwDisplayName
    }

    /**
     * 
     * @param {PWSTR} pszwDisplayName 
     * @returns {HRESULT} 
     */
    SetDisplayName(pszwDisplayName) {
        pszwDisplayName := pszwDisplayName is String ? StrPtr(pszwDisplayName) : pszwDisplayName

        result := ComCall(4, this, "ptr", pszwDisplayName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetHelpText() {
        result := ComCall(5, this, "ptr*", &pszwHelpText := 0, "HRESULT")
        return pszwHelpText
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetId() {
        result := ComCall(6, this, "ptr*", &ppszwId := 0, "HRESULT")
        return ppszwId
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetCharacteristics() {
        result := ComCall(7, this, "uint*", &pdwCharacteristics := 0, "HRESULT")
        return pdwCharacteristics
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetInstanceGuid() {
        pGuid := Guid()
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetPnpDevNodeId() {
        result := ComCall(9, this, "ptr*", &ppszwDevNodeId := 0, "HRESULT")
        return ppszwDevNodeId
    }

    /**
     * 
     * @returns {Guid} 
     */
    GetClassGuid() {
        pGuid := Guid()
        result := ComCall(10, this, "ptr", pGuid, "HRESULT")
        return pGuid
    }

    /**
     * 
     * @returns {PWSTR} 
     */
    GetBindName() {
        result := ComCall(11, this, "ptr*", &ppszwBindName := 0, "HRESULT")
        return ppszwBindName
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDeviceStatus() {
        result := ComCall(12, this, "uint*", &pulStatus := 0, "HRESULT")
        return pulStatus
    }

    /**
     * 
     * @returns {HKEY} 
     */
    OpenParamKey() {
        phkey := HKEY()
        result := ComCall(13, this, "ptr", phkey, "HRESULT")
        return phkey
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {IUnknown} punkContext 
     * @returns {HRESULT} 
     */
    RaisePropertyUi(hwndParent, dwFlags, punkContext) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(14, this, "ptr", hwndParent, "uint", dwFlags, "ptr", punkContext, "HRESULT")
        return result
    }
}
