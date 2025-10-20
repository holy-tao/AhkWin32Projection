#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that provide general information about an application to the Add/Remove Programs Application.
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-ishellapp
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellApp extends IUnknown{
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
     * 
     * @param {Pointer<APPINFODATA>} pai 
     * @returns {HRESULT} 
     */
    GetAppInfo(pai) {
        result := ComCall(3, this, "ptr", pai, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwActions 
     * @returns {HRESULT} 
     */
    GetPossibleActions(pdwActions) {
        result := ComCall(4, this, "uint*", pdwActions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SLOWAPPINFO>} psaid 
     * @returns {HRESULT} 
     */
    GetSlowAppInfo(psaid) {
        result := ComCall(5, this, "ptr", psaid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SLOWAPPINFO>} psaid 
     * @returns {HRESULT} 
     */
    GetCachedSlowAppInfo(psaid) {
        result := ComCall(6, this, "ptr", psaid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    IsInstalled() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
