#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains statistics about the performance of the sink writer.
 * @see https://learn.microsoft.com/windows/win32/api/mfreadwrite/ns-mfreadwrite-mf_sink_writer_statistics
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MF_SINK_WRITER_STATISTICS extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The time stamp of the most recent sample given to the sink writer. The sink writer updates this value each time the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-writesample">IMFSinkWriter::WriteSample</a>.
     * @type {Integer}
     */
    llLastTimestampReceived {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The time stamp of the most recent sample to be encoded. The sink writer updates this value whenever it calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a> on the encoder.
     * @type {Integer}
     */
    llLastTimestampEncoded {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The time stamp of the most recent sample given to the media sink. The sink writer updates this value whenever it calls <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfstreamsink-processsample">IMFStreamSink::ProcessSample</a> on the media sink.
     * @type {Integer}
     */
    llLastTimestampProcessed {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The time stamp of the most recent stream tick. The sink writer updates this value whenever the application calls <a href="https://docs.microsoft.com/windows/desktop/api/mfreadwrite/nf-mfreadwrite-imfsinkwriter-sendstreamtick">IMFSinkWriter::SendStreamTick</a>.
     * @type {Integer}
     */
    llLastStreamTickReceived {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The system time of the most recent sample request from the media sink. The sink writer updates this value whenever it receives an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamsinkrequestsample">MEStreamSinkRequestSample</a> event from the media sink. The value is the current system time.
     * @type {Integer}
     */
    llLastSinkSampleRequest {
        get => NumGet(this, 40, "int64")
        set => NumPut("int64", value, this, 40)
    }

    /**
     * The number of samples received.
     * @type {Integer}
     */
    qwNumSamplesReceived {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of samples encoded.
     * @type {Integer}
     */
    qwNumSamplesEncoded {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * The number of samples given to the media sink.
     * @type {Integer}
     */
    qwNumSamplesProcessed {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * The number of stream ticks received.
     * @type {Integer}
     */
    qwNumStreamTicksReceived {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * The amount of data, in bytes, currently waiting to be processed.
     * @type {Integer}
     */
    dwByteCountQueued {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * The total amount of data, in bytes, that has been sent to the media sink.
     * @type {Integer}
     */
    qwByteCountProcessed {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * The number of pending sample requests.
     * @type {Integer}
     */
    dwNumOutstandingSinkSampleRequests {
        get => NumGet(this, 96, "uint")
        set => NumPut("uint", value, this, 96)
    }

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the application sent samples to the sink writer.
     * @type {Integer}
     */
    dwAverageSampleRateReceived {
        get => NumGet(this, 100, "uint")
        set => NumPut("uint", value, this, 100)
    }

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the sink writer sent samples to the encoder.
     * @type {Integer}
     */
    dwAverageSampleRateEncoded {
        get => NumGet(this, 104, "uint")
        set => NumPut("uint", value, this, 104)
    }

    /**
     * The average rate, in media samples per 100-nanoseconds, at which the sink writer sent samples to the media sink.
     * @type {Integer}
     */
    dwAverageSampleRateProcessed {
        get => NumGet(this, 108, "uint")
        set => NumPut("uint", value, this, 108)
    }
}
