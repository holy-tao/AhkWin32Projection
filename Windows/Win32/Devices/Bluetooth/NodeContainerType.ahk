#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 * @version v4.0.30319
 */
class NodeContainerType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NodeContainerTypeSequence => 0

    /**
     * @type {Integer (Int32)}
     */
    static NodeContainerTypeAlternative => 1
}
