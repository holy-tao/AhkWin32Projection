#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_PINCAPS_CHANGENOTIFICATIONS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_PINCAPS_FORMATCHANGE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_PINCAPS_JACKINFOCHANGE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_PINCAPS_INVALIDATECLIENTS => 2
}
