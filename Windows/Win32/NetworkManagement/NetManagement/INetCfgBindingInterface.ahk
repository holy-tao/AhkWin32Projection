#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgBindingInterface extends IUnknown{
    /**
     * The interface identifier for INetCfgBindingInterface
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae94-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwInterfaceName 
     * @returns {HRESULT} 
     */
    GetName(ppszwInterfaceName) {
        result := ComCall(3, this, "ptr", ppszwInterfaceName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetCfgComponent>} ppnccItem 
     * @returns {HRESULT} 
     */
    GetUpperComponent(ppnccItem) {
        result := ComCall(4, this, "ptr", ppnccItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<INetCfgComponent>} ppnccItem 
     * @returns {HRESULT} 
     */
    GetLowerComponent(ppnccItem) {
        result := ComCall(5, this, "ptr", ppnccItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
