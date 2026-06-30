#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains media type information for registering a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFT_REGISTER_TYPE_INFO extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * The major media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @type {Guid}
     */
    guidMajorType {
        get {
            if(!this.HasProp("__guidMajorType"))
                this.__guidMajorType := Guid(0, this)
            return this.__guidMajorType
        }
    }

    /**
     * The media subtype. For a list of possible values, see the following topics:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/audio-subtype-guids">Audio Subtype GUIDs</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/video-subtype-guids">Video Subtype GUIDs</a>
     * </li>
     * </ul>
     * @type {Guid}
     */
    guidSubtype {
        get {
            if(!this.HasProp("__guidSubtype"))
                this.__guidSubtype := Guid(16, this)
            return this.__guidSubtype
        }
    }
}
