#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The **NAMED_PROFILE_INFO** structure is used to store information about a named color profile.
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-named_profile_info
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct NAMED_PROFILE_INFO {
    #StructPack 4

    /**
     * Not currently used by the default CMM.
     */
    dwFlags : UInt32

    /**
     * Total number of named colors in the profile.
     */
    dwCount : UInt32

    /**
     * Total number of device coordinates for each named color.
     */
    dwCountDevCoordinates : UInt32

    /**
     * Pointer to a string containing the prefix for each color name.
     */
    szPrefix : Int8[32]

    /**
     * Pointer to a string containing the suffix for each color name.
     */
    szSuffix : Int8[32]

}
