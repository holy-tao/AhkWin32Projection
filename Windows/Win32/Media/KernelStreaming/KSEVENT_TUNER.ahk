#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_TUNER extends Win32Enum {

    /**
     * Native name: KSEVENT_TUNER_CHANGED
     * @type {Integer (Int32)}
     */
    static CHANGED => 0

    /**
     * Native name: KSEVENT_TUNER_INITIATE_SCAN
     * @type {Integer (Int32)}
     */
    static INITIATE_SCAN => 1
}
