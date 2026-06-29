#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies whether a web-enabled method or property is safe for scripting.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-websecuritylevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct WebSecurityLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The method is not safe for scripting.
     * @type {Integer (Int32)}
     */
    static LevelUnsafe => 0

    /**
     * The method is safe for scripting.
     * @type {Integer (Int32)}
     */
    static LevelSafe => 1
}
