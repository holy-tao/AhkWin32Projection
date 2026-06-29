#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SYNCMGRLOGLEVEL enumeration values specify an error level for use in the ISyncMgrSynchronizeCallback::LogError method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrloglevel
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SYNCMGRLOGLEVEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * An information message was logged.
     * @type {Integer (Int32)}
     */
    static SYNCMGRLOGLEVEL_INFORMATION => 1

    /**
     * A warning message was logged.
     * @type {Integer (Int32)}
     */
    static SYNCMGRLOGLEVEL_WARNING => 2

    /**
     * An error message was logged.
     * @type {Integer (Int32)}
     */
    static SYNCMGRLOGLEVEL_ERROR => 3

    /**
     * The largest valid <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrloglevel">SYNCMGRLOGLEVEL</a> value.
     * @type {Integer (Int32)}
     */
    static SYNCMGRLOGLEVEL_LOGLEVELMAX => 3
}
