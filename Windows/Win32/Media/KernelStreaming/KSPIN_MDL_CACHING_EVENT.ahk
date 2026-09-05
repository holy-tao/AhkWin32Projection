#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPIN_MDL_CACHING_EVENT extends Win32Enum {

    /**
     * Native name: KSPIN_MDL_CACHING_NOTIFY_CLEANUP
     * @type {Integer (Int32)}
     */
    static NOTIFY_CLEANUP => 0

    /**
     * Native name: KSPIN_MDL_CACHING_NOTIFY_CLEANALL_WAIT
     * @type {Integer (Int32)}
     */
    static NOTIFY_CLEANALL_WAIT => 1

    /**
     * Native name: KSPIN_MDL_CACHING_NOTIFY_CLEANALL_NOWAIT
     * @type {Integer (Int32)}
     */
    static NOTIFY_CLEANALL_NOWAIT => 2

    /**
     * Native name: KSPIN_MDL_CACHING_NOTIFY_ADDSAMPLE
     * @type {Integer (Int32)}
     */
    static NOTIFY_ADDSAMPLE => 3
}
