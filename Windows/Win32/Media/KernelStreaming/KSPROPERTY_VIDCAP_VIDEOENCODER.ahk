#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_VIDEOENCODER extends Win32Enum {

    /**
     * Native name: KSPROPERTY_VIDEOENCODER_CAPS
     * @type {Integer (Int32)}
     */
    static CAPS => 0

    /**
     * Native name: KSPROPERTY_VIDEOENCODER_STANDARD
     * @type {Integer (Int32)}
     */
    static STANDARD => 1

    /**
     * Native name: KSPROPERTY_VIDEOENCODER_COPYPROTECTION
     * @type {Integer (Int32)}
     */
    static COPYPROTECTION => 2

    /**
     * Native name: KSPROPERTY_VIDEOENCODER_CC_ENABLE
     * @type {Integer (Int32)}
     */
    static CC_ENABLE => 3
}
