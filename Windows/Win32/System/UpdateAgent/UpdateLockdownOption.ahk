#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the functionality that the Windows Update Agent (WUA) object can access from Windows Update.
 * @remarks
 * 
 * In the following table, the first column lists the interfaces that  implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatelockdown">IUpdateLockdown</a> interface. The second column lists the methods and properties that are restricted by the WUA interfaces when a value is specified for <b>uloForWebsiteAccess</b>.
 * 
 * <table>
 * <tr>
 * <th>WUA object</th>
 * <th>Restricted methods and properties</th>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdates">IAutomaticUpdates</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdates-pause">Pause</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdates-resume">Resume</a>
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iautomaticupdatessettings">IAutomaticUpdatesSettings</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iautomaticupdatessettings-save">Save</a>
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate">IUpdate</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-accepteula">AcceptEula</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate-copyfromcache">CopyFromCache</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate2-copytocache">CopyToCache</a>
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatedownloader">IUpdateDownloader</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-download">Download</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-begindownload">BeginDownload</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-enddownload">EndDownload</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-get_isforced">IsForced</a> (cannot set)</dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateinstaller">IUpdateInstaller</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-begininstall">BeginInstall</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-beginuninstall">BeginUninstall</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-endinstall">EndInstall</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-enduninstall">EndUninstall</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-install">Install</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-get_isforced">IsForced</a> (cannot set)</dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-uninstall">Uninstall</a>
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservicemanager">IUpdateServiceManager</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-addscanpackageservice">AddScanPackageService</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-removeservice">RemoveService</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager-setoption">SetOption</a>
 * </dd>
 * </dl>
 * </td>
 * </tr>
 * <tr>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iwebproxy">IWebProxy</a>
 * </td>
 * <td>
 * <dl>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_address">Address</a> (cannot set)</dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_autodetect">AutoDetect</a> (cannot set)</dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypasslist">BypassList</a> (cannot set)</dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_bypassproxyonlocal">BypassProxyOnLocal</a> (cannot set)</dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-setpassword">SetPassword</a>
 * </dd>
 * <dd>
 * <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iwebproxy-get_username">UserName</a> (cannot set)</dd>
 * </dl>
 * </td>
 * </tr>
 * </table>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-updatelockdownoption
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateLockdownOption{

    /**
     * If access is from Windows Update, restrict access to the WUA interfaces that implement the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatelockdown">IUpdateLockdown</a> interface.
     * @type {Integer (Int32)}
     */
    static uloForWebsiteAccess => 1
}
