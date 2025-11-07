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
     * 
     * @param {Pointer<SYSTEMTIME>} pstInstall 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-install
     */
    Install(pstInstall) {
        result := ComCall(8, this, "ptr", pstInstall, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PUBAPPINFO>} ppai 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-getpublishedappinfo
     */
    GetPublishedAppInfo(ppai) {
        result := ComCall(9, this, "ptr", ppai, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ipublishedapp-unschedule
     */
    Unschedule() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
