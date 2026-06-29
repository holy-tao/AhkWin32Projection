#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The DMO_MEDIA_TYPE structure describes the format of the data used by a stream in a Microsoft DirectX Media Object (DMO).
 * @remarks
 * This structure is identical to the DirectShow <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-am_media_type">AM_MEDIA_TYPE</a> structure. The <b>bFixedSizeSamples</b>, <b>bTemporalCompression</b>, and <b>lSampleSize</b> members are for compatibility with DirectShow. Other DMO clients are not required to use them.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ns-mediaobj-dmo_media_type
 * @namespace Windows.Win32.Media.DxMediaObjects
 */
export default struct DMO_MEDIA_TYPE {
    #StructPack 8

    /**
     * Major type GUID of the stream.
     */
    majortype : Guid

    /**
     * Subtype GUID of the stream.
     */
    subtype : Guid

    /**
     * If <b>TRUE</b>, samples are of a fixed size. This field is informational only. For audio, it is generally set to <b>TRUE</b>. For video, it is usually <b>TRUE</b> for uncompressed video and <b>FALSE</b> for compressed video.
     */
    bFixedSizeSamples : BOOL

    /**
     * If <b>TRUE</b>, samples are compressed using temporal (interframe) compression. (A value of <b>TRUE</b> indicates that not all frames are key frames.) This field is informational only.
     */
    bTemporalCompression : BOOL

    /**
     * Size of the sample in bytes. For compressed data, the value can be zero.
     */
    lSampleSize : UInt32

    /**
     * GUID specifying the format type. The <b>pbFormat</b> member points to the corresponding format structure. Format types include the following.
     * 
     * <table>
     * <tr>
     * <th>Format type</th>
     * <th>Format structure</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_DvInfo"></a><a id="format_dvinfo"></a><a id="FORMAT_DVINFO"></a><dl>
     * <dt><b>FORMAT_DvInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/strmif/ns-strmif-dvinfo">DVINFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MPEG2Video"></a><a id="format_mpeg2video"></a><a id="FORMAT_MPEG2VIDEO"></a><dl>
     * <dt><b>FORMAT_MPEG2Video</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-mpeg2videoinfo">MPEG2VIDEOINFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_MPEGVideo"></a><a id="format_mpegvideo"></a><a id="FORMAT_MPEGVIDEO"></a><dl>
     * <dt><b>FORMAT_MPEGVideo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-mpeg1videoinfo">MPEG1VIDEOINFO</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_None"></a><a id="format_none"></a><a id="FORMAT_NONE"></a><dl>
     * <dt><b>FORMAT_None</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * None.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_VideoInfo"></a><a id="format_videoinfo"></a><a id="FORMAT_VIDEOINFO"></a><dl>
     * <dt><b>FORMAT_VideoInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/amvideo/ns-amvideo-videoinfoheader">VIDEOINFOHEADER</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_VideoInfo2"></a><a id="format_videoinfo2"></a><a id="FORMAT_VIDEOINFO2"></a><dl>
     * <dt><b>FORMAT_VideoInfo2</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/dvdmedia/ns-dvdmedia-videoinfoheader2">VIDEOINFOHEADER2</a>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FORMAT_WaveFormatEx"></a><a id="format_waveformatex"></a><a id="FORMAT_WAVEFORMATEX"></a><dl>
     * <dt><b>FORMAT_WaveFormatEx</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="https://docs.microsoft.com/previous-versions/dd757713(v=vs.85)">WAVEFORMATEX</a>
     * 
     * 
     * </td>
     * </tr>
     * </table>
     */
    formattype : Guid

    /**
     * Not used. Set to <b>NULL</b>.
     */
    pUnk : IUnknown

    /**
     * Size of the format block of the media type.
     */
    cbFormat : UInt32

    /**
     * Pointer to the format structure. The structure type is specified by the <b>formattype</b> member. The format structure must be present, unless <b>formattype</b> is GUID_NULL or FORMAT_None.
     */
    pbFormat : IntPtr

}
