#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_PROV_SPECIFIC structure contains provider-specific data represented as a binary large object (BLOB).
 * @remarks
 * The <b>ADS_PROV_SPECIFIC</b> structure is one of the data types used as a member of the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-adsvalue">ADSVALUE</a> structure definition. The data is represented as a BLOB here, although the actual data can be packed in any format, such as a C structure. The provider writer must publish the specific data format under the BLOB.
 * 
 * ADSI may also return attributes as <b>ADS_PROV_SPECIFIC</b> if unable to determine the correct attribute syntax type as would occur if, for example, the schema was unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ns-iads-ads_prov_specific
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_PROV_SPECIFIC {
    #StructPack 8

    /**
     * The size of the character array.
     */
    dwLength : UInt32

    /**
     * A pointer to an array of bytes.
     */
    lpValue : IntPtr

}
