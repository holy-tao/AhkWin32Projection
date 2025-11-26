#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellApp.ahk

/**
 * Exposes methods that represent applications to Add/Remove Programs in Control Panel.
 * @remarks
 * 
 * To publish applications to Add/Remove Programs in Control Panel, you must support <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-iapppublisher">IAppPublisher</a> and <b>IPublishedApp</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-ipublishedapp
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IPublishedApp extends IShellApp{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPublishedApp
     * @type {Guid}
     */
    static IID => Guid("{1bc752e0-9046-11d1-b8b3-006008059382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Install", "GetPublishedAppInfo", "Unschedule"]

    /**
     * Installs an application published by an application publisher. This method is invoked when the user selects Add or Add Later in Add/Remove Programs in Control Panel.
     * @param {Pointer<SYSTEMTIME>} pstInstall Type: <b>LPSYSTEMTIME</b>
     * 
     * A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that specifies the time the user elected to schedule installation through the <b>Add Later</b> button in <b>Add/Remove Programs</b>. This option is only available if the application supports scheduled installation (compare <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nf-shappmgr-ishellapp-getpossibleactions">GetPossibleActions</a>). If this parameter is <b>NULL</b>, the application should be installed immediately.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ipublishedapp-install
     */
    Install(pstInstall) {
        result := ComCall(8, this, "ptr", pstInstall, "HRESULT")
        return result
    }

    /**
     * Gets publishing-related information about an application published by an application publisher.
     * @param {Pointer<PUBAPPINFO>} ppai Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">PUBAPPINFO</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">PUBAPPINFO</a> structure that returns the application information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ipublishedapp-getpublishedappinfo
     */
    GetPublishedAppInfo(ppai) {
        result := ComCall(9, this, "ptr", ppai, "HRESULT")
        return result
    }

    /**
     * Cancels the installation of an application published by an application publisher.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nf-shappmgr-ipublishedapp-unschedule
     */
    Unschedule() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
