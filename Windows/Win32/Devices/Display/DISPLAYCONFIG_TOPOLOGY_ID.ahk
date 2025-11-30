#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DISPLAYCONFIG_TOPOLOGY_ID enumeration specifies the type of display topology.
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ne-wingdi-displayconfig_topology_id
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class DISPLAYCONFIG_TOPOLOGY_ID extends Win32Enum{

    /**
     * Indicates that the display topology is an internal configuration.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_TOPOLOGY_INTERNAL => 1

    /**
     * Indicates that the display topology is clone-view configuration.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_TOPOLOGY_CLONE => 2

    /**
     * Indicates that the display topology is an extended configuration.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_TOPOLOGY_EXTEND => 4

    /**
     * Indicates that the display topology is an external configuration.
     * @type {Integer (Int32)}
     */
    static DISPLAYCONFIG_TOPOLOGY_EXTERNAL => 8
}
