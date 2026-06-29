#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FWP_BYTE_BLOB.ahk" { FWP_BYTE_BLOB }

/**
 * Stores information needed for pre-shared key authentication. (IKEEXT_PRESHARED_KEY_AUTHENTICATION0)
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_preshared_key_authentication0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_PRESHARED_KEY_AUTHENTICATION0 {
    #StructPack 8

    /**
     * The pre-shared key specified by [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob).
     */
    presharedKey : FWP_BYTE_BLOB

}
