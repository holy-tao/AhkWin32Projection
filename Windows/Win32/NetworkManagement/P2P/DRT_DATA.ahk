#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * DRT_DATA structure contains a data blob. This structure is used by several DRT functions.
 * @see https://learn.microsoft.com/windows/win32/api/drt/ns-drt-drt_data
 * @namespace Windows.Win32.NetworkManagement.P2P
 */
export default struct DRT_DATA {
    #StructPack 8

    /**
     * The number of bytes.
     */
    cb : UInt32

    /**
     * Pointer to a byte array that contains the common data.
     */
    pb : IntPtr

}
