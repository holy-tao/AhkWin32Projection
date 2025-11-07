#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about an output buffer for a Media Foundation transform. This structure is used in the IMFTransform::ProcessOutput method.
 * @remarks
 * 
 * You must provide an <b>MFT_OUTPUT_DATA_BUFFER</b> structure for each selected output stream.
 * 
 * MFTs can support two different allocation models for output samples:
 * 
 * <ul>
 * <li>The MFT allocates the output sample.
 *           </li>
 * <li>The client allocates the output sample.
 *           </li>
 * </ul>
 * To find which model the MFT supports for a given output stream, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a> and check the value of <b>dwFlags</b>.
 * 
 * <table>
 * <tr>
 * <th>Flag</th>
 * <th>Allocation Model</th>
 * </tr>
 * <tr>
 * <td>MFT_OUTPUT_STREAM_PROVIDES_SAMPLES</td>
 * <td>The MFT allocates the output samples for the stream. Set <b>pSample</b> to <b>NULL</b> for this stream.</td>
 * </tr>
 * <tr>
 * <td>MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES</td>
 * <td>The MFT supports both allocation models.</td>
 * </tr>
 * <tr>
 * <td>Neither (default)</td>
 * <td>The client must allocate the output samples for the stream.</td>
 * </tr>
 * </table>
 *  
 * 
 * The behavior of <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> depends on the initial value of <b>pSample</b> and the value of the <i>dwFlags</i> parameter in the <b>ProcessOutput</b> method.
 * 
 * <ul>
 * <li>
 * If <b>pSample</b> is <b>NULL</b> and <i>dwFlags</i> contains the MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER flag, the MFT discards the output data.
 * 
 * Restriction: This output stream must have the MFT_OUTPUT_STREAM_DISCARDABLE or MFT_OUTPUT_STREAM_LAZY_READ flag. (To get the flags for the output stream, call the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputstreaminfo">IMFTransform::GetOutputStreamInfo</a> method.)
 * 
 * </li>
 * <li>
 * If <b>pSample</b> is <b>NULL</b> and <i>dwFlags</i> does not contain the MFT_PROCESS_OUTPUT_DISCARD_WHEN_NO_BUFFER, the MFT provides a sample for the output data. The MFT sets <b>pSample</b> to point to the sample that it provides. The MFT can either allocate a new sample or re-use an input sample.
 * 
 * Restriction: This output stream must have the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES or MFT_OUTPUT_STREAM_CAN_PROVIDE_SAMPLES flag.
 * 
 * </li>
 * <li>
 * If <b>pSample</b> is non-<b>NULL</b>, the MFT uses the sample provided by the caller.
 * 
 * Restriction: This output stream must not have the MFT_OUTPUT_STREAM_PROVIDES_SAMPLES flag.
 * 
 * </li>
 * </ul>
 * Any other combinations are invalid and cause <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> to return E_INVALIDARG.
 * 
 * Each call to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> can produce zero or more events and up to one sample per output stream.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ns-mftransform-mft_output_data_buffer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFT_OUTPUT_DATA_BUFFER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Output stream identifier. Before calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>, set this member to a valid stream identifier.
     * 
     * Exception: If the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a> method returns E_NOTIMPL, the MFT ignores this member and uses the indexes of the <i>pOutputSamples</i> array in the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method as the stream identifiers. In other words, it uses the first element in the array for stream 0, the second for stream 1, and so forth. It is recommended (but not required) that the caller set <b>dwStreamID</b> equal to the array index in this case.
     * @type {Integer}
     */
    dwStreamID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface. Before calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>, set this member equal to a valid <b>IMFSample</b> pointer or <b>NULL</b>. See Remarks for more information.
     * @type {IMFSample}
     */
    pSample {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Before calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>, set this member to zero. When the method returns, the MFT might set the member equal to a value from the <a href="https://docs.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_data_buffer_flags">_MFT_OUTPUT_DATA_BUFFER_FLAGS</a> enumeration. Otherwise, the MFT leaves this member equal to zero.
     * @type {Integer}
     */
    dwStatus {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Before calling <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a>, set this member to <b>NULL</b>. On output, the MFT might set this member to a valid <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfcollection">IMFCollection</a> interface pointer. The pointer represents a collecton that contains zero or more events. To get each event, call <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nf-mfobjects-imfcollection-getelement">IMFCollection::GetElement</a> and query the returned <b>IUnknown</b> pointer for the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediaevent">IMFMediaEvent</a> interface. When the <b>ProcessOutput</b> method returns, the caller is responsible for releasing the <b>IMFCollection</b> pointer if the pointer is not <b>NULL</b>.
     * @type {IMFCollection}
     */
    pEvents {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
