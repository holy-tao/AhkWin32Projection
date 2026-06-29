#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\FILETIME.ahk" { FILETIME }
#Import ".\PctPublicKey.ahk" { PctPublicKey }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Cryptography\ALG_ID.ahk" { ALG_ID }

/**
 * Represents an X.509 certificate.
 * @see https://learn.microsoft.com/windows/win32/api/schannel/ns-schannel-x509certificate
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct X509Certificate {
    #StructPack 8

    /**
     * The X.509 version number.
     */
    Version : UInt32

    /**
     * The serial number of the certificate.
     */
    SerialNumber : UInt32[4]

    /**
     * The ID of the algorithm used to create the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/d-gly">digital signature</a> for the certificate.
     */
    SignatureAlgorithm : ALG_ID

    /**
     * The beginning of the period of validity for the certificate.
     */
    ValidFrom : FILETIME

    /**
     * The end of the period of validity for the certificate.
     */
    ValidUntil : FILETIME

    /**
     * A pointer to a string that specifies the issuer of the certificate.
     */
    pszIssuer : PSTR

    /**
     * A pointer to a string that specifies the subject of the certificate.
     */
    pszSubject : PSTR

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">public key</a> used to create the signature for the certificate.
     */
    pPublicKey : PctPublicKey.Ptr

}
