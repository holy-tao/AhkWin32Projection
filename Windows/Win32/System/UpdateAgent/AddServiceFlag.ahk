#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the possible ways in which the IUpdateServiceManager2 interface can process service registration requests.
 * @remarks
 * 
 * For info about how  <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservicemanager2-addservice2">IUpdateServiceManager2::AddService2</a> behaves when you specify different combinations of <b>AddServiceFlag</b> values in the <i>flags</i> parameter, see the Remarks section of <b>IUpdateServiceManager2::AddService2</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/ne-wuapi-addserviceflag
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AddServiceFlag{

    /**
     * Allows the update agent to process the service registration at a later time, when it next performs an online scan for updates.
     * @type {Integer (Int32)}
     */
    static asfAllowPendingRegistration => 1

    /**
     * Allows the update agent to process the service registration immediately if network connectivity is available.
     * @type {Integer (Int32)}
     */
    static asfAllowOnlineRegistration => 2

    /**
     * Registers the service with Automatic Updates when the service is added.
     * @type {Integer (Int32)}
     */
    static asfRegisterServiceWithAU => 4
}
