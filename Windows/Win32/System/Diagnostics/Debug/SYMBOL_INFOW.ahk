#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * The SYMBOL_INFOW (Unicode) structure (dbghelp.h) contains symbol information.
 * @remarks
 * > [!NOTE]
 * > The dbghelp.h header defines SYMBOL_INFO as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-symbol_infow
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 * @charset Unicode
 */
class SYMBOL_INFOW extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * The size of the structure, in bytes. This member must be set to <c>sizeof(SYMBOL_INFO)</code>. Note that the total size of the data is the <code>SizeOfStruct + (MaxNameLen - 1) * sizeof(TCHAR)</c>. The reason to subtract one is that the first character in the name is accounted for in the size of the structure.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A unique value that identifies the type data that describes the symbol.  This value does not persist between sessions.
     * @type {Integer}
     */
    TypeIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * This member is reserved for system use.
     * @type {Array<UInt64>}
     */
    Reserved{
        get {
            if(!this.HasProp("__ReservedProxyArray"))
                this.__ReservedProxyArray := Win32FixedArray(this.ptr + 8, 2, Primitive, "uint")
            return this.__ReservedProxyArray
        }
    }

    /**
     * The unique value for the symbol. The value associated with a symbol is not guaranteed to be the same each time you run the process.
     * 
     * For PDB symbols, the index value for a symbol is not generated until the symbol is enumerated or retrieved through a search by name or address. The index values for all CodeView and COFF symbols are generated when the symbols are loaded.
     * @type {Integer}
     */
    Index {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The symbol size, in bytes. This value is meaningful only if the module symbols are from a pdb file;  otherwise, this value is typically zero and should be ignored.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * The base address of the module that contains the symbol.
     * @type {Integer}
     */
    ModBase {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The value of a constant.
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The virtual address of the start of the symbol.
     * @type {Integer}
     */
    Address {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The register.
     * @type {Integer}
     */
    Register {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The DIA scope. For more information, see the <i>Debug Interface Access SDK</i> in the Visual Studio documentation. (This resource may not be available in some languages 
     * 
     * and countries.)
     * @type {Integer}
     */
    Scope {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * The PDB classification. These values are defined in Dbghelp.h in the <a href="https://docs.microsoft.com/previous-versions/visualstudio/visual-studio-2010/bkedss5f(v=vs.100)">SymTagEnum</a> enumeration type.
     * @type {Integer}
     */
    Tag {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The length of the name, in characters, not including the null-terminating character.
     * @type {Integer}
     */
    NameLen {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * The size of the <b>Name</b> buffer, in characters. If this member is 0, the <b>Name</b> member is not used.
     * @type {Integer}
     */
    MaxNameLen {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The name of the symbol. The name can be undecorated if the SYMOPT_UNDNAME option is used with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symsetoptions">SymSetOptions</a> function.
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 84, 0, "UTF-16")
        set => StrPut(value, this.ptr + 84, 0, "UTF-16")
    }
}
