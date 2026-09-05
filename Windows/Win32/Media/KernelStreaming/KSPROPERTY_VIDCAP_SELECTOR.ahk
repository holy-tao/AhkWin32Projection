#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_VIDCAP_SELECTOR extends Win32Enum {

    /**
     * Native name: KSPROPERTY_SELECTOR_SOURCE_NODE_ID
     * @type {Integer (Int32)}
     */
    static SOURCE_NODE_ID => 0

    /**
     * Native name: KSPROPERTY_SELECTOR_NUM_SOURCES
     * @type {Integer (Int32)}
     */
    static NUM_SOURCES => 1
}
