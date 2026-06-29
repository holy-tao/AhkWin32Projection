#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that can be used to refine the search for a cryptographic algorithm.
 * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-algorithmflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct AlgorithmFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No flags are specified.
     * @type {Integer (Int32)}
     */
    static AlgorithmFlagsNone => 0

    /**
     * The algorithm is used for key wrapping. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/certenroll/nf-certenroll-iobjectid-initializefromalgorithmname">InitializeFromAlgorithmName</a>.
     * @type {Integer (Int32)}
     */
    static AlgorithmFlagsWrap => 1
}
