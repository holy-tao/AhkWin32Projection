#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FaceRectInfoBlobHeader structure describes the size and count information of the blob format for the MF_CAPTURE_METADATA_FACEROIS attribute.
 * @see https://docs.microsoft.com/windows/win32/api//mfapi/ns-mfapi-facerectinfoblobheader
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class FaceRectInfoBlobHeader extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Size of this header + all following <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ns-mfapi-facerectinfo">FaceRectInfo</a> structures.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Number of <b>FaceRectInfo</b> structures in the blob.
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
