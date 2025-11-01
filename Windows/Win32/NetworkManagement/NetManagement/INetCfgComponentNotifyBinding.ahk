#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentNotifyBinding extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["QueryBindingPath", "NotifyBindingPath"]

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    QueryBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(3, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwChangeFlag 
     * @param {INetCfgBindingPath} pIPath 
     * @returns {HRESULT} 
     */
    NotifyBindingPath(dwChangeFlag, pIPath) {
        result := ComCall(4, this, "uint", dwChangeFlag, "ptr", pIPath, "HRESULT")
        return result
    }
}
