#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a source file line. (IMAGEHLP_LINEW64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_LINE</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_LINE</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_linew64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_LINEW64 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_LINE64)</c>.
     */
    SizeOfStruct : UInt32

    /**
     * This member is reserved for use by the operating system.
     */
    Key : IntPtr

    /**
     * The line number in the file.
     */
    LineNumber : UInt32

    /**
     * The name of the file, including the full path.
     */
    FileName : PWSTR

    /**
     * The address of the first instruction in the line.
     */
    Address : Int64

}
