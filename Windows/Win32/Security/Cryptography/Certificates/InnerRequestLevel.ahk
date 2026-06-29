#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the containment level of a certificate request within a PKCS
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-innerrequestlevel
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct InnerRequestLevel {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Use to retrieve the most deeply nested request.
     * @type {Integer (Int32)}
     */
    static LevelInnermost => 0

    /**
     * Use to retrieve the request at the next nesting level.
     * @type {Integer (Int32)}
     */
    static LevelNext => 1
}
