#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of certificate used to obtain a license.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WTS_LICENSE_CAPABILITIES</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_cert_type
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class WTS_CERT_TYPE extends Win32Enum{

    /**
     * The certificate is not valid.
     * @type {Integer (Int32)}
     */
    static WTS_CERT_TYPE_INVALID => 0

    /**
     * The certificate is a custom type.
     * @type {Integer (Int32)}
     */
    static WTS_CERT_TYPE_PROPRIETORY => 1

    /**
     * The certificate adheres to the X.509 standard.
     * @type {Integer (Int32)}
     */
    static WTS_CERT_TYPE_X509 => 2
}
