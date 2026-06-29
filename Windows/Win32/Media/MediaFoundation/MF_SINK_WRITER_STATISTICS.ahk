#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains statistics about the performance of the sink writer.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/ns-mfreadwrite-mf_sink_writer_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MF_SINK_WRITER_STATISTICS {
    #StructPack 8

    /**
     * The size of the structure, in bytes.
     */
    cb : UInt32

    /**
     * The time stamp of the most recent sample given to the sink writer. The sink writer updates this value each time the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample">IMFSinkWriter::WriteSample</a>.
     */
    llLastTimestampReceived : Int64

    /**
     * The time stamp of the most recent sample to be encoded. The sink writer updates this value whenever it calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> on the encoder.
     */
    llLastTimestampEncoded : Int64

    /**
     * The time stamp of the most recent sample given to the media sink. The sink writer updates this value whenever it calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-processsample">IMFStreamSink::ProcessSample</a> on the media sink.
     */
    llLastTimestampProcessed : Int64

    /**
     * The time stamp of the most recent stream tick. The sink writer updates this value whenever the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick">IMFSinkWriter::SendStreamTick</a>.
     */
    llLastStreamTickReceived : Int64

    /**
     * The system time of the most recent sample request from the media sink. The sink writer updates this value whenever it receives an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkrequestsample">MEStreamSinkRequestSample</a> event from the media sink. The value is the current system time.
     */
    llLastSinkSampleRequest : Int64

    /**
     * The number of samples received.
     */
    qwNumSamplesReceived : Int64

    /**
     * The number of samples encoded.
     */
    qwNumSamplesEncoded : Int64

    /**
     * The number of samples given to the media sink.
     */
    qwNumSamplesProcessed : Int64

    /**
     * The number of stream ticks received.
     */
    qwNumStreamTicksReceived : Int64

    /**
     * The amount of data, in bytes, currently waiting to be processed.
     */
    dwByteCountQueued : UInt32

    /**
     * The total amount of data, in bytes, that has been sent to the media sink.
     */
    qwByteCountProcessed : Int64

    /**
     * The number of pending sample requests.
     */
    dwNumOutstandingSinkSampleRequests : UInt32

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the application sent samples to the sink writer.
     */
    dwAverageSampleRateReceived : UInt32

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the sink writer sent samples to the encoder.
     */
    dwAverageSampleRateEncoded : UInt32

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the sink writer sent samples to the media sink.
     */
    dwAverageSampleRateProcessed : UInt32

}
