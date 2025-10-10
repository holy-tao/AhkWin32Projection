#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains flags that can be used to refine the search for a cryptographic algorithm.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/ne-certenroll-algorithmflags
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class AlgorithmFlags{

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
