#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_CERT_CREDENTIAL.ahk
#Include .\WS_STRING.ahk

/**
 * The type for specifying a certificate credential using the certificate's subject name, store location and store name. The specified credential is loaded when the containing channel or listener is opened.
 * @see https://learn.microsoft.com/windows/win32/api/webservices/ns-webservices-ws_subject_name_cert_credential
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_SUBJECT_NAME_CERT_CREDENTIAL extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The base type from which this type and all other certificate credential types derive.
     * @type {WS_CERT_CREDENTIAL}
     */
    credential{
        get {
            if(!this.HasProp("__credential"))
                this.__credential := WS_CERT_CREDENTIAL(this.ptr + 0)
            return this.__credential
        }
    }

    /**
     * The certificate store location (such as CERT_SYSTEM_STORE_CURRENT_USER
     * or CERT_SYSTEM_STORE_LOCAL_MACHINE) that contains the specified
     * certificate.
     * @type {Integer}
     */
    storeLocation {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The certificate store name (such as "My") that contains the specified
     * certificate.
     * @type {WS_STRING}
     */
    storeName{
        get {
            if(!this.HasProp("__storeName"))
                this.__storeName := WS_STRING(this.ptr + 8)
            return this.__storeName
        }
    }

    /**
     * The subject name (such as "CN=service.com") of the specified
     * certificate.  The supplied subject name string must be in a format acceptable to
     * CERT_FIND_SUBJECT_NAME-based
     * search.
     *                 (See <a href="https://docs.microsoft.com/windows/win32/api/wincrypt/nf-wincrypt-certfindcertificateinstore">CertFindCertificateInStore</a>.)
     * @type {WS_STRING}
     */
    subjectName{
        get {
            if(!this.HasProp("__subjectName"))
                this.__subjectName := WS_STRING(this.ptr + 24)
            return this.__subjectName
        }
    }
}
