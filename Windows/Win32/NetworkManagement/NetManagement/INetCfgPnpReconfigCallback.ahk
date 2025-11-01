#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgPnpReconfigCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgPnpReconfigCallback
     * @type {Guid}
     */
    static IID => Guid("{8d84bd35-e227-11d2-b700-00a0c98a6a85}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendPnpReconfig"]

    /**
     * 
     * @param {Integer} Layer 
     * @param {PWSTR} pszwUpper 
     * @param {PWSTR} pszwLower 
     * @param {Pointer} pvData 
     * @param {Integer} dwSizeOfData 
     * @returns {HRESULT} 
     */
    SendPnpReconfig(Layer, pszwUpper, pszwLower, pvData, dwSizeOfData) {
        pszwUpper := pszwUpper is String ? StrPtr(pszwUpper) : pszwUpper
        pszwLower := pszwLower is String ? StrPtr(pszwLower) : pszwLower

        result := ComCall(3, this, "int", Layer, "ptr", pszwUpper, "ptr", pszwLower, "ptr", pvData, "uint", dwSizeOfData, "HRESULT")
        return result
    }
}
