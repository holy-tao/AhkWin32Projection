#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISPLAYCONFIG_TOPOLOGY_ID enumeration specifies the type of display topology.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ne-wingdi-displayconfig_topology_id
 * @namespace Windows.Win32.Devices.Display
 */
export default struct DISPLAYCONFIG_TOPOLOGY_ID {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
