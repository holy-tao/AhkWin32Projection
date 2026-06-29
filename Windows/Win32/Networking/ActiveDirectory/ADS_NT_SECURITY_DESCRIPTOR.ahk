#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_NT_SECURITY_DESCRIPTOR structure defines the data type of the security descriptor for Windows.
 * @remarks
 * The <b>ADS_NT_SECURITY_DESCRIPTOR</b> structure is normally used as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure definition.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_nt_security_descriptor
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_NT_SECURITY_DESCRIPTOR {
    #StructPack 8

    /**
     * The length data, in bytes.
     */
    dwLength : UInt32

    /**
     * Pointer to the security descriptor, represented as a byte array.
     */
    lpValue : IntPtr

}
