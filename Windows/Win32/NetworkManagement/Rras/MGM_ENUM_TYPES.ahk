#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MGM_ENUM_TYPES enumeration lists the types of group enumerations that the multicast group manager uses. This structure is used by the MgmGroupEnumerationStart function.
 * @see https://learn.microsoft.com/windows/win32/api/mgm/ne-mgm-mgm_enum_types
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct MGM_ENUM_TYPES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Enumerate group entries that have at least one source.
     * @type {Integer (Int32)}
     */
    static ANY_SOURCE => 0

    /**
     * Enumerate all source entries for a group.
     * @type {Integer (Int32)}
     */
    static ALL_SOURCES => 1
}
