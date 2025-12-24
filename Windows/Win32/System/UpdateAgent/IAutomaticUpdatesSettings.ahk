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
     * @type {Integer} 
     */
    NotificationLevel {
        get => this.get_NotificationLevel()
        set => this.put_NotificationLevel(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    ReadOnly {
        get => this.get_ReadOnly()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Required {
        get => this.get_Required()
    }

    /**
     * @type {Integer} 
     */
    ScheduledInstallationDay {
        get => this.get_ScheduledInstallationDay()
        set => this.put_ScheduledInstallationDay(value)
    }

    /**
     * @type {Integer} 
     */
    ScheduledInstallationTime {
        get => this.get_ScheduledInstallationTime()
        set => this.put_ScheduledInstallationTime(value)
    }

    /**
     * Gets and sets how users are notified about Automatic Update events.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel
     */
    get_NotificationLevel() {
        result := ComCall(7, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets how users are notified about Automatic Update events.
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-put_notificationlevel
     */
    put_NotificationLevel(value) {
        result := ComCall(8, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Gets a Boolean value that indicates whether the Automatic Update settings are read-only.
     * @remarks
     * 
     * <b>ReadOnly</b> is <b>VARIANT_TRUE</b> if either of the following conditions is true:
     * 
     * <ul>
     * <li>The caller has insufficient security permissions to modify the Automatic Updates settings.</li>
     * <li>The current settings are enforced by Group Policy.
     * </li>
     * </ul>
     *  
     * The caller can modify the settings in the  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a> interface only if <b>ReadOnly</b> is <b>VARIANT_FALSE</b>.
     * The value of <b>ReadOnly</b> may change after calling <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-refresh">Refresh</a>.
     * 
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-get_readonly
     */
    get_ReadOnly() {
        result := ComCall(9, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets a Boolean value that indicates whether Group Policy requires the Automatic Updates service.
     * @returns {VARIANT_BOOL} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-get_required
     */
    get_Required() {
        result := ComCall(10, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the days of the week on which Automatic Updates installs or uninstalls updates.
     * @remarks
     * 
     * The value of this property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">NotificationLevel</a> property is not <b>aunlScheduledInstallation</b>.
     * 
     * <div class="alert"><b>Note</b>  Starting with Windows 8 and Windows Server 2012, <b>ScheduledInstallationDay</b> is not supported and will return unreliable values. If you try to modify <b>ScheduledInstallationDay</b>, the operation will appear to succeed but will have no effect.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationday
     */
    get_ScheduledInstallationDay() {
        result := ComCall(11, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the days of the week on which Automatic Updates installs or uninstalls updates.
     * @remarks
     * 
     * The value of this property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">NotificationLevel</a> property is not <b>aunlScheduledInstallation</b>.
     * 
     * <div class="alert"><b>Note</b>  Starting with Windows 8 and Windows Server 2012, <b>ScheduledInstallationDay</b> is not supported and will return unreliable values. If you try to modify <b>ScheduledInstallationDay</b>, the operation will appear to succeed but will have no effect.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-put_scheduledinstallationday
     */
    put_ScheduledInstallationDay(value) {
        result := ComCall(12, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Gets and sets the time at which Automatic Updates installs or uninstalls updates.
     * @remarks
     * 
     * The time is set by using the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Time</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>00:00</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>01:00</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>02:00</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>03:00</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>04:00</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>05:00</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>06:00</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>07:00</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>08:00</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>09:00</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>10:00</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>11:00</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>12:00</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>13:00</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>14:00</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>15:00</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>16:00</td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>17:00</td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>18:00</td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>19:00</td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>20:00</td>
     * </tr>
     * <tr>
     * <td>21</td>
     * <td>21:00</td>
     * </tr>
     * <tr>
     * <td>22</td>
     * <td>22:00</td>
     * </tr>
     * <tr>
     * <td>23</td>
     * <td>23:00</td>
     * </tr>
     * </table>
     *  
     * 
     * The value of this property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">NotificationLevel</a> property is not <b>aunlScheduledInstallation</b>. 
     * 
     * <div class="alert"><b>Note</b>  Starting with Windows 8 and Windows Server 2012, <b>ScheduledInstallationTime</b> is not supported and will return unreliable values. If you try to modify <b>ScheduledInstallationTime</b>, the operation will appear to succeed but will have no effect.</div>
     * <div> </div>
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-get_scheduledinstallationtime
     */
    get_ScheduledInstallationTime() {
        result := ComCall(13, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * Gets and sets the time at which Automatic Updates installs or uninstalls updates.
     * @remarks
     * 
     * The time is set by using the following values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Time</th>
     * </tr>
     * <tr>
     * <td>0</td>
     * <td>00:00</td>
     * </tr>
     * <tr>
     * <td>1</td>
     * <td>01:00</td>
     * </tr>
     * <tr>
     * <td>2</td>
     * <td>02:00</td>
     * </tr>
     * <tr>
     * <td>3</td>
     * <td>03:00</td>
     * </tr>
     * <tr>
     * <td>4</td>
     * <td>04:00</td>
     * </tr>
     * <tr>
     * <td>5</td>
     * <td>05:00</td>
     * </tr>
     * <tr>
     * <td>6</td>
     * <td>06:00</td>
     * </tr>
     * <tr>
     * <td>7</td>
     * <td>07:00</td>
     * </tr>
     * <tr>
     * <td>8</td>
     * <td>08:00</td>
     * </tr>
     * <tr>
     * <td>9</td>
     * <td>09:00</td>
     * </tr>
     * <tr>
     * <td>10</td>
     * <td>10:00</td>
     * </tr>
     * <tr>
     * <td>11</td>
     * <td>11:00</td>
     * </tr>
     * <tr>
     * <td>12</td>
     * <td>12:00</td>
     * </tr>
     * <tr>
     * <td>13</td>
     * <td>13:00</td>
     * </tr>
     * <tr>
     * <td>14</td>
     * <td>14:00</td>
     * </tr>
     * <tr>
     * <td>15</td>
     * <td>15:00</td>
     * </tr>
     * <tr>
     * <td>16</td>
     * <td>16:00</td>
     * </tr>
     * <tr>
     * <td>17</td>
     * <td>17:00</td>
     * </tr>
     * <tr>
     * <td>18</td>
     * <td>18:00</td>
     * </tr>
     * <tr>
     * <td>19</td>
     * <td>19:00</td>
     * </tr>
     * <tr>
     * <td>20</td>
     * <td>20:00</td>
     * </tr>
     * <tr>
     * <td>21</td>
     * <td>21:00</td>
     * </tr>
     * <tr>
     * <td>22</td>
     * <td>22:00</td>
     * </tr>
     * <tr>
     * <td>23</td>
     * <td>23:00</td>
     * </tr>
     * </table>
     *  
     * 
     * The value of this property is ignored if the value of the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-get_notificationlevel">NotificationLevel</a> property is not <b>aunlScheduledInstallation</b>. 
     * 
     * <div class="alert"><b>Note</b>  Starting with Windows 8 and Windows Server 2012, <b>ScheduledInstallationTime</b> is not supported and will return unreliable values. If you try to modify <b>ScheduledInstallationTime</b>, the operation will appear to succeed but will have no effect.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-put_scheduledinstallationtime
     */
    put_ScheduledInstallationTime(value) {
        result := ComCall(14, this, "int", value, "HRESULT")
        return result
    }

    /**
     * Retrieves the latest Automatic Updates settings.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-refresh
     */
    Refresh() {
        result := ComCall(15, this, "HRESULT")
        return result
    }

    /**
     * Applies the current Automatic Updates settings.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful. Otherwise, returns a COM or Windows error code.
     * @see https://docs.microsoft.com/windows/win32/api//wuapi/nf-wuapi-iautomaticupdatessettings-save
     */
    Save() {
        result := ComCall(16, this, "HRESULT")
        return result
    }
}
