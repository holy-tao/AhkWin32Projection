#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains values that specify the type of certificate used to obtain a license.
 * @remarks
 * This enumeration is used by the <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WTS_LICENSE_CAPABILITIES</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/wtsdefs/ne-wtsdefs-wts_cert_type
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct WTS_CERT_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
