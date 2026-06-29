#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether to enable or disable Async Register and Deregister for SHChangeNotifyRegisterThread.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ne-shlobj_core-scnrt_status
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SCNRT_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
