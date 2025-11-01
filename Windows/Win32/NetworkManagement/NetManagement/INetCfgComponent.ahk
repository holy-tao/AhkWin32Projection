#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<PWSTR>} ppszwDisplayName 
     * @returns {HRESULT} 
     */
    GetDisplayName(ppszwDisplayName) {
        result := ComCall(3, this, "ptr", ppszwDisplayName, "HRESULT")
        return result
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
     * @param {Pointer<PWSTR>} pszwHelpText 
     * @returns {HRESULT} 
     */
    GetHelpText(pszwHelpText) {
        result := ComCall(5, this, "ptr", pszwHelpText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwId 
     * @returns {HRESULT} 
     */
    GetId(ppszwId) {
        result := ComCall(6, this, "ptr", ppszwId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pdwCharacteristics) {
        pdwCharacteristicsMarshal := pdwCharacteristics is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, pdwCharacteristicsMarshal, pdwCharacteristics, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetInstanceGuid(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwDevNodeId 
     * @returns {HRESULT} 
     */
    GetPnpDevNodeId(ppszwDevNodeId) {
        result := ComCall(9, this, "ptr", ppszwDevNodeId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetClassGuid(pGuid) {
        result := ComCall(10, this, "ptr", pGuid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwBindName 
     * @returns {HRESULT} 
     */
    GetBindName(ppszwBindName) {
        result := ComCall(11, this, "ptr", ppszwBindName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStatus 
     * @returns {HRESULT} 
     */
    GetDeviceStatus(pulStatus) {
        pulStatusMarshal := pulStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, pulStatusMarshal, pulStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} phkey 
     * @returns {HRESULT} 
     */
    OpenParamKey(phkey) {
        result := ComCall(13, this, "ptr", phkey, "HRESULT")
        return result
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
