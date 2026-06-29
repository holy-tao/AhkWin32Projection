#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an array of exactly 6 bytes. Reserved.
 * @remarks
 * This structure is reserved.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_byte_array6
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_BYTE_ARRAY6 {
    #StructPack 1

    /**
     * Array of 6 bytes.
     */
    byteArray6 : Int8[6]

}
