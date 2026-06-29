#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about the extended key usage (EKU) properties of a certificate.
 * @see https://learn.microsoft.com/windows/win32/api/iketypes/ns-iketypes-ikeext_cert_ekus0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
export default struct IKEEXT_CERT_EKUS0 {
    #StructPack 8

    /**
     * Type: <b>ULONG</b>
     * 
     *  The number of EKUs in the <b>eku</b> member.
     */
    numEku : UInt32

    /**
     * Type: <b>LPSTR*</b>
     * 
     * The list of EKU object identifiers (OIDs).
     */
    eku : PSTR.Ptr

}
