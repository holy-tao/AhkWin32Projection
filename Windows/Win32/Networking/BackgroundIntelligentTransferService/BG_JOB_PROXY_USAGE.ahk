#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines constants that specify which proxy to use for file transfers. You can define different proxy settings for each job.
 * @see https://learn.microsoft.com/windows/win32/api/bits/ne-bits-bg_job_proxy_usage
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 */
export default struct BG_JOB_PROXY_USAGE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
