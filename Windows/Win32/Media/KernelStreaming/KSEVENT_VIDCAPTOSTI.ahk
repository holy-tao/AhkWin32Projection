#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSEVENT_VIDCAPTOSTI extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_VIDCAPTOSTI_EXT_TRIGGER => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_VIDCAP_AUTO_UPDATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSEVENT_VIDCAP_SEARCH => 2
}
