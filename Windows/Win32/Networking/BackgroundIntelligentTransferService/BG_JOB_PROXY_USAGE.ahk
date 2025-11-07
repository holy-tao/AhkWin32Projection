#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines constants that specify which proxy to use for file transfers. You can define different proxy settings for each job.
 * @see https://docs.microsoft.com/windows/win32/api//bits/ne-bits-bg_job_proxy_usage
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class BG_JOB_PROXY_USAGE{

    /**
     * Use the proxy and proxy bypass list settings defined by each user to transfer files. Settings are user-defined from Control Panel, Internet Options, Connections, Local Area Network (LAN) settings (or Dial-up settings, depending on the network connection).
     * @type {Integer (Int32)}
     */
    static BG_JOB_PROXY_USAGE_PRECONFIG => 0

    /**
     * Do not use a proxy to transfer files. Use this option when you transfer files within a LAN.
     * @type {Integer (Int32)}
     */
    static BG_JOB_PROXY_USAGE_NO_PROXY => 1

    /**
     * Use the application's proxy and proxy bypass list to transfer files. Use this option when you can't trust that the system settings are correct. Also use this option when you want to transfer files using a special account, such as LocalSystem, to which the system settings do not apply.
     * @type {Integer (Int32)}
     */
    static BG_JOB_PROXY_USAGE_OVERRIDE => 2

    /**
     * Automatically detect proxy settings. BITS detects proxy settings for each file in the job.
     * 
     * **BITS 1.5 and earlier:** **BG_JOB_PROXY_USAGE_AUTODETECT** is not available.
     * @type {Integer (Int32)}
     */
    static BG_JOB_PROXY_USAGE_AUTODETECT => 3
}
