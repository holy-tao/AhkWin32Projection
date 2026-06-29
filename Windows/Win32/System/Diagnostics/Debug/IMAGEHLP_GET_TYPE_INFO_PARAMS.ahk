#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IMAGEHLP_SYMBOL_TYPE_INFO.ahk" { IMAGEHLP_SYMBOL_TYPE_INFO }
#Import ".\IMAGEHLP_GET_TYPE_INFO_FLAGS.ahk" { IMAGEHLP_GET_TYPE_INFO_FLAGS }

/**
 * Contains type information for a module.
 * @see https://learn.microsoft.com/windows/win32/api/dbghelp/ns-dbghelp-imagehlp_get_type_info_params
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct IMAGEHLP_GET_TYPE_INFO_PARAMS {
    #StructPack 8

    /**
     * The size of this structure, in bytes.
     */
    SizeOfStruct : UInt32

    Flags : IMAGEHLP_GET_TYPE_INFO_FLAGS

    /**
     * The number of elements specified in the <b>TypeIds</b> array.
     */
    NumIds : UInt32

    /**
     * An array of type indexes.
     */
    TypeIds : IntPtr

    /**
     * The filter for return values. For example, set this member to 1 &lt;&lt; <b>SymTagData</b> to return only results with a symbol tag of <b>SymTagData</b>. For a list of tags, see the <b>SymTagEnum</b> type defined in Dbghelp.h
     */
    TagFilter : Int64

    /**
     * The number of elements specified in the arrays specified in the <b>ReqKinds</b>, <b>ReqOffsets</b>, and <b>ReqSizes</b> members. These arrays must be the same size.
     */
    NumReqs : UInt32

    /**
     * An array of information types to be requested. Each element is one of the enumeration values in the <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info">IMAGEHLP_SYMBOL_TYPE_INFO</a> enumeration type.
     */
    ReqKinds : IMAGEHLP_SYMBOL_TYPE_INFO.Ptr

    /**
     * An array of offsets that specify where to store the data for each request within each element of <b>Buffer</b> array.
     */
    ReqOffsets : IntPtr

    /**
     * The size of each data request, in bytes. The required sizes are described in <a href="https://docs.microsoft.com/windows/desktop/api/dbghelp/ne-dbghelp-imagehlp_symbol_type_info">IMAGEHLP_SYMBOL_TYPE_INFO</a>.
     */
    ReqSizes : IntPtr

    /**
     * The number of bytes for each element in the <b>Buffer</b> array.
     */
    ReqStride : IntPtr

    /**
     * The size of the <b>Buffer</b> array, in bytes.
     */
    BufferSize : IntPtr

    /**
     * An array of records used for storing query results. Each record is separated by <b>ReqStride</b> bytes. Each type for which data is to be retrieved requires one record in the array. Within each record, there are <b>NumReqs</b> pieces of data stored as the result of individual queries. The data is stored within the record according to the offsets specified in <b>ReqOffsets</b>. The format of the data depends on the value of the <b>ReqKinds</b> member in use.
     */
    Buffer : IntPtr

    /**
     * The number of type entries that match the filter.
     */
    EntriesMatched : UInt32

    /**
     * The number of elements in the <b>Buffer</b> array that received results.
     */
    EntriesFilled : UInt32

    /**
     * A bitmask indicating all tag bits encountered during the search operation.
     */
    TagsFound : Int64

    /**
     * A bitmask indicate the bit-wise AND of all <b>ReqsValid</b> fields.
     */
    AllReqsValid : Int64

    /**
     * The size of <b>ReqsValid</b>, in elements.
     */
    NumReqsValid : UInt32

    /**
     * A bitmask indexed by <b>Buffer</b> element index that indicates which request data is valid. This member can be <b>NULL</b>.
     */
    ReqsValid : IntPtr

}
