#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DMO_PARTIAL_MEDIATYPE structure partially describes a media type used by a Microsoft DirectX Media Object (DMO). The DMO registration functions use this structure to specify supported media types.
 * @see https://learn.microsoft.com/windows/win32/api/dmoreg/ns-dmoreg-dmo_partial_mediatype
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct DMO_PARTIAL_MEDIATYPE {
    #StructPack 4

    /**
     * Major type GUID. Use GUID_NULL to match any major type.
     */
    type : Guid

    /**
     * Subtype GUID. Use GUID_NULL to match any subtype.
     */
    subtype : Guid

}
