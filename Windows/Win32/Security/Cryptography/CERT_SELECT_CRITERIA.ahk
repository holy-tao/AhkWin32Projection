#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CERT_SELECT_CRITERIA_TYPE.ahk" { CERT_SELECT_CRITERIA_TYPE }

/**
 * Specifies selection criteria that is passed to the CertSelectCertificateChains function.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cert_select_criteria
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CERT_SELECT_CRITERIA {
    #StructPack 8

    dwType : CERT_SELECT_CRITERIA_TYPE

    /**
     * A <b>DWORD</b> value that specifies the number of search attributes specified in the <b>ppPara</b> member.
     */
    cPara : UInt32

    /**
     * A pointer to a pointer to one or more selection values.  The data type depends on the selection type specified by the <b>dwType</b> member. If more than one selection value is present, an application must match only one value.
     */
    ppPara : IntPtr

}
