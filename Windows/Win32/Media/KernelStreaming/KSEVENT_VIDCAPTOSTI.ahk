#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSEVENT_VIDCAPTOSTI extends Win32Enum {

    /**
     * Native name: KSEVENT_VIDCAPTOSTI_EXT_TRIGGER
     * @type {Integer (Int32)}
     */
    static EXT_TRIGGER => 0

    /**
     * Native name: KSEVENT_VIDCAP_AUTO_UPDATE
     * @type {Integer (Int32)}
     */
    static VIDCAP_AUTO_UPDATE => 1

    /**
     * Native name: KSEVENT_VIDCAP_SEARCH
     * @type {Integer (Int32)}
     */
    static VIDCAP_SEARCH => 2
}
