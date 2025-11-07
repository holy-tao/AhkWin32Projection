#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the data type of a property value in a property list.
 * @see https://docs.microsoft.com/windows/win32/api//msclus/ne-msclus-cluster_property_format
 * @namespace Windows.Win32.Networking.Clustering
 * @version v4.0.30319
 */
class CLUSTER_PROPERTY_FORMAT{

    /**
     * Data is in an unknown format.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_UNKNOWN => 0

    /**
     * Data is a binary value.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_BINARY => 1

    /**
     * Data is a <b>DWORD</b> value.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_DWORD => 2

    /**
     * Data is a null-terminated Unicode string.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_SZ => 3

    /**
     * Data is a null-terminated Unicode string with unexpanded references to environment variables.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_EXPAND_SZ => 4

    /**
     * Data is an array of null-terminated Unicode strings.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_MULTI_SZ => 5

    /**
     * Data is an <b>ULARGE_INTEGER</b>.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_ULARGE_INTEGER => 6

    /**
     * Data is an signed <b>LONG</b> value.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_LONG => 7

    /**
     * Data is a null-terminated Unicode string with expanded references to environment variables.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_EXPANDED_SZ => 8

    /**
     * Data is a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> in 
     *           <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> 
     *           format. For more information about self-relative security descriptors, see 
     *           <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/absolute-and-self-relative-security-descriptors">Absolute and Self-Relative Security Descriptors</a>.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_SECURITY_DESCRIPTOR => 9

    /**
     * Data is a signed <b>LARGE_INTEGER</b>.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_LARGE_INTEGER => 10

    /**
     * Data is a <b>WORD</b> value.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_WORD => 11

    /**
     * Data is a <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a>.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_FILETIME => 12

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_VALUE_LIST => 13

    /**
     * 
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_PROPERTY_LIST => 14

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static CLUSPROP_FORMAT_USER => 32768
}
