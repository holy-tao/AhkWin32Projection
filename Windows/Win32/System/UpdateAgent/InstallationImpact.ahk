#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the possible levels of impact that can be caused by installing or uninstalling an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-installationimpact
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class InstallationImpact extends Win32Enum{

    /**
     * Installing or uninstalling an update results in a level of impact on the target computer that is typical of most updates. Therefore, the update does not qualify for any of the special impact ratings that are defined in this topic.
     * @type {Integer (Int32)}
     */
    static iiNormal => 0

    /**
     * Installing or uninstalling an update results in an insignificant impact on the target computer.
     * 
     * The update must meet strict requirements to qualify for this rating. The requirements include, but are not limited to, the following requirements:
     * 
     * <ul>
     * <li>It must not perform or require a system restart.</li>
     * <li>It must not display a user interface.</li>
     * <li>The installation or uninstallation must succeed even if it affects an application or service that is currently being used.</li>
     * </ul>
     *  Updates that qualify for this rating may be eligible for special handling in Windows Update Agent (WUA). For example, they may be eligible for accelerated distribution.
     * @type {Integer (Int32)}
     */
    static iiMinor => 1

    /**
     * This update cannot be installed in the same <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-install">IUpdateInstaller::Install</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateinstaller-begininstall">IUpdateInstaller::BeginInstall</a> call as any other update.  If you make an <b>IUpdateInstaller::Install</b> or <b>IUpdateInstaller::BeginInstall</b> call that includes an exclusive update along with one or more other updates, the call will return <b>WU_E_EXCLUSIVE_INSTALL_CONFLICT</b>, and no updates will be installed.
     * @type {Integer (Int32)}
     */
    static iiRequiresExclusiveHandling => 2
}
