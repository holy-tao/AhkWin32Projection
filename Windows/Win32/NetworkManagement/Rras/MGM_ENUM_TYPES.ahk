#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MGM_ENUM_TYPES enumeration lists the types of group enumerations that the multicast group manager uses. This structure is used by the MgmGroupEnumerationStart function.
 * @see https://docs.microsoft.com/windows/win32/api//mgm/ne-mgm-mgm_enum_types
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MGM_ENUM_TYPES extends Win32Enum{

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
