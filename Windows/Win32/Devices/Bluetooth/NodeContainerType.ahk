#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Devices.Bluetooth
 */
class NodeContainerType extends Win32Enum {

    /**
     * Native name: NodeContainerTypeSequence
     * @type {Integer (Int32)}
     */
    static Sequence => 0

    /**
     * Native name: NodeContainerTypeAlternative
     * @type {Integer (Int32)}
     */
    static Alternative => 1
}
