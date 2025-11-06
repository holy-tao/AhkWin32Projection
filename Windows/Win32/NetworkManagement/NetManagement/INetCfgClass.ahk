#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INetCfgComponent.ahk
#Include .\IEnumNetCfgComponent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgClass extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgClass
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae97-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["FindComponent", "EnumComponents"]

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @returns {INetCfgComponent} 
     */
    FindComponent(pszwInfId) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId

        result := ComCall(3, this, "ptr", pszwInfId, "ptr*", &ppnccItem := 0, "HRESULT")
        return INetCfgComponent(ppnccItem)
    }

    /**
     * 
     * @returns {IEnumNetCfgComponent} 
     */
    EnumComponents() {
        result := ComCall(4, this, "ptr*", &ppenumComponent := 0, "HRESULT")
        return IEnumNetCfgComponent(ppenumComponent)
    }
}
