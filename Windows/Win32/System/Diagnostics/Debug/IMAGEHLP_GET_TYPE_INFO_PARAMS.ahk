#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk

/**
 * Contains type information for a module.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_get_type_info_params
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class IMAGEHLP_GET_TYPE_INFO_PARAMS extends Win32Struct
{
    static sizeof => 128

    static packingSize => 8

    /**
     * The size of this structure, in bytes.
     * @type {Integer}
     */
    SizeOfStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The number of elements specified in the <b>TypeIds</b> array.
     * @type {Integer}
     */
    NumIds {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An array of type indexes.
     * @type {Pointer<UInt32>}
     */
    TypeIds {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The filter for return values. For example, set this member to 1 &lt;&lt; <b>SymTagData</b> to return only results with a symbol tag of <b>SymTagData</b>. For a list of tags, see the <b>SymTagEnum</b> type defined in Dbghelp.h
     * @type {Integer}
     */
    TagFilter {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The number of elements specified in the arrays specified in the <b>ReqKinds</b>, <b>ReqOffsets</b>, and <b>ReqSizes</b> members. These arrays must be the same size.
     * @type {Integer}
     */
    NumReqs {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * An array of information types to be requested. Each element is one of the enumeration values in the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info">IMAGEHLP_SYMBOL_TYPE_INFO</a> enumeration type.
     * @type {Pointer<Int32>}
     */
    ReqKinds {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * An array of offsets that specify where to store the data for each request within each element of <b>Buffer</b> array.
     * @type {Pointer<UIntPtr>}
     */
    ReqOffsets {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The size of each data request, in bytes. The required sizes are described in <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info">IMAGEHLP_SYMBOL_TYPE_INFO</a>.
     * @type {Pointer<UInt32>}
     */
    ReqSizes {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * The number of bytes for each element in the <b>Buffer</b> array.
     * @type {Pointer}
     */
    ReqStride {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * The size of the <b>Buffer</b> array, in bytes.
     * @type {Pointer}
     */
    BufferSize {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * An array of records used for storing query results. Each record is separated by <b>ReqStride</b> bytes. Each type for which data is to be retrieved requires one record in the array. Within each record, there are <b>NumReqs</b> pieces of data stored as the result of individual queries. The data is stored within the record according to the offsets specified in <b>ReqOffsets</b>. The format of the data depends on the value of the <b>ReqKinds</b> member in use.
     * @type {Pointer<Void>}
     */
    Buffer {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * The number of type entries that match the filter.
     * @type {Integer}
     */
    EntriesMatched {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of elements in the <b>Buffer</b> array that received results.
     * @type {Integer}
     */
    EntriesFilled {
        get => NumGet(this, 92, "uint")
        set => NumPut("uint", value, this, 92)
    }

    /**
     * A bitmask indicating all tag bits encountered during the search operation.
     * @type {Integer}
     */
    TagsFound {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * A bitmask indicate the bit-wise AND of all <b>ReqsValid</b> fields.
     * @type {Integer}
     */
    AllReqsValid {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The size of <b>ReqsValid</b>, in elements.
     * @type {Integer}
     */
    NumReqsValid {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * A bitmask indexed by <b>Buffer</b> element index that indicates which request data is valid. This member can be <b>NULL</b>.
     * @type {Pointer<UInt64>}
     */
    ReqsValid {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }
}
