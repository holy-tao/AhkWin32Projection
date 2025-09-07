#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the context in which an IUpdateException object can be provided.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-updateexceptioncontext
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class UpdateExceptionContext{

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateexception">IUpdateException</a> is not tied to any context.
     * @type {Integer (Int32)}
     */
    static uecGeneral => 1

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateexception">IUpdateException</a> is related to one or more Windows drivers.
     * @type {Integer (Int32)}
     */
    static uecWindowsDriver => 2

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdateexception">IUpdateException</a> is related to Windows Installer.
     * @type {Integer (Int32)}
     */
    static uecWindowsInstaller => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static uecSearchIncomplete => 4
}
