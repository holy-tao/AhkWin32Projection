#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Identifies the type of symbol information to be retrieved.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_SYMBOL_TYPE_INFO extends Win32Enum{

    /**
     * The symbol tag.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_SYMTAG => 0

    /**
     * The symbol name.
     * 
     * The data type is <b>WCHAR**</b>. The caller must free the buffer.
     * @type {Integer (Int32)}
     */
    static TI_GET_SYMNAME => 1

    /**
     * The length of the type.
     * 
     * The data type is <b>ULONG64*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_LENGTH => 2

    /**
     * The type.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_TYPE => 3

    /**
     * The type index.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_TYPEID => 4

    /**
     * The base type for the type index.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_BASETYPE => 5

    /**
     * The type index for index of an array type.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_ARRAYINDEXTYPEID => 6

    /**
     * The type index of all children.
     * 
     * The data type  is a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ns-dbghelp-ti_findchildren_params">TI_FINDCHILDREN_PARAMS</a> structure.
     * 
     * - The <b>Count</b> member should be initialized with the number of children.
     * - The <b>Start</b> member should also be initialized. In most cases, to zero.
     * @type {Integer (Int32)}
     */
    static TI_FINDCHILDREN => 7

    /**
     * The data kind.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_DATAKIND => 8

    /**
     * The address offset.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_ADDRESSOFFSET => 9

    /**
     * The offset of the type in the parent. Members can use this to get their offset in a structure.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_OFFSET => 10

    /**
     * The value of a constant or enumeration value.
     * 
     * The data type is <b>VARIANT*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_VALUE => 11

    /**
     * The count of array elements.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_COUNT => 12

    /**
     * The number of children.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_CHILDRENCOUNT => 13

    /**
     * The bit position of a bitfield.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_BITPOSITION => 14

    /**
     * A value that indicates whether the base class is virtually inherited.
     * 
     * The data type is <b>BOOL</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALBASECLASS => 15

    /**
     * The symbol interface of the type of virtual table, for a user-defined type.
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALTABLESHAPEID => 16

    /**
     * The offset of the virtual base pointer.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALBASEPOINTEROFFSET => 17

    /**
     * The type index of the class parent.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_CLASSPARENTID => 18

    /**
     * A value that indicates whether the type index is nested.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_NESTED => 19

    /**
     * The symbol index for a type.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_SYMINDEX => 20

    /**
     * The lexical parent of the type.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_LEXICALPARENT => 21

    /**
     * The index address.
     * 
     * The data type is <b>ULONG64*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_ADDRESS => 22

    /**
     * The offset from the <b>this</b> pointer to its actual value.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_THISADJUST => 23

    /**
     * The UDT kind.
     * 
     * The data type is <b>DWORD*</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_UDTKIND => 24

    /**
     * The equivalency of two types.
     * 
     * The data type is <b>DWORD*</b>. The value is S_OK is the two types are equivalent, and S_FALSE otherwise.
     * @type {Integer (Int32)}
     */
    static TI_IS_EQUIV_TO => 25

    /**
     * The calling convention.
     * 
     * The data type is <b>DWORD</b>. The following are the valid values:
     * @type {Integer (Int32)}
     */
    static TI_GET_CALLING_CONVENTION => 26

    /**
     * The equivalency of two symbols. This is not guaranteed to be accurate.
     * 
     * The data type is <b>DWORD*</b>. The value is S_OK is the two types are equivalent, and S_FALSE otherwise.
     * @type {Integer (Int32)}
     */
    static TI_IS_CLOSE_EQUIV_TO => 27

    /**
     * The element where the valid request bitfield should be stored.
     * 
     * The data type is <b>ULONG64*</b>.
     * 
     * This value is only used with the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/nf-dbghelp-symgettypeinfoex">SymGetTypeInfoEx</a> function.
     * @type {Integer (Int32)}
     */
    static TI_GTIEX_REQS_VALID => 28

    /**
     * The offset in the virtual function table of a virtual function.
     * 
     * The data type is <b>DWORD</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALBASEOFFSET => 29

    /**
     * The index into the virtual base displacement table.
     * 
     * The data type is <b>DWORD</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALBASEDISPINDEX => 30

    /**
     * Indicates whether a pointer type is a reference.
     * 
     * The data type is <b>Boolean</b>.
     * @type {Integer (Int32)}
     */
    static TI_GET_IS_REFERENCE => 31

    /**
     * Indicates whether the user-defined data type is an indirect virtual base.
     * 
     * The data type is <b>BOOL</b>.
     * 
     * <b>DbgHelp 6.6 and earlier:  </b>This value is not supported.
     * @type {Integer (Int32)}
     */
    static TI_GET_INDIRECTVIRTUALBASECLASS => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static TI_GET_VIRTUALBASETABLETYPE => 33

    /**
     * @type {Integer (Int32)}
     */
    static TI_GET_OBJECTPOINTERTYPE => 34

    /**
     * @type {Integer (Int32)}
     */
    static TI_GET_DISCRIMINATEDUNION_TAG_TYPEID => 35

    /**
     * @type {Integer (Int32)}
     */
    static TI_GET_DISCRIMINATEDUNION_TAG_OFFSET => 36

    /**
     * @type {Integer (Int32)}
     */
    static TI_GET_DISCRIMINATEDUNION_TAG_RANGESCOUNT => 37

    /**
     * @type {Integer (Int32)}
     */
    static TI_GET_DISCRIMINATEDUNION_TAG_RANGES => 38

    /**
     * 
     * @type {Integer (Int32)}
     */
    static IMAGEHLP_SYMBOL_TYPE_INFO_MAX => 39
}
