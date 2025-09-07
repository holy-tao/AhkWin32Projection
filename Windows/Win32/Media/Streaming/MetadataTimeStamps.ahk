#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The MetadataTimeStamps structure describes the blob format for the MF_CAPTURE_METADATA_FACEROITIMESTAMPS attribute.
 * @remarks
 * The <b>MF_CAPTURE_METADATA_FACEROITIMESTAMPS</b> attribute contains the time stamp information for the face ROIs identified in <b>MF_CAPTURE_METADATA_FACEROIS</b>.  For a  device that cannot provide the time stamp for face ROIs, this attribute should be omitted.
  * 
  * For the <b>Flags</b> field, the following bit flags  indicate which time stamp is valid:
  * 
  * 
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-metadatatimestamps
 * @namespace Windows.Win32.Media.Streaming
 * @version v4.0.30319
 */
class MetadataTimeStamps extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Bitwise OR of the <b>MF_METADATATIMESTAMPS_*</b> flags.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * QPC time for the sample  the face rectangle is derived from (in 100ns).
     * @type {Integer}
     */
    Device {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * PTS for the sample  the face rectangle is derived from (in 100ns).
     * @type {Integer}
     */
    Presentation {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
