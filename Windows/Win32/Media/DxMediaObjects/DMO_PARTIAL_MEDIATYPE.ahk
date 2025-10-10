#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DMO_PARTIAL_MEDIATYPE structure partially describes a media type used by a Microsoft DirectX Media Object (DMO). The DMO registration functions use this structure to specify supported media types.
 * @see https://docs.microsoft.com/windows/win32/api//dmoreg/ns-dmoreg-dmo_partial_mediatype
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class DMO_PARTIAL_MEDIATYPE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Major type GUID. Use GUID_NULL to match any major type.
     * @type {Pointer<Guid>}
     */
    type {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Subtype GUID. Use GUID_NULL to match any subtype.
     * @type {Pointer<Guid>}
     */
    subtype {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
