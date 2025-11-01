#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentNotifyGlobal extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentNotifyGlobal
     * @type {Guid}
     */
    static IID => Guid("{932238e2-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSupportedNotifications", "SysQueryBindingPath", "SysNotifyBindingPath", "SysNotifyComponent"]

    /**
     * 
     * @param {Pointer<Integer>} dwNotifications 
     * @returns {HRESULT} 
     */
    GetSupportedNotifications(dwNotifications) {
        dwNotificationsMarshal := dwNotifications is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, dwNotificationsMarshal, dwNotifications, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    SysQueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    SysNotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(5, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgComponent} pIComp 
     * @returns {HRESULT} 
     */
    SysNotifyComponent(dwChangeFlag, pIComp) {
        result := ComCall(6, this, "uint", dwChangeFlag, "ptr", pIComp, "HRESULT")
        return result
    }
}
