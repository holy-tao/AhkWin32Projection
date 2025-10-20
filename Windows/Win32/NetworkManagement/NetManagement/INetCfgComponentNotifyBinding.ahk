#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentNotifyBinding extends IUnknown{
    /**
     * The interface identifier for INetCfgComponentNotifyBinding
     * @type {Guid}
     */
    static IID => Guid("{932238e1-bea1-11d0-9298-00c04fc99dcf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {Pointer<INetCfgBindingPath>} pIPath 
     * @returns {HRESULT} 
     */
    QueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(3, this, "uint", dwChangeFlag, "ptr", pIPath, "int")
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
    NotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
