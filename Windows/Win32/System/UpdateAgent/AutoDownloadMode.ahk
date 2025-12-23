#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the types of logic that is used to determine whether Automatic Updates will automatically download an update once it is determined to be applicable for the computer.
 * @remarks
 * If Automatic Updates is disabled, or if Automatic Updates is enabled but set to “Check for updates but let me choose whether to download or install them,” updates will never be automatically downloaded, regardless of the value of an update’s <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdate5-get_autodownload">IUpdate5::AutoDownload</a> property. In earlier versions of the WUA in which <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nn-wuapi-iupdate5">IUpdate5</a> is not available, all updates are processed by using the standard logic.
 * @see https://learn.microsoft.com/windows/win32/api/wuapi/ne-wuapi-autodownloadmode
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class AutoDownloadMode extends Win32Enum{

    /**
     * Use the standard logic. The update will be automatically downloaded if it is important, or if it is recommended and Windows Update has been configured to treat recommended updates as important. Otherwise, the update will not be automatically downloaded.
     * @type {Integer (Int32)}
     */
    static adLetWindowsUpdateDecide => 0

    /**
     * The update will not be automatically downloaded; it will  be downloaded only when the user attempts to install the update, or when a Windows Update Agent (WUA) API caller requests that the update be downloaded by using the <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-download">IUpdateDownloader::Download</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wuapi/nf-wuapi-iupdatedownloader-begindownload">IUpdateDownloader::BeginDownload</a> methods.
     * @type {Integer (Int32)}
     */
    static adNeverAutoDownload => 1

    /**
     * The update will always be automatically downloaded.
     * @type {Integer (Int32)}
     */
    static adAlwaysAutoDownload => 2
}
