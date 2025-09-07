#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains media type information for registering a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_REGISTER_TYPE_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The major media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     * @type {Pointer<Guid>}
     */
    guidMajorType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
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
     * @type {Pointer<Guid>}
     */
    guidSubtype {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
