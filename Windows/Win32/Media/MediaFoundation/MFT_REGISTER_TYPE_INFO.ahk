#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains media type information for registering a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mft_register_type_info
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFT_REGISTER_TYPE_INFO {
    #StructPack 4

    /**
     * The major media type. For a list of possible values, see <a href="https://docs.microsoft.com/windows/desktop/medfound/media-type-guids">Major Media Types</a>.
     */
    guidMajorType : Guid

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
     */
    guidSubtype : Guid

}
