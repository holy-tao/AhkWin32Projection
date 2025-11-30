#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the update services that Windows Update can operate against.
 * @see https://docs.microsoft.com/windows/win32/api//wuapicommon/ne-wuapicommon-serverselection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ServerSelection extends Win32Enum{

    /**
     * Used only by <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdatesearcher">IUpdateSearcher</a>. Indicates that the search call should search the default server.
     * 
     * The default server used by the Windows Update Agent (WUA) is the same as <b>ssMangagedServer</b> if the computer is set up to have a managed server. If the computer is not been set up to have a managed server, WUA uses the first update service for which the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservice-get_isregisteredwithau">IsRegisteredWithAU</a> property of <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateservice">IUpdateService</a> is VARIANT_TRUE and the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdateservice-get_ismanaged">IsManaged</a> property of <b>IUpdateService</b> is VARIANT_FALSE
     * @type {Integer (Int32)}
     */
    static ssDefault => 0

    /**
     * Indicates the managed server, in an environment that uses Windows Server Update Services or a similar corporate update server to manage the computer.
     * @type {Integer (Int32)}
     */
    static ssManagedServer => 1

    /**
     * Indicates the Windows Update service.
     * @type {Integer (Int32)}
     */
    static ssWindowsUpdate => 2

    /**
     * Indicates some update service other than those listed previously. If the <b>ServerSelection</b> property of a Windows Update Agent API object is set to <b>ssOthers</b>, then the <b>ServiceID</b> property of the object contains the ID of the service.
     * @type {Integer (Int32)}
     */
    static ssOthers => 3
}
