#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether a private key can be exported. This enumeration type is used in the [Exportable](certificaterequestproperties_exportable.md) property of a [CertificateRequestProperties](certificaterequestproperties.md) object.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.exportoption
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class ExportOption extends Win32Enum{

    /**
     * The private key is not exportable.
     * @type {Integer (Int32)}
     */
    static NotExportable => 0

    /**
     * The private key is exportable.
     * @type {Integer (Int32)}
     */
    static Exportable => 1
}
