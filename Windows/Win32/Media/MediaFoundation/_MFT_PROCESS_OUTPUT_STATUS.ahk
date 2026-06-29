#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the status of a call to IMFTransform::ProcessOutput.
 * @remarks
 * If the MFT sets this flag, the <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> method returns MF_E_TRANSFORM_STREAM_CHANGE and no output data is produced. The client should respond as follows:
 * 
 * <ol>
 * <li>
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamcount">IMFTransform::GetStreamCount</a> to get the new number of streams.
 * 
 * </li>
 * <li>
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getstreamids">IMFTransform::GetStreamIDs</a> to get the new stream identifiers.
 * 
 * </li>
 * <li>
 * Call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-getoutputavailabletype">IMFTransform::GetOutputAvailableType</a> and <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-setoutputtype">IMFTransform::SetOutputType</a> to set the media types on the new streams.
 * 
 * </li>
 * </ol>
 * Until these steps are completed, all further calls to <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">ProcessOutput</a> return MF_E_TRANSFORM_STREAM_CHANGE.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_process_output_status
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_PROCESS_OUTPUT_STATUS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The Media Foundation transform (MFT) has created one or more new output streams.
     * @type {Integer (Int32)}
     */
    static MFT_PROCESS_OUTPUT_STATUS_NEW_STREAMS => 256
}
