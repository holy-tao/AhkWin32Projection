#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MAPPING_DATA_RANGE.ahk" { MAPPING_DATA_RANGE }

/**
 * Contains the text recognition data properties retrieved by MappingRecognizeText.
 * @remarks
 * The memory for the property bag structure itself is managed by the application. The ELS platform and its services only manage the data pointers that they store in the property bag.
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_property_bag
 * @namespace Windows.Win32.Globalization
 */
export default struct MAPPING_PROPERTY_BAG {
    #StructPack 8

    /**
     * Size of the structure, used to verify the structure version. This value is required.
     */
    Size : IntPtr

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/elscore/ns-elscore-mapping_data_range">MAPPING_DATA_RANGE</a> structures containing all recognized text range results. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     */
    prgResultRanges : MAPPING_DATA_RANGE.Ptr

    /**
     * Number of items in the array indicated by <b>prgResultRanges</b>. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     */
    dwRangesCount : UInt32

    /**
     * Pointer to private service data. The service can document the format of this data so that the application can use it. The service also manages the memory for this data. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     */
    pServiceData : IntPtr

    /**
     * Size, in bytes, of the private service data specified by <b>pServiceData</b>. The size is set to 0 if there is no private data. This member is populated by <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>.
     */
    dwServiceDataSize : UInt32

    /**
     * Pointer to private application data to pass to the service. The application manages the memory for this data.
     */
    pCallerData : IntPtr

    /**
     * Size, in bytes, of the private application data indicated in <b>pCallerData</b>. This member is set to 0 if there is no private data.
     */
    dwCallerDataSize : UInt32

    /**
     * Reserved for internal use.
     */
    pContext : IntPtr

}
