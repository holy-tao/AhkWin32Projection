#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of certificate information that is provided.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/ne-ntsecapi-kerb_certificate_info_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KERB_CERTIFICATE_INFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Identifies certificate hash information as defined by the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-kerb_certificate_hashinfo">KERB_CERTIFICATE_HASHINFO</a> structure.
     * @type {Integer (Int32)}
     */
    static CertHashInfo => 1
}
