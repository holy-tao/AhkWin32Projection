#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a header for an HSTRING.
 * @see https://learn.microsoft.com/windows/win32/api/hstring/ns-hstring-hstring_header
 * @namespace Windows.Win32.System.WinRT
 */
export default struct HSTRING_HEADER {
    #StructPack 8

    flags : UInt32

    length : UInt32

    padding1 : UInt32

    padding2 : UInt32

    data : IntPtr

}
