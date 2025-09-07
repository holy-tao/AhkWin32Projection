#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the data type of the buffer returned by the SLGetWindowsInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sldatatype
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SLDATATYPE{

    /**
     * The buffer has no data type.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_NONE => 0

    /**
     * The buffer contains a null-terminated Unicode string.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_SZ => 1

    /**
     * The buffer contains a <b>DWORD</b> value.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_DWORD => 4

    /**
     * The buffer contains a binary value.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_BINARY => 3

    /**
     * The buffer contains multiple null-terminated Unicode strings.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_MULTI_SZ => 7

    /**
     * The buffer contains a sum.
     * @type {Integer (UInt32)}
     */
    static SL_DATA_SUM => 100
}
