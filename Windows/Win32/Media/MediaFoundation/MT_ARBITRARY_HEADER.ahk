#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains format data for a binary stream in an Advanced Streaming Format (ASF) file.
 * @remarks
 * This structure is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-arbitrary-header">MF_MT_ARBITRARY_HEADER</a> media type attribute.
  * 
  * This structure corresponds to the first 60 bytes of the Type-Specific Data field of the Stream Properties Object, in files where the stream type is ASF_Binary_Media. For more information, see the ASF specification.
  * 
  * The Format Data field of the Type-Specific Data field is contained in the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-arbitrary-format">MF_MT_ARBITRARY_FORMAT</a> attribute of the media type.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-mt_arbitrary_header
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MT_ARBITRARY_HEADER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Major media type. This value is the GUID stored in the Major Media Type field of the Type-Specific Data field of the ASF file. It might not match the major type GUID from the Media Foundation media type.
     * @type {Pointer<Guid>}
     */
    majortype {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Media subtype.
     * @type {Pointer<Guid>}
     */
    subtype {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * If <b>TRUE</b>, samples have a fixed size in bytes.
     *           Otherwise, samples have variable size.
     * @type {Integer}
     */
    bFixedSizeSamples {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * If <b>TRUE</b>, the data in this stream uses temporal compression. Otherwise, samples are independent of each other.
     * @type {Integer}
     */
    bTemporalCompression {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * If <b>bFixedSizeSamples</b> is <b>TRUE</b>, this member specifies the sample size in bytes. Otherwise, the value is ignored and should be 0.
     * @type {Integer}
     */
    lSampleSize {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Format type GUID. This GUID identifies the structure of the additional format data, which is stored in the 
     *           <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-arbitrary-format">MF_MT_ARBITRARY_FORMAT</a> attribute of the media type. If no additional format data is present, <b>formattype</b> equals GUID_NULL.
     * @type {Pointer<Guid>}
     */
    formattype {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
