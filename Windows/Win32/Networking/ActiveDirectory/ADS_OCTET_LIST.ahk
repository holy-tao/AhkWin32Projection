#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_OCTET_LIST structure is an ADSI representation of an ordered sequence of single-byte strings.
 * @remarks
 * For more information, see Novell NetWare Directory Services Schema Specification, version 1.1.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_octet_list
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_OCTET_LIST {
    #StructPack 8

    /**
     * Pointer to the next <b>ADS_OCTET_LIST</b> entry in the list.
     */
    Next : ADS_OCTET_LIST.Ptr

    /**
     * Contains the length, in bytes, of the list.
     */
    Length : UInt32

    /**
     * Pointer to an array of BYTEs that contains the list. The <b>Length</b> member of this structure contains the number of BYTEs in this array.
     */
    Data : IntPtr

}
