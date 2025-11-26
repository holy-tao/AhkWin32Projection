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
     * Gets general information about an application.
     * @param {Pointer<APPINFODATA>} pai Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-appinfodata">APPINFODATA</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-appinfodata">APPINFODATA</a> structure that returns the application information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ishellapp-getappinfo
     */
    GetAppInfo(pai) {
        result := ComCall(3, this, "ptr", pai, "HRESULT")
        return result
    }

    /**
     * Gets a bitmask of management actions allowed for an application.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * A pointer to a variable of type <b>DWORD</b> that returns the bitmask of supported actions. The bit flags are described in <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ne-shappmgr-appactionflags">APPACTIONFLAGS</a>.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ishellapp-getpossibleactions
     */
    GetPossibleActions() {
        result := ComCall(4, this, "uint*", &pdwActions := 0, "HRESULT")
        return pdwActions
    }

    /**
     * Returns information to the application that originates from a slow source. This method is not applicable to published applications.
     * @returns {SLOWAPPINFO} Type: <b>PSLOWAPPINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-slowappinfo">SLOWAPPINFO</a> structure in which to return application information.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ishellapp-getslowappinfo
     */
    GetSlowAppInfo() {
        psaid := SLOWAPPINFO()
        result := ComCall(5, this, "ptr", psaid, "HRESULT")
        return psaid
    }

    /**
     * Returns information to the application that originates from a slow source. Unlike IShellApp::GetSlowAppInfo, this method can return information that has been cached. This method is not applicable to published applications.
     * @returns {SLOWAPPINFO} Type: <b>PSLOWAPPINFO</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-slowappinfo">SLOWAPPINFO</a> structure in which to return application information.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ishellapp-getcachedslowappinfo
     */
    GetCachedSlowAppInfo() {
        psaid := SLOWAPPINFO()
        result := ComCall(6, this, "ptr", psaid, "HRESULT")
        return psaid
    }

    /**
     * Gets a value indicating whether a specified application is currently installed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is installed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The application is not installed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ishellapp-isinstalled
     */
    IsInstalled() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
