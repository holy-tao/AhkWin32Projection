#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_TUNER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_TUNER_CHANGED => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_TUNER_INITIATE_SCAN => 1
}
