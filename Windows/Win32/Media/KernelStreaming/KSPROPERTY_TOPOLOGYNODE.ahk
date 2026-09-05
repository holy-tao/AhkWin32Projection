#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_TOPOLOGYNODE extends Win32Enum {

    /**
     * Native name: KSPROPERTY_TOPOLOGYNODE_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1

    /**
     * Native name: KSPROPERTY_TOPOLOGYNODE_RESET
     * @type {Integer (Int32)}
     */
    static RESET => 2
}
