#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_PINCAPS_CHANGENOTIFICATIONS extends Win32Enum {

    /**
     * Native name: KSEVENT_PINCAPS_FORMATCHANGE
     * @type {Integer (Int32)}
     */
    static FORMATCHANGE => 0

    /**
     * Native name: KSEVENT_PINCAPS_JACKINFOCHANGE
     * @type {Integer (Int32)}
     */
    static JACKINFOCHANGE => 1

    /**
     * Native name: KSEVENT_PINCAPS_INVALIDATECLIENTS
     * @type {Integer (Int32)}
     */
    static INVALIDATECLIENTS => 2
}
