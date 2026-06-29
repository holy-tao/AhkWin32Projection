#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The TTEMBEDINFO structure contains a list of URLs from which the embedded font object may be legitimately referenced.
 * @see https://learn.microsoft.com/windows/win32/api/t2embapi/ns-t2embapi-ttembedinfo
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct TTEMBEDINFO {
    #StructPack 8

    /**
     * Size, in bytes, of this structure. The client should set this value to <b>sizeof</b>(TTEMBEDINFO).
     */
    usStructSize : UInt16

    /**
     * Size, in wide characters, of <i>pusRootStr</i> including NULL terminator(s).
     */
    usRootStrSize : UInt16

    /**
     * One or more full URLs that the embedded font object may be referenced from. Multiple URLs, separated by NULL terminators, can be specified.
     */
    pusRootStr : IntPtr

}
