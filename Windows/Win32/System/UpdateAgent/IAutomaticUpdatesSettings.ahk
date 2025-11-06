#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains the settings that are available in Automatic Updates.
 * @remarks
 * 
  * <div class="alert"><b>Note</b>  Starting with Windows 8 and Windows Server 2012, <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationday">ScheduledInstallationDay</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationtime">ScheduledInstallationTime</a> are not supported and will return unreliable values. If you try to modify these properties, the operation will appear to succeed but will have no effect.</div>
  * <div> </div>
  * <div class="alert"><b>Note</b>  On Windows RT, you can no longer use the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-save">IAutomaticUpdatesSettings::Save</a> method to configure Windows Update settings programmatically. The configuration operation fails if you use <b>Save</b> to set any value other than 4 (<a href="https://docs.microsoft.com/windows/desktop/api/wuapi/ne-wuapi-automaticupdatesnotificationlevel">aunlScheduledInstallation</a>).</div>
  * <div> </div>
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdatessettings
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdatesSettings extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdatesSettings
     * @type {Guid}
     */
    static IID => Guid("{2ee48f22-af3c-405f-8970-f71be12ee9a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NotificationLevel", "put_NotificationLevel", "get_ReadOnly", "get_Required", "get_ScheduledInstallationDay", "put_ScheduledInstallationDay", "get_ScheduledInstallationTime", "put_ScheduledInstallationTime", "Refresh", "Save"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel
     */
    get_NotificationLevel() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-put_notificationlevel
     */
    put_NotificationLevel(value) {
        result := ComCall(8, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_required
     */
    get_Required() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationday
     */
    get_ScheduledInstallationDay() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-put_scheduledinstallationday
     */
    put_ScheduledInstallationDay(value) {
        result := ComCall(12, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationtime
     */
    get_ScheduledInstallationTime() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-put_scheduledinstallationtime
     */
    put_ScheduledInstallationTime(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-refresh
     */
    Refresh() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings-save
     */
    Save() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
