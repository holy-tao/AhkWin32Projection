#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes the content of a video sample. These flags are used in the DXVA2_ExtendedFormat structure.
 * @remarks
 * 
  * This enumeration is equivalent to the <b>DXVA_SampleFormat</b> enumeration used in DXVA 1.0.
  * 
  * The following table shows the mapping from <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration values, which are used in Media Foundation media types, to <b>DXVA2_SampleFormat</b> values.
  * 
  * <table>
  * <tr>
  * <th>MFVideoInterlaceMode Value</th>
  * <th>DXVA2_SampleFormat Value</th>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_Unknown</td>
  * <td>DXVA2_SampleUnknown.</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_Progressive</td>
  * <td>DXVA2_SampleProgressiveFrame.</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_FieldInterleavedUpperFirst</td>
  * <td>DXVA2_SampleFieldInterleavedEvenFirst</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_FieldInterleavedLowerFirst</td>
  * <td>DXVA2_SampleFieldInterleavedOddFirst.</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_FieldSingleUpper</td>
  * <td>DXVA2_SampleFieldSingleEven.</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_FieldSingleLower</td>
  * <td>DXVA2_SampleFieldSingleOdd.</td>
  * </tr>
  * <tr>
  * <td>MFVideoInterlace_MixedInterlaceOrProgressive</td>
  * <td>No exact match. Use DXVA2_SampleFieldInterleavedEvenFirst as an initial value, then use the interlace flags from the media samples. For more information, see <a href="https://docs.microsoft.com/windows/desktop/medfound/video-interlacing">Video Interlacing</a>.</td>
  * </tr>
  * </table>
  *  
  * 
  * With the exception of MFVideoInterlace_MixedInterlaceOrProgressive, each pair of corresponding enumeration values has the same numeric value.
  * 
  * The value DXVA2_SampleSubStream has no equivalent in the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ne-mfobjects-mfvideointerlacemode">MFVideoInterlaceMode</a> enumeration.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ne-dxva2api-dxva2_sampleformat
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_SampleFormat{

    /**
     * Bitmask to validate flag values. This value is not a valid flag.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFormatMask => 255

    /**
     * Unknown format. Default to DXVA2_SampleProgressiveFrame.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleUnknown => 0

    /**
     * The sample contains a progressive (non-interlaced) frame.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleProgressiveFrame => 2

    /**
     * The sample contains two interleaved fields. The even field should be displayed first.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFieldInterleavedEvenFirst => 3

    /**
     * The sample contains two interleaved fields. The odd field should be displayed first.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFieldInterleavedOddFirst => 4

    /**
     * The sample contains a single even field.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFieldSingleEven => 5

    /**
     * The sample contains a single odd field.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleFieldSingleOdd => 6

    /**
     * The sample contains a video substream frame. Use this value for substream mixing.
     * @type {Integer (Int32)}
     */
    static DXVA2_SampleSubStream => 7
}
