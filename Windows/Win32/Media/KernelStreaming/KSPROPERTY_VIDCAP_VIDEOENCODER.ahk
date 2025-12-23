#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_VIDCAP_VIDEOENCODER extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_CAPS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_STANDARD => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_COPYPROTECTION => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_VIDEOENCODER_CC_ENABLE => 3
}
