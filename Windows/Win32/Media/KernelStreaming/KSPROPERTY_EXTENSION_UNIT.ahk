#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KSPROPERTY_EXTENSION_UNIT extends Win32Enum {

    /**
     * Native name: KSPROPERTY_EXTENSION_UNIT_INFO
     * @type {Integer (Int32)}
     */
    static INFO => 0

    /**
     * Native name: KSPROPERTY_EXTENSION_UNIT_CONTROL
     * @type {Integer (Int32)}
     */
    static CONTROL => 1

    /**
     * Native name: KSPROPERTY_EXTENSION_UNIT_PASS_THROUGH
     * @type {Integer (Int32)}
     */
    static PASS_THROUGH => 65535
}
