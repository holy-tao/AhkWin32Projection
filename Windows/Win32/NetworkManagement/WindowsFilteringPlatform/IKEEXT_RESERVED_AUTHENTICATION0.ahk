#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IKEEXT_RESERVED_AUTHENTICATION_FLAGS.ahk" { IKEEXT_RESERVED_AUTHENTICATION_FLAGS }

/**
 * Reserved for internal use.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_reserved_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_RESERVED_AUTHENTICATION0 {
    #StructPack 4

    /**
     * Type: <b>UINT32</b>
     */
    flags : IKEEXT_RESERVED_AUTHENTICATION_FLAGS

}
