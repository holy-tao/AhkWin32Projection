#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_CLOCK_POSITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CLOCK_INTERVAL_MARK => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_CLOCK_POSITION_MARK => 1
}
