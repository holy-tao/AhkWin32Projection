#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CMC_TAGGED_CERT_REQUEST.ahk" { CMC_TAGGED_CERT_REQUEST }

/**
 * Used in the CMC_DATA_INFO structures to request a certificate.
 * @remarks
 * Additional members of the union may be defined in future versions.
 * @see https://learn.microsoft.com/windows/win32/api/wincrypt/ns-wincrypt-cmc_tagged_request
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct CMC_TAGGED_REQUEST {
    #StructPack 8

    /**
     * <b>DWORD</b> identifying the union member to be used. CMC_TAGGED_CERT_REQUEST_CHOICE can be used to select the CMC_TAGGED_CERT_REQUEST.
     */
    dwTaggedRequestChoice : UInt32

    pTaggedCertRequest : CMC_TAGGED_CERT_REQUEST.Ptr

}
