#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains symbol information. (IMAGEHLP_SYMBOL64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_SYMBOL</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_SYMBOL</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_symbol64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_SYMBOL64 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_SYMBOL64)</c>.
     */
    SizeOfStruct : UInt32

    /**
     * The virtual address for the symbol.
     */
    Address : Int64

    /**
     * The size of the symbol, in bytes. This value is a best guess and can be zero.
     */
    Size : UInt32

    /**
     * This member is reserved for use by the operating system.
     */
    Flags : UInt32

    /**
     * The maximum length of the string that the <b>Name</b> member can contain, in characters, not including the null-terminating character. Because symbol names can vary in length, this data structure is allocated by the caller. This member is used so the library knows how much memory is available for use by the symbol name.
     */
    MaxNameLength : UInt32

    /**
     * The decorated or undecorated symbol name. If the buffer is not large enough for the complete name, it is truncated to <b>MaxNameLength</b> characters, including the null-terminating character.
     */
    Name : CHAR[1]

}
