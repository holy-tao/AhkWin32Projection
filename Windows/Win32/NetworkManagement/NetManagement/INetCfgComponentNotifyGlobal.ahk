#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentNotifyGlobal extends IUnknown{
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
     * 
     * @param {Pointer<UInt32>} dwNotifications 
     * @returns {HRESULT} 
     */
    GetSupportedNotifications(dwNotifications) {
        result := ComCall(3, this, "uint*", dwNotifications, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {Pointer<INetCfgBindingPath>} pIPath 
     * @returns {HRESULT} 
     */
    SysQueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {Pointer<INetCfgBindingPath>} pIPath 
     * @returns {HRESULT} 
     */
    SysNotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(5, this, "uint", dwChangeFlag, "ptr", pIPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {Pointer<INetCfgComponent>} pIComp 
     * @returns {HRESULT} 
     */
    SysNotifyComponent(dwChangeFlag, pIComp) {
        result := ComCall(6, this, "uint", dwChangeFlag, "ptr", pIComp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
