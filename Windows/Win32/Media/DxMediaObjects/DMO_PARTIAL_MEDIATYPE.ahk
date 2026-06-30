#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The DMO_PARTIAL_MEDIATYPE structure partially describes a media type used by a Microsoft DirectX Media Object (DMO). The DMO registration functions use this structure to specify supported media types.
 * @see https://learn.microsoft.com/windows/win32/api/dmoreg/ns-dmoreg-dmo_partial_mediatype
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
class DMO_PARTIAL_MEDIATYPE extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * Major type GUID. Use GUID_NULL to match any major type.
     * @type {Guid}
     */
    type {
        get {
            if(!this.HasProp("__type"))
                this.__type := Guid(0, this)
            return this.__type
        }
    }

    /**
     * Subtype GUID. Use GUID_NULL to match any subtype.
     * @type {Guid}
     */
    subtype {
        get {
            if(!this.HasProp("__subtype"))
                this.__subtype := Guid(16, this)
            return this.__subtype
        }
    }
}
