#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

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
 */
export default struct MT_ARBITRARY_HEADER {
    #StructPack 4

    /**
     * Major media type. This value is the GUID stored in the Major Media Type field of the Type-Specific Data field of the ASF file. It might not match the major type GUID from the Media Foundation media type.
     */
    majortype : Guid

    /**
     * Media subtype.
     */
    subtype : Guid

    /**
     * If <b>TRUE</b>, samples have a fixed size in bytes.
     *           Otherwise, samples have variable size.
     */
    bFixedSizeSamples : BOOL

    /**
     * If <b>TRUE</b>, the data in this stream uses temporal compression. Otherwise, samples are independent of each other.
     */
    bTemporalCompression : BOOL

    /**
     * If <b>bFixedSizeSamples</b> is <b>TRUE</b>, this member specifies the sample size in bytes. Otherwise, the value is ignored and should be 0.
     */
    lSampleSize : UInt32

    /**
     * Format type GUID. This GUID identifies the structure of the additional format data, which is stored in the 
     *           <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-arbitrary-format">MF_MT_ARBITRARY_FORMAT</a> attribute of the media type. If no additional format data is present, <b>formattype</b> equals GUID_NULL.
     */
    formattype : Guid

}
