#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains FIPS version information.
 * @see https://learn.microsoft.com/windows/win32/api/bcrypt/ne-bcrypt-dsafipsversion_enum
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct DSAFIPSVERSION_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Federal Information Processing Standard (FIPS) 2.
     * @type {Integer (Int32)}
     */
    static DSA_FIPS186_2 => 0

    /**
     * Federal Information Processing Standard (FIPS) 3.
     * @type {Integer (Int32)}
     */
    static DSA_FIPS186_3 => 1
}
