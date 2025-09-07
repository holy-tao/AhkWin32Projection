#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class THREAD_ERROR_MODE{

    /**
     * @type {Integer (UInt32)}
     */
    static SEM_ALL_ERRORS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SEM_FAILCRITICALERRORS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SEM_NOGPFAULTERRORBOX => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SEM_NOOPENFILEERRORBOX => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SEM_NOALIGNMENTFAULTEXCEPT => 4
}
