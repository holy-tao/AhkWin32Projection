#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IPublishedApp.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that enumerate published applications to Add/Remove Programs in the Control Panel. The object exposing this interface is requested through IAppPublisher::EnumApps.
 * @remarks
 * 
  * To publish applications to Add/Remove Programs in the Control Panel, you must support <b>IEnumPublishedApps</b>, <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-iapppublisher">IAppPublisher</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shappmgr/nn-shappmgr-ipublishedapp">IPublishedApp</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shappmgr/nn-shappmgr-ienumpublishedapps
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IEnumPublishedApps extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumPublishedApps
     * @type {Guid}
     */
    static IID => Guid("{0b124f8c-91f0-11d1-b8b5-006008059382}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Next", "Reset"]

    /**
     * 
     * @returns {IPublishedApp} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ienumpublishedapps-next
     */
    Next() {
        result := ComCall(3, this, "ptr*", &pia := 0, "HRESULT")
        return IPublishedApp(pia)
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shappmgr/nf-shappmgr-ienumpublishedapps-reset
     */
    Reset() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
