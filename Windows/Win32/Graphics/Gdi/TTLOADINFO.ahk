#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TTLOADINFO structure contains the URL from which the embedded font object has been obtained.
 * @see https://learn.microsoft.com/windows/win32/api/t2embapi/ns-t2embapi-ttloadinfo
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTLOADINFO {
    #StructPack 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTLOADINFO).
     */
    usStructSize : UInt16

    /**
     * Size, in wide characters, of <i>pusRefStr</i>, including the terminating null character.
     */
    usRefStrSize : UInt16

    /**
     * Pointer to the string containing the current URL.
     */
    pusRefStr : IntPtr

}
