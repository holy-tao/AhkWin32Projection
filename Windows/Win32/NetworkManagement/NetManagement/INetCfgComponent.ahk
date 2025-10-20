#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponent extends IUnknown{
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
     * 
     * @param {Pointer<PWSTR>} ppszwDisplayName 
     * @returns {HRESULT} 
     */
    GetDisplayName(ppszwDisplayName) {
        result := ComCall(3, this, "ptr", ppszwDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszwDisplayName 
     * @returns {HRESULT} 
     */
    SetDisplayName(pszwDisplayName) {
        pszwDisplayName := pszwDisplayName is String ? StrPtr(pszwDisplayName) : pszwDisplayName

        result := ComCall(4, this, "ptr", pszwDisplayName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszwHelpText 
     * @returns {HRESULT} 
     */
    GetHelpText(pszwHelpText) {
        result := ComCall(5, this, "ptr", pszwHelpText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwId 
     * @returns {HRESULT} 
     */
    GetId(ppszwId) {
        result := ComCall(6, this, "ptr", ppszwId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwCharacteristics 
     * @returns {HRESULT} 
     */
    GetCharacteristics(pdwCharacteristics) {
        result := ComCall(7, this, "uint*", pdwCharacteristics, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetInstanceGuid(pGuid) {
        result := ComCall(8, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwDevNodeId 
     * @returns {HRESULT} 
     */
    GetPnpDevNodeId(ppszwDevNodeId) {
        result := ComCall(9, this, "ptr", ppszwDevNodeId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pGuid 
     * @returns {HRESULT} 
     */
    GetClassGuid(pGuid) {
        result := ComCall(10, this, "ptr", pGuid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwBindName 
     * @returns {HRESULT} 
     */
    GetBindName(ppszwBindName) {
        result := ComCall(11, this, "ptr", ppszwBindName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStatus 
     * @returns {HRESULT} 
     */
    GetDeviceStatus(pulStatus) {
        result := ComCall(12, this, "uint*", pulStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<HKEY>} phkey 
     * @returns {HRESULT} 
     */
    OpenParamKey(phkey) {
        result := ComCall(13, this, "ptr", phkey, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} dwFlags 
     * @param {Pointer<IUnknown>} punkContext 
     * @returns {HRESULT} 
     */
    RaisePropertyUi(hwndParent, dwFlags, punkContext) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent

        result := ComCall(14, this, "ptr", hwndParent, "uint", dwFlags, "ptr", punkContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
