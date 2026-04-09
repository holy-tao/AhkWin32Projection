#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_SELECTOR extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SELECTOR_SOURCE_NODE_ID => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_SELECTOR_NUM_SOURCES => 1
}
