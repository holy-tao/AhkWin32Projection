#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfgComponentBindings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfgComponentBindings
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae9e-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["BindTo", "UnbindFrom", "SupportsBindingInterface", "IsBoundTo", "IsBindableTo", "EnumBindingPaths", "MoveBefore", "MoveAfter"]

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    BindTo(pnccItem) {
        result := ComCall(3, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    UnbindFrom(pnccItem) {
        result := ComCall(4, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszwInterfaceName 
     * @returns {HRESULT} 
     */
    SupportsBindingInterface(dwFlags, pszwInterfaceName) {
        pszwInterfaceName := pszwInterfaceName is String ? StrPtr(pszwInterfaceName) : pszwInterfaceName

        result := ComCall(5, this, "uint", dwFlags, "ptr", pszwInterfaceName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    IsBoundTo(pnccItem) {
        result := ComCall(6, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgComponent} pnccItem 
     * @returns {HRESULT} 
     */
    IsBindableTo(pnccItem) {
        result := ComCall(7, this, "ptr", pnccItem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Pointer<IEnumNetCfgBindingPath>} ppIEnum 
     * @returns {HRESULT} 
     */
    EnumBindingPaths(dwFlags, ppIEnum) {
        result := ComCall(8, this, "uint", dwFlags, "ptr*", ppIEnum, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pncbItemSrc 
     * @param {INetCfgBindingPath} pncbItemDest 
     * @returns {HRESULT} 
     */
    MoveBefore(pncbItemSrc, pncbItemDest) {
        result := ComCall(9, this, "ptr", pncbItemSrc, "ptr", pncbItemDest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {INetCfgBindingPath} pncbItemSrc 
     * @param {INetCfgBindingPath} pncbItemDest 
     * @returns {HRESULT} 
     */
    MoveAfter(pncbItemSrc, pncbItemDest) {
        result := ComCall(10, this, "ptr", pncbItemSrc, "ptr", pncbItemDest, "HRESULT")
        return result
    }
}
