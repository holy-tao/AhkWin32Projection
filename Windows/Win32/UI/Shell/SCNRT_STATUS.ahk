#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether to enable or disable Async Register and Deregister for SHChangeNotifyRegisterThread.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-scnrt_status
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SCNRT_STATUS{

    /**
     * Enable Async Register and Deregister for <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-shchangenotifyregisterthread">SHChangeNotifyRegisterThread</a>.
     * @type {Integer (Int32)}
     */
    static SCNRT_ENABLE => 0

    /**
     * Disable Async Register and Deregister for <a href="https://docs.microsoft.com/windows/desktop/api/shlobj/nf-shlobj-shchangenotifyregisterthread">SHChangeNotifyRegisterThread</a>.
     * @type {Integer (Int32)}
     */
    static SCNRT_DISABLE => 1
}
