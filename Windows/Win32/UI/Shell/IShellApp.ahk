#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SLOWAPPINFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide general information about an application to the Add/Remove Programs Application.
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-ishellapp
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellApp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellApp
     * @type {Guid}
     */
    static IID => Guid("{a3e14960-935f-11d1-b8b8-006008059382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAppInfo", "GetPossibleActions", "GetSlowAppInfo", "GetCachedSlowAppInfo", "IsInstalled"]

    /**
     * 
     * @param {Pointer<APPINFODATA>} pai 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ishellapp-getappinfo
     */
    GetAppInfo(pai) {
        result := ComCall(3, this, "ptr", pai, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ishellapp-getpossibleactions
     */
    GetPossibleActions() {
        result := ComCall(4, this, "uint*", &pdwActions := 0, "HRESULT")
        return pdwActions
    }

    /**
     * 
     * @returns {SLOWAPPINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ishellapp-getslowappinfo
     */
    GetSlowAppInfo() {
        psaid := SLOWAPPINFO()
        result := ComCall(5, this, "ptr", psaid, "HRESULT")
        return psaid
    }

    /**
     * 
     * @returns {SLOWAPPINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ishellapp-getcachedslowappinfo
     */
    GetCachedSlowAppInfo() {
        psaid := SLOWAPPINFO()
        result := ComCall(6, this, "ptr", psaid, "HRESULT")
        return psaid
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ishellapp-isinstalled
     */
    IsInstalled() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
