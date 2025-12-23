#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPIN_MDL_CACHING_EVENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_CLEANUP => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_CLEANALL_WAIT => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_CLEANALL_NOWAIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPIN_MDL_CACHING_NOTIFY_ADDSAMPLE => 3
}
