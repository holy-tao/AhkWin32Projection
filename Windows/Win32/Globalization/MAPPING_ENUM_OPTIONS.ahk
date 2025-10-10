#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains options used by the MappingGetServices function to enumerate ELS services.
 * @remarks
 * 
  * The <b>Size</b> member is the only required member of this structure. All the other members are optional. The application can set any of the members that it needs for search criteria.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//elscore/ns-elscore-mapping_enum_options
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class MAPPING_ENUM_OPTIONS extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Size of the structure, used to validate the structure version. This value is required.
     * @type {Pointer}
     */
    Size {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Optional. Pointer to a service category, for example, "Language Detection". The application must set this member to <b>NULL</b> if the service category is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszCategory {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Optional. Pointer to an input language string, following the IETF naming convention, that identifies the input language that services should accept. The application can set this member to <b>NULL</b> if the supported input language is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszInputLanguage {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Optional. Pointer to an output language string, following the IETF naming convention, that identifies the output language that services use to retrieve results. The application can set this member to <b>NULL</b> if the output language is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszOutputLanguage {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Optional. Pointer to a standard Unicode script name that can be accepted by services. The application set this member to <b>NULL</b> if the input script is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszInputScript {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Optional. Pointer to a standard Unicode script name used by services. The application can set this member to <b>NULL</b> if the output script is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszOutputScript {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format that the services should be able to interpret when the application passes data. Examples of content types are "text/plain", "text/html", and "text/css". The application can set this member to <b>NULL</b> if the input content type is not a search criterion. 
     * 
     * <div class="alert"><b>Note</b>  In Windows 7, the ELS services support only the content type "text/plain". A content type specification can be found at <a href="https://www.iana.org/assignments/media-types/text">Text Media Types</a>.</div>
     * <div> </div>
     * @type {Pointer<Char>}
     */
    pszInputContentType {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Optional. Pointer to a string, following the format of the MIME content types, that identifies the format in which the services retrieve data. The application can set this member to <b>NULL</b> if the output content type is not a search criterion.
     * @type {Pointer<Char>}
     */
    pszOutputContentType {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Optional. Pointer to a globally unique identifier (GUID) structure for a specific service. The application must set this member to <b>NULL</b> if the GUID is not a search criterion.
     * @type {Pointer<Guid>}
     */
    pGuid {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * This bitfield backs the following members:
     * - OnlineService
     * - ServiceType
     * @type {Integer}
     */
    _bitfield {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Reserved for future use. Must be set to 0.
     * @type {Integer}
     */
    OnlineService {
        get => (this._bitfield >> 0) & 0x3
        set => this._bitfield := ((value & 0x3) << 0) | (this._bitfield & ~(0x3 << 0))
    }

    /**
     * Reserved for future use. Must be set to 0.
     * @type {Integer}
     */
    ServiceType {
        get => (this._bitfield >> 2) & 0x3
        set => this._bitfield := ((value & 0x3) << 2) | (this._bitfield & ~(0x3 << 2))
    }
}
