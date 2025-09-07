#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FaceCharacterizationBlobHeader structure describes the size and count information of the blob format for the MF_CAPTURE_METADATA_FACEROICHARACTERIZATIONS attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-facecharacterizationblobheader
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class FaceCharacterizationBlobHeader extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size of this header + all following <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facecharacterization">FaceCharacterization</a> structures.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of <b>FaceCharacterization</b> structures in the blob. Must match the number of <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfo">FaceRectInfo</a> structures in <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfoblobheader">FaceRectInfoBlobHeader</a>.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
