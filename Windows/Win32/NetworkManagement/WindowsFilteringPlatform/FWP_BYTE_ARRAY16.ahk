#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an array of exactly 16 bytes.
 * @remarks
 * This data type  is useful for IPv6 addresses.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_byte_array16
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_BYTE_ARRAY16 {
    #StructPack 1

    /**
     * Array of 16 bytes.
     */
    byteArray16 : Int8[16]

}
