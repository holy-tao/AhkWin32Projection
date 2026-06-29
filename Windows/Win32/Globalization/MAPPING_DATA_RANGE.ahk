#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains text recognition results for a recognized text subrange. An array of structures of this type is retrieved by an Extended Linguistic Services (ELS) service in a MAPPING_PROPERTY_BAG structure.
 * @remarks
 * <div class="alert"><b>Note</b>  The application should not alter any of the members of this data structure.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_data_range
 * @namespace Windows.Win32.Globalization
 */
export default struct MAPPING_DATA_RANGE {
    #StructPack 8

    /**
     * Index of the beginning of the subrange in the text, where 0 indicates the character at the pointer passed to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>, instead of an offset to the index passed to the function in the <i>dwIndex</i> parameter. The value should be less than the entire length of the text.
     */
    dwStartIndex : UInt32

    /**
     * Index of the end of the subrange in the text, where 0 indicates the character at the pointer passed to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>, instead of an offset to the index passed to the function in the <i>dwIndex</i> parameter. The value should be less than the entire length of the text.
     */
    dwEndIndex : UInt32

    /**
     * Reserved.
     */
    pszDescription : PWSTR

    /**
     * Reserved.
     */
    dwDescriptionLength : UInt32

    /**
     * Pointer to data retrieved as service output associated with the subrange. This data must be of the format indicated by the content type supplied in the <b>pszContentType</b> member.
     */
    pData : IntPtr

    /**
     * Size, in bytes, of the data specified in <b>pData</b>. Each service is required to report its output data size in bytes.
     */
    dwDataSize : UInt32

    /**
     * Optional. Pointer to a string specifying the MIME content type of the data indicated by <b>pData</b>. Examples of content types are "text/plain", "text/html", and "text/css". 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content type specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     */
    pszContentType : PWSTR

    /**
     * Available action Ids for this subrange. They are usable for calling <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingdoaction">MappingDoAction</a>.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     */
    prgActionIds : PWSTR.Ptr

    /**
     * The number of available actions for this subrange.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     */
    dwActionsCount : UInt32

    /**
     * Action display names for this subrange. These strings can be localized.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     */
    prgActionDisplayNames : PWSTR.Ptr

}
