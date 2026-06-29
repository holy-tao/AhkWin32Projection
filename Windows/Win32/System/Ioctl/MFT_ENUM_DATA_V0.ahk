#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information defining the boundaries for and starting place of an enumeration of update sequence number (USN) change journal records.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-mft_enum_data_v0
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct MFT_ENUM_DATA_V0 {
    #StructPack 8

    /**
     * The ordinal position within the files on the current volume at which the enumeration is to begin.
     * 
     * The first call to <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_enum_usn_data">FSCTL_ENUM_USN_DATA</a> during an 
     *        enumeration must have the <b>StartFileReferenceNumber</b> member set to 
     *        <c>(DWORDLONG)0</c>. Each call to 
     *        <b>FSCTL_ENUM_USN_DATA</b> retrieves the starting point for 
     *        the subsequent call as the first entry in the output buffer. Subsequent calls must be made with 
     *        <b>StartFileReferenceNumber</b> set to this value. For more information, see 
     *        <b>FSCTL_ENUM_USN_DATA</b>.
     */
    StartFileReferenceNumber : Int64

    /**
     * The lower boundary of the range of USN values used to filter which records are returned. Only records whose 
     *       last change journal USN is between or equal to the <b>LowUsn</b> and 
     *       <b>HighUsn</b> member values are returned.
     */
    LowUsn : Int64

    /**
     * The upper boundary of the range of USN values used to filter which files are returned.
     */
    HighUsn : Int64

}
