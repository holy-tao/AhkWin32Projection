#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the certificate request type.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-x509requesttype
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class X509RequestType extends Win32Enum{

    /**
     * The type is not defined.
     * @type {Integer (Int32)}
     */
    static TypeAny => 0

    /**
     * A PKCS #10 request. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs10">IX509CertificateRequestPkcs10</a> interface.
     * @type {Integer (Int32)}
     */
    static TypePkcs10 => 1

    /**
     * A PKCS #7 request represented by an <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestpkcs7">IX509CertificateRequestPkcs7</a> interface.
     * @type {Integer (Int32)}
     */
    static TypePkcs7 => 2

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Management over CMS</a> (CMC) request. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcmc">IX509CertificateRequestCmc</a> interface.
     * @type {Integer (Int32)}
     */
    static TypeCmc => 3

    /**
     * A self-signed <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate</a>. For more information, see the <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nn-certenroll-ix509certificaterequestcertificate">IX509CertificateRequestCertificate</a> interface.
     * @type {Integer (Int32)}
     */
    static TypeCertificate => 4
}
