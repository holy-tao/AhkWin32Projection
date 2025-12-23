#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the options that affect how the service registration for a scan package service is removed.
 * @remarks
 * If you do not specify <b>usoNonVolatileService</b>, the service registration is automatically removed when you release the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservice">IUpdateService</a> interface.
 * 
 * The <b>UpdateServiceOption</b> enumeration  may require that you update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateserviceoption
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateServiceOption extends Win32Enum{

    /**
     * Indicates that you must call the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-removeservice">IUpdateServiceManager::RemoveService</a> method to remove the service registration. 
     * 
     * Failure to call the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-removeservice">RemoveService</a> method before releasing the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservice">IUpdateService</a> interface causes a resource leak.
     * @type {Integer (Int32)}
     */
    static usoNonVolatileService => 1
}
