#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the data type of the buffer returned by the SLGetWindowsInformation function.
 * @see https://learn.microsoft.com/windows/win32/api/slpublic/ne-slpublic-sldatatype
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SLDATATYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
