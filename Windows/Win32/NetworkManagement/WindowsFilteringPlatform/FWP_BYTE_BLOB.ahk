#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Stores an array containing a variable number of bytes.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_byte_blob
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct FWP_BYTE_BLOB {
    #StructPack 8

    /**
     * Number of  bytes in the array.
     */
    size : UInt32

    /**
     * Pointer to the array.
     */
    data : IntPtr

}
