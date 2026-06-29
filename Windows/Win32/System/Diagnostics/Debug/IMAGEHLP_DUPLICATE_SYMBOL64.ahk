#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_SYMBOL64.ahk" { IMAGEHLP_SYMBOL64 }

/**
 * Contains duplicate symbol information. (IMAGEHLP_DUPLICATE_SYMBOL64)
 * @remarks
 * This structure supersedes the <b>IMAGEHLP_DUPLICATE_SYMBOL</b> structure. For more information, see 
 * <a href="https://docs.microsoft.com/windows/desktop/Debug/updated-platform-support">Updated Platform Support</a>. <b>IMAGEHLP_DUPLICATE_SYMBOL</b> is defined as follows in DbgHelp.h. 
 * 
 * 
 * ```cpp
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_duplicate_symbol64
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_DUPLICATE_SYMBOL64 {
    #StructPack 8

    /**
     * The size of the structure, in bytes. The caller must set this member to <c>sizeof(IMAGEHLP_DUPLICATE_SYMBOL64)</c>.
     */
    SizeOfStruct : UInt32

    /**
     * The number of duplicate symbols.
     */
    NumberOfDups : UInt32

    /**
     * A pointer to an array of symbols (
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-imagehlp_symbol">IMAGEHLP_SYMBOL64</a> structures). The number of entries in the array is specified by the <b>NumberOfDups</b> member.
     */
    Symbol : IMAGEHLP_SYMBOL64.Ptr

    /**
     * The index into the symbol array for the selected symbol.
     */
    SelectedSymbol : UInt32

}
