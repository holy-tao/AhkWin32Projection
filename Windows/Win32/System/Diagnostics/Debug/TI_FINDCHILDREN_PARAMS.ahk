#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains type index information. It is used by the SymGetTypeInfo function.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-ti_findchildren_params
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct TI_FINDCHILDREN_PARAMS {
    #StructPack 4

    /**
     * The number of children.
     */
    Count : UInt32

    /**
     * The zero-based index of the child from which the child indexes are to be retrieved. For example, in an array with five elements, if Start is two, this indicates the third array element. In most cases, this member is zero.
     */
    Start : UInt32

    /**
     * An array of type indexes. There is one index per child.
     */
    ChildId : UInt32[1]

}
