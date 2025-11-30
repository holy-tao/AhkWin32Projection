#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KSPROPERTY_EXTENSION_UNIT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTENSION_UNIT_INFO => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTENSION_UNIT_CONTROL => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_EXTENSION_UNIT_PASS_THROUGH => 65535
}
