#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\Cryptography\CERT_CONTEXT.ahk" { CERT_CONTEXT }
#Import "..\..\Security\Cryptography\CERT_QUERY_ENCODING_TYPE.ahk" { CERT_QUERY_ENCODING_TYPE }
#Import "..\..\Security\Cryptography\HCERTSTORE.ahk" { HCERTSTORE }
#Import "..\..\Security\Cryptography\CERT_INFO.ahk" { CERT_INFO }

/**
 * @namespace Windows.Win32.System.Iis
 */
export default struct CERT_CONTEXT_EX {
    #StructPack 8

    CertContext : CERT_CONTEXT

    cbAllocated : UInt32

    dwCertificateFlags : UInt32

}
