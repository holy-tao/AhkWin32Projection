#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains returned update sequence number (USN) from FSCTL_USN_TRACK_MODIFIED_RANGES control code.
 * @remarks
 * This structure is optional.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-usn_range_track_output
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct USN_RANGE_TRACK_OUTPUT {
    #StructPack 8

    /**
     * Returned update sequence number (USN) that identifies at what point in the USN Journal that range tracking was enabled.
     */
    Usn : Int64

}
