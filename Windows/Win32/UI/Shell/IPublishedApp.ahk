#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IShellApp.ahk

/**
 * Exposes methods that represent applications to Add/Remove Programs in Control Panel.
 * @remarks
 * To publish applications to Add/Remove Programs in Control Panel, you must support <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ienumpublishedapps">IEnumPublishedApps</a>, <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-iapppublisher">IAppPublisher</a> and <b>IPublishedApp</b>.
 * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nn-shappmgr-ipublishedapp
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-install
     */
    Install(pstInstall) {
        result := ComCall(8, this, "ptr", pstInstall, "HRESULT")
        return result
    }

    /**
     * Gets publishing-related information about an application published by an application publisher.
     * @remarks
     * The dwMask member of the <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">PUBAPPINFO</a> structure indicates which members have been requested. Note that Add/Remove Programs will not set the PAI_SCHEDULEDTIME and PAI_EXPIREDTIME bits.  However, the corresponding values stScheduled and stExpired will be used when applicable if the implementation provides them.  A publisher should provide this data if it is available.
     * @param {Pointer<PUBAPPINFO>} ppai Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">PUBAPPINFO</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/ns-shappmgr-pubappinfo">PUBAPPINFO</a> structure that returns the application information.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-getpublishedappinfo
     */
    GetPublishedAppInfo(ppai) {
        result := ComCall(9, this, "ptr", ppai, "HRESULT")
        return result
    }

    /**
     * Cancels the installation of an application published by an application publisher.
     * @remarks
     * This method is called in each of the following circumstances. 
     * 				
     * 
     * <ol>
     * <li>The user selected the <b>Do Not Add Program</b> option in the <b>Add Later</b> dialog box in <b>Add/Remove Programs</b> in Control Panel.</li>
     * <li>The user has selected an installation time later than either the expiration time or the assigned time as specified in the published application information. In these circumstances, implementations are expected to cancel any scheduled installation for the application.</li>
     * </ol>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-unschedule
     */
    Unschedule() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
