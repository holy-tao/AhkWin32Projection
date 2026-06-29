#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SYMBOL_INFO_FLAGS.ahk" { SYMBOL_INFO_FLAGS }
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The SYMBOL_INFOW (Unicode) structure (dbghelp.h) contains symbol information.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines SYMBOL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-symbol_infow
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @charset Unicode
 */
export default struct SYMBOL_INFOW {
    #StructPack 8

    /**
     * The size of the structure, in bytes. This member must be set to <c>sizeof(SYMBOL_INFO)</code>. Note that the total size of the data is the <code>SizeOfStruct + (MaxNameLen - 1) * sizeof(TCHAR)</c>. The reason to subtract one is that the first character in the name is accounted for in the size of the structure.
     */
    SizeOfStruct : UInt32

    /**
     * A unique value that identifies the type data that describes the symbol.  This value does not persist between sessions.
     */
    TypeIndex : UInt32

    /**
     * This member is reserved for system use.
     */
    Reserved : Int64[2]

    /**
     * The unique value for the symbol. The value associated with a symbol is not guaranteed to be the same each time you run the process.
     * 
     * For PDB symbols, the index value for a symbol is not generated until the symbol is enumerated or retrieved through a search by name or address. The index values for all CodeView and COFF symbols are generated when the symbols are loaded.
     */
    Index : UInt32

    /**
     * The symbol size, in bytes. This value is meaningful only if the module symbols are from a pdb file;  otherwise, this value is typically zero and should be ignored.
     */
    Size : UInt32

    /**
     * The base address of the module that contains the symbol.
     */
    ModBase : Int64

    Flags : SYMBOL_INFO_FLAGS

    /**
     * The value of a constant.
     */
    Value : Int64

    /**
     * The virtual address of the start of the symbol.
     */
    Address : Int64

    /**
     * The register.
     */
    Register : UInt32

    /**
     * The DIA scope. For more information, see the <i>Debug Interface Access SDK</i> in the Visual Studio documentation. (This resource may not be available in some languages 
     * 
     * and countries.)
     */
    Scope : UInt32

    /**
     * The PDB classification. These values are defined in Dbghelp.h in the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/bkedss5f(v=vs.100)">SymTagEnum</a> enumeration type.
     */
    Tag : UInt32

    /**
     * The length of the name, in characters, not including the null-terminating character.
     */
    NameLen : UInt32

    /**
     * The size of the <b>Name</b> buffer, in characters. If this member is 0, the <b>Name</b> member is not used.
     */
    MaxNameLen : UInt32

    /**
     * The name of the symbol. The name can be undecorated if the SYMOPT_UNDNAME option is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function.
     */
    Name : WCHAR[1]

}
