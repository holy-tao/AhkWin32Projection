#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies certificate installation options. This enumeration type is used by the [InstallCertificateAsync](certificateenrollmentmanager_installcertificateasync_225635424.md) and [ImportPfxDataAsync](certificateenrollmentmanager_importpfxdataasync_2003079147.md) methods.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.cryptography.certificates.installoptions
 * @namespace Windows.Security.Cryptography.Certificates
 * @version WindowsRuntime 1.4
 */
class InstallOptions extends Win32BitflagEnum{

    /**
     * No options are specified.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * Delete expired certificates.
     * @type {Integer (UInt32)}
     */
    static DeleteExpired => 1
}
