#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterSink.ahk
#Include .\WM_WRITER_STATISTICS.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterAdvanced interface provides advanced writing functionality.This interface exists for every instance of the writer object. To obtain a pointer to this interface, call QueryInterface on the writer object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmwriteradvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406be3-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSinkCount", "GetSink", "AddSink", "RemoveSink", "WriteStreamSample", "SetLiveSource", "IsRealTime", "GetWriterTime", "GetStatistics", "SetSyncTolerance", "GetSyncTolerance"]

    /**
     * The GetSinkCount method retrieves the number of writer sinks associated with the writer object.
     * @remarks
     * If you specify a file by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename">IWMWriter::SetOutputFilename</a>, the writer object will automatically create a file sink and add it to the writer. That sink will be included in the count retrieved by this method.
     * @returns {Integer} DWORD indicating the total number of sinks associated with the writer object.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsinkcount
     */
    GetSinkCount() {
        result := ComCall(3, this, "uint*", &pcSinks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcSinks
    }

    /**
     * The GetSink method retrieves a writer sink object. Used in conjunction with IWMWriterAdvanced::GetSinkCount, this method can be used to enumerate the sinks associated with a writer object.
     * @remarks
     * You can use <b>GetSink</b> to gain access to the file sink that is automatically created when you call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename">IWMWriter::SetOutputFilename</a>. If you are only writing to the automatically created file sink, it will always be sink number 0.
     * @param {Integer} dwSinkNum <b>DWORD</b> containing the sink number (its index). This is a number between 0 and one less than the total number of sinks associated with the file as obtained with <b>IWMWriterAdvanced::GetSinkCount</b>.
     * @returns {IWMWriterSink} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwritersink">IWMWriterSink</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsink
     */
    GetSink(dwSinkNum) {
        result := ComCall(4, this, "uint", dwSinkNum, "ptr*", &ppSink := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMWriterSink(ppSink)
    }

    /**
     * The AddSink method adds a writer sink to receive writer output. The Windows Media Format SDK supports file sinks, which create ASF files on disk; network sinks, which stream ASF content across a network; and push sinks, which deliver ASF content to other media servers. To create a sink object, call one of the following functions:\_
     * @remarks
     * If you only need to write to a single file, you can let the writer object handle the creation and management of a default file sink. To use a default file sink, pass a file name to the writer by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-setoutputfilename">IWMWriter::SetOutputFilename</a>.
     * @param {IWMWriterSink} pSink Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwritersink">IWMWriterSink</a> interface.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pSink</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not in a configurable state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-addsink
     */
    AddSink(pSink) {
        result := ComCall(5, this, "ptr", pSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The RemoveSink method removes a writer sink object.
     * @param {IWMWriterSink} pSink Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwritersink">IWMWriterSink</a> interface of the sink object to remove, or <b>NULL</b> to remove all sinks.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not remove the specified sink.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer is not in a configurable state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-removesink
     */
    RemoveSink(pSink) {
        result := ComCall(6, this, "ptr", pSink, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The WriteStreamSample method writes a stream sample directly into an ASF file, bypassing the normal compression procedures.
     * @remarks
     * You must manually set the WM_SF_CLEANPOINT flag for every video key frame. If you do not specify the key frames, it will not be readable. The first video sample delivered by the reading object is the first sample marked as a clean point.
     * 
     * When reading a stream created using stream samples, the reader and synchronous reader objects set the WM_SF_DISCONTINUITY flag for the first sample in the stream.
     * 
     * Normally the application provides samples to an input file on the <b>IWMWriter</b> interface, and the samples are then compressed. However, the application can use this interface to put the samples directly into the file, without compressing or otherwise modifying them.
     * 
     * If the output stream has a time code data unit extension and there is no time code extension on the sample, this method will fail in order not to cause problems later when the file is indexed. All other data unit extensions are optional on the sample. That means that this method will succeed if a data unit extension has been specified for the stream but no actual data extension is present in the sample. <b>WriteStreamSample</b> will write zeros into the file for samples that do not have extensions specified on the sample.
     * 
     * You can use both <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-writesample">IWMWriter::WriteSample</a> and <b>WriteStreamSample</b> to write uncompressed samples and compressed samples to the same stream. However, problems can arise because the writer cannot accurately gauge the bit rate and buffer window usage for the stream samples. Some samples may be dropped as a result.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @param {Integer} cnsSampleTime <b>QWORD</b> containing the sample time, in 100-nanosecond units.
     * @param {Integer} msSampleSendTime <b>DWORD</b> containing the sample send time, in milliseconds. This parameter is not used.
     * @param {Integer} cnsSampleDuration <b>QWORD</b> containing the sample duration, in 100-nanosecond units. This parameter is not used.
     * @param {Integer} dwFlags <b>DWORD</b> containing one or more of the following flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>No flag set</td>
     * <td>None of the conditions for the other flags applies. For example, a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">delta frame</a> in most cases would not have any flags set for it.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_CLEANPOINT</td>
     * <td>Indicates the sample is a key frame. Set this flag if and only if the compressed input sample is a key frame.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>For audio inputs, this flag helps to deal with gaps that may appear between samples. You should set this flag for the first sample after a gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>This flag is not used by the writer object.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface representing the sample.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The writer cannot currently be run.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sample is not valid. This can occur when an input script stream contains a script sample that is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-writestreamsample
     */
    WriteStreamSample(wStreamNum, cnsSampleTime, msSampleSendTime, cnsSampleDuration, dwFlags, pSample) {
        result := ComCall(7, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", msSampleSendTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetLiveSource method sets a flag indicating whether the source is live.
     * @remarks
     * The default is False. To handle incoming samples correctly, the writer object must be notified whether the source is live.
     * @param {BOOL} fIsLiveSource Boolean value that is True if the source is live.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setlivesource
     */
    SetLiveSource(fIsLiveSource) {
        result := ComCall(8, this, "int", fIsLiveSource, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsRealTime method ascertains whether the writer is running in real time.
     * @remarks
     * If the writer is running in real time, the application can get the current time from it.
     * 
     * By default, the writer does not run in real time.
     * @returns {BOOL} Pointer to a Boolean value that is True if the writer is running in real time.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-isrealtime
     */
    IsRealTime() {
        result := ComCall(9, this, "int*", &pfRealTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfRealTime
    }

    /**
     * The GetWriterTime method retrieves the clock time that the writer is working to.
     * @remarks
     * This method returns the largest time stamp that the writer can currently process. This time stamp will increase as data is produced by the writer. This method can be used to ensure that data is delivered to the writer at the proper rate.
     * 
     * The time returned is the number of 100-nanosecond units since the call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a>.
     * 
     * The writer can be running in real time. Call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-isrealtime">IWMWriterAdvanced::IsRealTime</a> method to ascertain whether this is true.
     * @returns {Integer} Pointer to a variable containing the current time in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getwritertime
     */
    GetWriterTime() {
        result := ComCall(10, this, "uint*", &pcnsCurrentTime := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcnsCurrentTime
    }

    /**
     * The GetStatistics method retrieves statistics describing the current writing operation.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers must be in the range of 1 through 63. A value of 0 retrieves statistics for the file as a whole.
     * @returns {WM_WRITER_STATISTICS} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_writer_statistics">WM_WRITER_STATISTICS</a> structure that receives the statistics.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getstatistics
     */
    GetStatistics(wStreamNum) {
        pStats := WM_WRITER_STATISTICS()
        result := ComCall(11, this, "ushort", wStreamNum, "ptr", pStats, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pStats
    }

    /**
     * The SetSyncTolerance method sets the amount of time that the inputs can fall out of synchronization before the samples are discarded.
     * @remarks
     * The default tolerance value is 3000 milliseconds.
     * 
     * Regardless of what the tolerance is set to, keeping samples as tightly synchronized as possible results in the best performance and the highest-quality content.
     * @param {Integer} msWindow Amount of time that the inputs can be out of synchronization, in milliseconds. Note that this parameter is in milliseconds and not 100-nanosecond units.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-setsynctolerance
     */
    SetSyncTolerance(msWindow) {
        result := ComCall(12, this, "uint", msWindow, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetSyncTolerance method retrieves the amount of time during which the inputs can fall out of synchronization before the samples are discarded.
     * @remarks
     * The default tolerance is 3000 milliseconds.
     * @returns {Integer} Pointer to the limit of the number of milliseconds that the inputs can be out of synchronization. Note that this parameter is in milliseconds and not 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriteradvanced-getsynctolerance
     */
    GetSyncTolerance() {
        result := ComCall(13, this, "uint*", &pmsWindow := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pmsWindow
    }
}
