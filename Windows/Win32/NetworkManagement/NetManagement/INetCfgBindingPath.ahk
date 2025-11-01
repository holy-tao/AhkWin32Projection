#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgBindingPath extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgBindingPath
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae96-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsSamePathAs", "IsSubPathOf", "IsEnabled", "Enable", "GetPathToken", "GetOwner", "GetDepth", "EnumBindingInterfaces"]

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSamePathAs(pPath) {
        result := ComCall(3, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pPath 
     * @returns {HRESULT} 
     */
    IsSubPathOf(pPath) {
        result := ComCall(4, this, "ptr", pPath, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsEnabled() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnable 
     * @returns {HRESULT} 
     */
    Enable(fEnable) {
        result := ComCall(6, this, "int", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszwPathToken 
     * @returns {HRESULT} 
     */
    GetPathToken(ppszwPathToken) {
        result := ComCall(7, this, "ptr", ppszwPathToken, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<INetCfgComponent>} ppComponent 
     * @returns {HRESULT} 
     */
    GetOwner(ppComponent) {
        result := ComCall(8, this, "ptr*", ppComponent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcInterfaces 
     * @returns {HRESULT} 
     */
    GetDepth(pcInterfaces) {
        pcInterfacesMarshal := pcInterfaces is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, pcInterfacesMarshal, pcInterfaces, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEnumNetCfgBindingInterface>} ppenumInterface 
     * @returns {HRESULT} 
     */
    EnumBindingInterfaces(ppenumInterface) {
        result := ComCall(10, this, "ptr*", ppenumInterface, "HRESULT")
        return result
    }
}
