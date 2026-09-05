#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SYNCMGRLOGLEVEL enumeration values specify an error level for use in the ISyncMgrSynchronizeCallback::LogError method.
 * @see https://learn.microsoft.com/windows/win32/api/mobsync/ne-mobsync-syncmgrloglevel
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGRLOGLEVEL extends Win32Enum {

    /**
     * An information message was logged.
     * Native name: SYNCMGRLOGLEVEL_INFORMATION
     * @type {Integer (Int32)}
     */
    static INFORMATION => 1

    /**
     * A warning message was logged.
     * Native name: SYNCMGRLOGLEVEL_WARNING
     * @type {Integer (Int32)}
     */
    static WARNING => 2

    /**
     * An error message was logged.
     * Native name: SYNCMGRLOGLEVEL_ERROR
     * @type {Integer (Int32)}
     */
    static ERROR => 3

    /**
     * The largest valid <a href="https://docs.microsoft.com/windows/desktop/api/mobsync/ne-mobsync-syncmgrloglevel">SYNCMGRLOGLEVEL</a> value.
     * Native name: SYNCMGRLOGLEVEL_LOGLEVELMAX
     * @type {Integer (Int32)}
     */
    static LOGLEVELMAX => 3
}
