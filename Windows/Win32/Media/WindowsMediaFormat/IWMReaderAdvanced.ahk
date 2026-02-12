#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A call to QueryInterface from a reader object exposes the advanced functionality described in this section.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmreaderadvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406bea-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetUserProvidedClock", "GetUserProvidedClock", "DeliverTime", "SetManualStreamSelection", "GetManualStreamSelection", "SetStreamsSelected", "GetStreamSelected", "SetReceiveSelectionCallbacks", "GetReceiveSelectionCallbacks", "SetReceiveStreamSamples", "GetReceiveStreamSamples", "SetAllocateForOutput", "GetAllocateForOutput", "SetAllocateForStream", "GetAllocateForStream", "GetStatistics", "SetClientInfo", "GetMaxOutputSampleSize", "GetMaxStreamSampleSize", "NotifyLateDelivery"]

    /**
     * The SetUserProvidedClock method specifies whether a clock provided by the application is to be used.
     * @remarks
     * In some cases, an application built on this SDK requires the clock to be driven by the application rather than by real time. This is true, for example, if the application reads from a file at a rate faster than it takes to play the file. User-provided clocks are only supported when the source file is a local file.
     * 
     * This method can fail if the current source does not support user-provided clocks. To drive a clock, an application must call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-delivertime">DeliverTime</a>, and then wait for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-ontime">IWMReaderCallbackAdvanced::OnTime</a> to reach the time specified.
     * @param {BOOL} fUserClock Boolean value that is True if an application-provided clock is to be used.
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
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reader is not properly configured to handle this request.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to set an internal event.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setuserprovidedclock
     */
    SetUserProvidedClock(fUserClock) {
        result := ComCall(3, this, "int", fUserClock, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetUserProvidedClock method ascertains whether a user-provided clock has been specified.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if a user-provided clock has been specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getuserprovidedclock
     */
    GetUserProvidedClock() {
        result := ComCall(4, this, "int*", &pfUserClock := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfUserClock
    }

    /**
     * The DeliverTime method provides the reader with a clock time. Use this method only when the application is providing the clock.
     * @remarks
     * Before making the first call to this method, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setuserprovidedclock">IWMReaderAdvanced::SetUserProvidedClock</a> method with the value <b>TRUE</b>, to specify that the application is providing the clock. Otherwise, the <b>DeliverTime</b> method returns E_UNEXPECTED.
     * 
     * After <b>DeliverTime</b> is called, the reader reads data as fast as possible until it reaches the specified time. When the reader reaches that time, it calls <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-ontime">IWMReaderCallbackAdvanced::OnTime</a>, and then sends samples to the callback.
     * 
     * In general, the value of <i>cnsTime</i> should increase each time the method is called (that is, the clock should run forward). However, sometimes it may be possible to pass a smaller value. The <b>DeliverTime</b> method is asynchronous, meaning the reader object reads the data on another thread. The application can specify a smaller time value only if the reader object has not reached that point in the file. For example, if the application calls <b>DeliverTime</b> with the value 100 seconds, and immediately calls it again with the value 50 seconds, the call would probably succeed, because the reader object will not reach the 50-second point in the file. However, you cannot be sure the call will succeed in this case, because the application does not control the reader's thread.
     * @param {Integer} cnsTime The time, in 100-nanosecond units.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-delivertime
     */
    DeliverTime(cnsTime) {
        result := ComCall(5, this, "uint", cnsTime, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetManualStreamSelection method specifies whether stream selection is to be controlled manually.
     * @remarks
     * When you call this method to enable manual stream selection, all streams in the file are selected. To select specific streams, pass an array of the desired stream numbers to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setstreamsselected">IWMReaderAdvanced::SetStreamsSelected</a> method.
     * 
     * When manual stream selection is enabled, you can manage the selected streams using <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getstreamselected">GetStreamSelected</a> and <b>SetStreamsSelected</b>.
     * 
     * Stream numbers are in the range of 1 through 63.
     * @param {BOOL} fSelection Boolean value that is True if manual selection is specified.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setmanualstreamselection
     */
    SetManualStreamSelection(fSelection) {
        result := ComCall(6, this, "int", fSelection, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetManualStreamSelection method ascertains whether manual stream selection has been specified.
     * @returns {BOOL} Pointer to a Boolean value that is True if manual selection has been specified.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmanualstreamselection
     */
    GetManualStreamSelection() {
        result := ComCall(7, this, "int*", &pfSelection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfSelection
    }

    /**
     * The SetStreamsSelected method specifies which streams are selected when manual stream selection is enabled.
     * @remarks
     * This method enables the selected state of multiple streams to be changed simultaneously. Multiple streams can then be turned on or off at the exact time required. For this reason, the parameters of this method and the <b>GetStreamSelected</b> method are not identical.
     * 
     * When selecting streams manually, you should select only one stream at a time from each set of mutually exclusive streams in a file. The SDK does not prevent you from selecting multiple mutually exclusive streams, but the samples for all mutually exclusive streams will be delivered to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallback-onsample">IWMReaderCallback::OnSample</a> using the same output number. This makes it difficult to differentiate between samples from the various streams.
     * 
     * To deliver samples by stream number, you must receive uncompressed stream samples. You can receive stream samples for a specific stream by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setreceivestreamsamples">IWMReaderAdvanced::SetReceiveStreamSamples</a>. You must also implement <b>IWMReaderCallbackAdvanced::OnStreamSample</b>.
     * @param {Integer} cStreamCount <b>WORD</b> containing the count of stream numbers in the <i>pwStreamNumbers</i> array.
     * @param {Pointer<Integer>} pwStreamNumbers Pointer to an array containing the stream numbers. Stream numbers are in the range of 1 through 63.
     * @param {Pointer<Integer>} pSelections Pointer to an array, of equal length to <i>pwStreamNumbers</i>, with each entry containing one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection">WMT_STREAM_SELECTION</a> enumeration type.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setstreamsselected
     */
    SetStreamsSelected(cStreamCount, pwStreamNumbers, pSelections) {
        pwStreamNumbersMarshal := pwStreamNumbers is VarRef ? "ushort*" : "ptr"
        pSelectionsMarshal := pSelections is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, "ushort", cStreamCount, pwStreamNumbersMarshal, pwStreamNumbers, pSelectionsMarshal, pSelections, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetStreamSelected method ascertains whether a particular stream is currently selected. This method can be used only when manual stream selection has been specified.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {Integer} Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection">WMT_STREAM_SELECTION</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getstreamselected
     */
    GetStreamSelected(wStreamNum) {
        result := ComCall(9, this, "ushort", wStreamNum, "int*", &pSelection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pSelection
    }

    /**
     * The SetReceiveSelectionCallbacks method specifies whether stream selection notifications must be sent to IWMReaderCallbackAdvanced::OnStreamSelection.
     * @param {BOOL} fGetCallbacks Boolean value that is True if stream selections must generate callbacks.
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
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No callback interface has been specified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setreceiveselectioncallbacks
     */
    SetReceiveSelectionCallbacks(fGetCallbacks) {
        result := ComCall(10, this, "int", fGetCallbacks, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetReceiveSelectionCallbacks method ascertains whether the option to receive stream selection notifications has been enabled.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if stream selection notifications are sent to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamselection">IWMReaderCallbackAdvanced::OnStreamSelection</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getreceiveselectioncallbacks
     */
    GetReceiveSelectionCallbacks() {
        result := ComCall(11, this, "int*", &pfGetCallbacks := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfGetCallbacks
    }

    /**
     * The SetReceiveStreamSamples method specifies whether stream samples are delivered to the IWMReaderCallbackAdvanced::OnStreamSample callback.
     * @remarks
     * Stream samples are samples received directly from the source file, and are not decompressed. If you receive compressed samples, you must either keep them compressed, or decompress them with your application. The Windows Media Format SDK does not provide methods to decompress samples once they have been removed from a file.
     * 
     * The application can register itself to receive samples directly from the Windows Media streams rather than letting the reader decompress them first. To do this, the object implementing <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallback">IWMReaderCallback</a> (supplied by the application) must support <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallbackadvanced">IWMReaderCallbackAdvanced</a>. To determine which streams are in an ASF file, and what their stream numbers are, call <b>QueryInterface</b> using the reader object to access the <a href="https://docs.microsoft.com/windows/desktop/wmformat/iwmprofile">IWMProfile</a> interface, and examine the streams in the profile.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @param {BOOL} fReceiveStreamSamples Boolean value that is True if stream samples are delivered.
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
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for an unspecified reason.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No callback interface has been specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_PROTECTED_CONTENT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Attempted read on a file protected by <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">DRM</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setreceivestreamsamples
     */
    SetReceiveStreamSamples(wStreamNum, fReceiveStreamSamples) {
        result := ComCall(12, this, "ushort", wStreamNum, "int", fReceiveStreamSamples, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetReceiveStreamSamples method ascertains whether stream samples are delivered to the IWMReaderCallbackAdvanced::OnStreamSample call.
     * @remarks
     * Stream samples are samples received directly from the source file, and are not decompressed. If you receive compressed samples, you must either keep them compressed, or decompress them with your application. The Windows Media Format SDK does not provide methods to decompress samples once they have been removed from a file.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if stream samples are delivered to <b>OnStreamSample</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getreceivestreamsamples
     */
    GetReceiveStreamSamples(wStreamNum) {
        result := ComCall(13, this, "ushort", wStreamNum, "int*", &pfReceiveStreamSamples := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfReceiveStreamSamples
    }

    /**
     * The SetAllocateForOutput method specifies whether the reader allocates its own buffers for output samples or gets buffers from your application.
     * @remarks
     * You can allocate your own buffers for file reading to reduce the overhead required by the reader object to allocate a new buffer for every sample. The reader object will make calls to the <b>IWMReaderCallbackAdvanced::AllocateForOutput</b> method.
     * 
     * If the application's callback implements the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface, the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforoutputex">AllocateForOutputEx</a> method is called instead of <b>AllocateForOutput</b>.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {BOOL} fAllocate Boolean value that is True if the reader gets buffers from your application.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setallocateforoutput
     */
    SetAllocateForOutput(dwOutputNum, fAllocate) {
        result := ComCall(14, this, "uint", dwOutputNum, "int", fAllocate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAllocateForOutput method ascertains whether the reader is configured to use the IWMReaderCallbackAdvanced interface to allocate samples delivered by the IWMReaderCallback::OnSample callback.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the identifying number of the output media stream.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if the reader uses <b>IWMReaderCallbackAdvanced</b> to allocate samples.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getallocateforoutput
     */
    GetAllocateForOutput(dwOutputNum) {
        result := ComCall(15, this, "uint", dwOutputNum, "int*", &pfAllocate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAllocate
    }

    /**
     * The SetAllocateForStream method specifies whether the reader uses IWMReaderCallbackAdvanced::AllocateForStream to allocate buffers for stream samples.
     * @remarks
     * If the application's callback implements the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreaderallocatorex">IWMReaderAllocatorEx</a> interface interface, the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderallocatorex-allocateforstreamex">AllocateForStreamEx</a> method is called instead of <b>AllocateForStream</b>.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number. Stream numbers are in the range of 1 through 63.
     * @param {BOOL} fAllocate Boolean value that is True if the reader uses <b>IWMReaderCallbackAdvanced</b> to allocate streams.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setallocateforstream
     */
    SetAllocateForStream(wStreamNum, fAllocate) {
        result := ComCall(16, this, "ushort", wStreamNum, "int", fAllocate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAllocateForStream method ascertains whether the reader is configured to use IWMReaderCallbackAdvanced to allocate stream samples delivered by the IWMReaderCallbackAdvanced::OnStreamSample callback.
     * @remarks
     * Stream numbers are in the range of 1 through 63.
     * @param {Integer} dwSreamNum <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if the reader uses <b>IWMReaderCallbackAdvanced</b> to allocate samples.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getallocateforstream
     */
    GetAllocateForStream(dwSreamNum) {
        result := ComCall(17, this, "ushort", dwSreamNum, "int*", &pfAllocate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAllocate
    }

    /**
     * The GetStatistics method retrieves the current reader statistics.
     * @remarks
     * The <b>WM_READER_STATISTICS</b> structure must be supplied by the application. The <b>cbSize</b> data member must be set before the structure is passed to the method. The rest of the members will be set by this method.
     * 
     * As with any method, too many calls can affect performance. The actual performance impact is machine-dependent. Using the <b>GetStatistics</b> method for each sample is not recommended. The Microsoft Windows Media Encoder pulls the data once per second, which results in a manageable amount of data being passed.
     * 
     * The <b>GetStatistics</b> method is not recommended for a callback method like <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallback-onsample">IWMReaderCallback::OnSample</a>. In general, such calls have the potential to lead to deadlocks.
     * 
     * To determine the connection bandwidth before receiving a sample, the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getconnectionbandwidth">IWMReaderNetworkConfig::GetConnectionBandwidth</a> method is the recommended method. The <b>GetStatistics</b> method has more overhead.
     * @param {Pointer<WM_READER_STATISTICS>} pStatistics Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_reader_statistics">WM_READER_STATISTICS</a> structure.
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
     * <i>pStatistics</i> is <b>NULL</b>, or the <b>cbSize</b> member of <i>pStatistics</i> is not set to the size of <b>WM_READER_STATISTICS</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate memory for an internal object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The reader object has not opened a file yet.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getstatistics
     */
    GetStatistics(pStatistics) {
        result := ComCall(18, this, "ptr", pStatistics, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetClientInfo method sets client-side information used for logging.
     * @remarks
     * Initialize the <b>WM_READER_CLIENTINFO</b> structure before calling this method. Always set the <b>cbSize</b> member equal to the size of the structure, and set any unused fields to zero.
     * 
     * 
     * ```cpp
     * 
     * WM_READER_CLIENTINFO info;
     * ZeroMemory(&info, sizeof(WM_READER_CLIENTINFO));
     * info.cbSize = sizeof(WM_READER_CLIENTINFO);
     * 
     * // Set other fields (not shown).
     * 
     * hr = pReaderAdvanced->SetClientInfo( &info );
     * 
     * ```
     * @param {Pointer<WM_READER_CLIENTINFO>} pClientInfo Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_reader_clientinfo">WM_READER_CLIENTINFO</a> structure allocated by the caller, which contains information about the client.
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
     * Invalid argument. The <b>cbSize</b> member must be set, and the string values must not exceed 1024 characters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setclientinfo
     */
    SetClientInfo(pClientInfo) {
        result := ComCall(19, this, "ptr", pClientInfo, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetMaxOutputSampleSize method retrieves the maximum buffer size to be allocated for output samples for a specified media stream.
     * @param {Integer} dwOutput <b>DWORD</b> specifying the output media stream.
     * @returns {Integer} Pointer to the maximum buffer size to be allocated.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmaxoutputsamplesize
     */
    GetMaxOutputSampleSize(dwOutput) {
        result := ComCall(20, this, "uint", dwOutput, "uint*", &pcbMax := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbMax
    }

    /**
     * The GetMaxStreamSampleSize method retrieves the maximum buffer size to be allocated for stream samples for a specified media stream.
     * @param {Integer} wStream Stream number.
     * @returns {Integer} Pointer to the maximum buffer size to be allocated.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-getmaxstreamsamplesize
     */
    GetMaxStreamSampleSize(wStream) {
        result := ComCall(21, this, "ushort", wStream, "uint*", &pcbMax := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcbMax
    }

    /**
     * The NotifyLateDelivery method is used to notify the reader that it is delivering data to the application too slowly.
     * @param {Integer} cnsLateness <b>QWORD</b> indicating how late the data is, in 100-nanosecond units.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-notifylatedelivery
     */
    NotifyLateDelivery(cnsLateness) {
        result := ComCall(22, this, "uint", cnsLateness, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
