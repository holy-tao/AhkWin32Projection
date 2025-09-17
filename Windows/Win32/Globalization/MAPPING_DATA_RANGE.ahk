#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains text recognition results for a recognized text subrange. An array of structures of this type is retrieved by an Extended Linguistic Services (ELS) service in a MAPPING_PROPERTY_BAG structure.
 * @remarks
 * <div class="alert"><b>Note</b>  The application should not alter any of the members of this data structure.</div>
  * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/elscore/ns-elscore-mapping_data_range
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MAPPING_DATA_RANGE extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Index of the beginning of the subrange in the text, where 0 indicates the character at the pointer passed to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>, instead of an offset to the index passed to the function in the <i>dwIndex</i> parameter. The value should be less than the entire length of the text.
     * @type {Integer}
     */
    dwStartIndex {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Index of the end of the subrange in the text, where 0 indicates the character at the pointer passed to <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingrecognizetext">MappingRecognizeText</a>, instead of an offset to the index passed to the function in the <i>dwIndex</i> parameter. The value should be less than the entire length of the text.
     * @type {Integer}
     */
    dwEndIndex {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Reserved.
     * @type {Pointer<Char>}
     */
    pszDescription {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    dwDescriptionLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to data retrieved as service output associated with the subrange. This data must be of the format indicated by the content type supplied in the <b>pszContentType</b> member.
     * @type {Pointer<Void>}
     */
    pData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size, in bytes, of the data specified in <b>pData</b>. Each service is required to report its output data size in bytes.
     * @type {Integer}
     */
    dwDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Optional. Pointer to a string specifying the MIME content type of the data indicated by <b>pData</b>. Examples of content types are "text/plain", "text/html", and "text/css". 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content type specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     * @type {Pointer<Char>}
     */
    pszContentType {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Available action Ids for this subrange. They are usable for calling <a href="https://docs.microsoft.com/windows/desktop/api/elscore/nf-elscore-mappingdoaction">MappingDoAction</a>.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     * @type {Pointer<Char>}
     */
    prgActionIds {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The number of available actions for this subrange.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     * @type {Integer}
     */
    dwActionsCount {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Action display names for this subrange. These strings can be localized.
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services do not expose any actions.</div>
     * <div> </div>
     * @type {Pointer<Char>}
     */
    prgActionDisplayNames {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
