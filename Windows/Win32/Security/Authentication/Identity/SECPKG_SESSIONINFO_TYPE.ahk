#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the format of session information.
 * @see https://learn.microsoft.com/windows/win32/api/ntsecpkg/ne-ntsecpkg-secpkg_sessioninfo_type
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SECPKG_SESSIONINFO_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The session information is contained in a <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ns-ntsecpkg-secpkg_primary_cred">SECPKG_PRIMARY_CRED</a> structure.
     * @type {Integer (Int32)}
     */
    static SecSessionPrimaryCred => 0
}
