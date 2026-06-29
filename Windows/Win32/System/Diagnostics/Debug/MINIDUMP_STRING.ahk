#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Describes a string.
 * @see https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_string
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct MINIDUMP_STRING {
    #StructPack 4

    /**
     * The size of the string in the <b>Buffer</b> member, in bytes. This size does not include the null-terminating character.
     */
    Length : UInt32

    /**
     * The null-terminated string.
     */
    Buffer : WCHAR[1]

}
