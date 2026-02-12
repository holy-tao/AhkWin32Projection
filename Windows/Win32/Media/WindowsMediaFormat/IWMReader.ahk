#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMOutputMediaProps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReader interface is used to open, close, start, pause, resume, and unlock the WMReader object.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmreader
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReader extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReader
     * @type {Guid}
     */
    static IID => Guid("{96406bd6-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Open", "Close", "GetOutputCount", "GetOutputProps", "SetOutputProps", "GetOutputFormatCount", "GetOutputFormat", "Start", "Stop", "Pause", "Resume"]

    /**
     * The Open method opens an ASF file for reading.
     * @remarks
     * This method is asynchronous; it returns very quickly and sends a WMT_OPENED status notification to the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method when the file is opened and ready for use.
     * 
     * Because the method returns before the file is opened, a return value of S_OK does not necessarily mean that the file has been opened successfully. To ascertain the success of the call, you must check the value of of the <i>hr</i> parameter of <b>OnStatus</b> when the WMT_OPENED notification is received.
     * 
     * If <i>hr</i> equals NS_E_NO_STREAM it means that the header is not yet available, and that a WMT_SOURCE_SWITCH event will be sent as soon as the header becomes available. No WMT_EOF will be sent before the WMT_SOURCE_SWITCH.
     * 
     * Applications that read files from behind a firewall will have better performance when opening files if the address is specified using the domain name server (DNS) name instead of the IP address.
     * @param {PWSTR} pwszURL Pointer to a wide-character <b>null</b>-terminated string containing the path and name of the file to be opened. This method accepts a path to a folder on a local machine, a path to a network share, or a uniform resource locator (URL).
     * @param {IWMReaderCallback} pCallback Pointer to the object that implements the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallback">IWMReaderCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This is passed to the application in calls to <b>OnStatus</b>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pCallback</i> parameter is <b>NULL</b>.
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
     * There is not enough available memory.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-open
     */
    Open(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Close method deletes all outputs on the reader and releases the file resources.
     * @remarks
     * This method sends a WMT_CLOSE status notification to the application's <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmstatuscallback-onstatus">IWMStatusCallback::OnStatus</a> method.
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
     * The file is already closed
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-close
     */
    Close() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetOutputCount method retrieves the number of uncompressed media streams that will be delivered for the file loaded in the reader.
     * @remarks
     * A file with mutually exclusive streams contains several streams that are delivered to the same output. But only one of those streams can be delivered at a time during playback. When reading a file, you can identify its outputs by looping through the outputs and getting the media properties of each by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputprops">IWMReader::GetOutputProps</a>.
     * 
     * This method is synchronous and does not result in any messages being sent to the status callback.
     * @returns {Integer} Pointer to a count of outputs.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputcount
     */
    GetOutputCount() {
        result := ComCall(5, this, "uint*", &pcOutputs := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcOutputs
    }

    /**
     * The GetOutputProps method retrieves the current properties of an uncompressed output stream.
     * @remarks
     * The Windows Media codecs can deliver media samples for a stream in a number of formats. For example, the Windows Media Video 9 codec can deliver samples as bitmapped images or as <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">YUV</a> images with varying properties to suit your needs. When you load a file the output properties are set to the default for compressed media type in the stream associated with the output. You can examine the possible output formats by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformatcount">IWMReader::GetOutputFormatCount</a> to get the total number of possible formats and then calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformat">IWMReader::GetOutputFormat</a> for each.
     * 
     * This method is synchronous and does not result in any messages being sent to the status callback.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @returns {IWMOutputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface. This interface belongs to an output media properties object created by a successful call to this method. Any changes made to the output media properties object will have no effect on the output of the reader unless you pass this interface in a call to <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-setoutputprops">IWMReader::SetOutputProps</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputprops
     */
    GetOutputProps(dwOutputNum) {
        result := ComCall(6, this, "uint", dwOutputNum, "ptr*", &ppOutput := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMOutputMediaProps(ppOutput)
    }

    /**
     * The SetOutputProps method specifies the media properties of an uncompressed output stream.
     * @remarks
     * Manipulating an object retrieved by a call to <b>GetOutputProps</b> has no effect on the output media stream unless the application also calls <b>SetOutputProps</b>.
     * 
     * DirectX VA formats can be returned from <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmsyncreader-getoutputformat">GetOutputFormat</a>, but if they are passed in to <b>SetOutputProps</b>, that method will fail because DirectX VA formats cannot be specified in this way. Therefore, your code should either examine the format before passing it to <b>SetOutputProps</b>, or handle the case of that method failing by attempting the next format enumerated from <b>GetOutputFormat</b>. For a code snippet showing how to identify a DirectX VA format, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/enabling-directx-video-acceleration">Enabling DirectX Video Acceleration</a>
     * 
     * 
     * If this method is called while the reader is running, an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onoutputpropschanged">IWMReaderCallbackAdvanced::OnOutputPropsChanged</a> call is generated.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {IWMOutputMediaProps} pOutput Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface.
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
     * The <i>dwOutputNum</i> parameter is greater than the number of output streams.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-setoutputprops
     */
    SetOutputProps(dwOutputNum, pOutput) {
        result := ComCall(7, this, "uint", dwOutputNum, "ptr", pOutput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetOutputFormatCount method is used for determining all possible format types supported by this output media stream on the reader.
     * @remarks
     * The number of formats that can be delivered on output is determined by the decoding codec. The Windows Media codecs can deliver media samples for a stream in a number of formats. For example, the Windows Media Video 9 codec can deliver samples as bitmapped images or as <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">YUV</a> images with varying properties to suit your needs.
     * 
     * Every compressed media type has a default output format determined by the codec. You can obtain the properties of the default output format by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputprops">IWMReader::GetOutputProps</a>.
     * 
     * This method is synchronous and does not result in any messages being sent to the status callback.
     * @param {Integer} dwOutputNumber <b>DWORD</b> containing the output number.
     * @returns {Integer} Pointer to a count of formats.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformatcount
     */
    GetOutputFormatCount(dwOutputNumber) {
        result := ComCall(8, this, "uint", dwOutputNumber, "uint*", &pcFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcFormats
    }

    /**
     * The GetOutputFormat method retrieves the supported formats for a specified output media stream.
     * @remarks
     * The Windows Media codecs can deliver media samples for a stream in a number of formats. For example, the Windows Media Video 9 codec can deliver samples in various RGB or <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">YUV</a> formats. You can use this method in conjunction with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformatcount">IWMReader::GetOutputFormatCount</a> to loop through the available formats and find the one you need.
     * 
     * To use a format returned by this method, you must call <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-setoutputprops">IWMReader::SetOutputProps</a>.
     * 
     * This method is synchronous and does not result in any messages being sent to the status callback.
     * @param {Integer} dwOutputNumber <b>DWORD</b> containing the output number.
     * @param {Integer} dwFormatNumber <b>DWORD</b> containing the format number.
     * @returns {IWMOutputMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmoutputmediaprops">IWMOutputMediaProps</a> interface. This interface belongs to an output media properties object created by a successful call to this method. The properties exposed by this interface represent formats than can be supported by the specified output; the current properties set for the output can be obtained by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputprops">IWMReader::GetOutputProps</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-getoutputformat
     */
    GetOutputFormat(dwOutputNumber, dwFormatNumber) {
        result := ComCall(9, this, "uint", dwOutputNumber, "uint", dwFormatNumber, "ptr*", &ppProps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMOutputMediaProps(ppProps)
    }

    /**
     * The Start method causes the reader object to start reading from the specified starting time offset. As data is read, it is passed to the application through the application's IWMReaderCallback::OnSample callback method.
     * @remarks
     * This method sends a WMT_STARTED status notification to the application's <b>IWMReaderCallback::OnStatus</b> function.
     * 
     * To change the rate but not the current file position, use the <b>Start</b> method with the WM_START_CURRENTPOSITION value.
     * 
     * Any call to <b>Start</b> while paused is treated as a <i>seek</i> through the file, and incurs a buffering penalty from network files. This is true even for calls to <b>Start</b> with the WM_START_CURRENTPOSITION value. To continue playing from the current paused position with no buffering penalty, call <b>Resume</b>.
     * 
     * If the application is providing the clock (by calling <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-setuserprovidedclock">IWMReaderAdvanced::SetUserProvidedClock</a>), it should usually set the <i>cnsDuration</i> parameter to zero. If the application specifies a non-zero value, then it must call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced-delivertime">IWMReaderAdvanced::DeliverTime</a> method exactly once, and the value passed to <b>DeliverTime</b> must be either the stop time or <c>(QWORD)-1</c>. The reader object will then deliver samples up to the specified duration.
     * 
     * This method is very similar to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-startatmarker">IWMReaderAdvanced2::StartAtMarker</a> method, but that method uses a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">marker</a> instead of a start time.
     * @param {Integer} cnsStart Time within the file at which to start reading, in 100-nanosecond units. If <i>cnsStart</i> is set to WM_START_CURRENTPOSITION, playback starts from the current position.
     * @param {Integer} cnsDuration Duration of the read in 100-nanosecond units, or zero to read to the end of the file.
     * @param {Float} fRate Playback speed. Normal speed is 1.0. Higher numbers cause faster playback, and numbers less than zero indicate reverse rate (rewinding). The valid ranges are 1.0 through 10.0, and -1.0 through -10.0.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is passed back to the <b>OnSample</b> method.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough available memory.
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
     * The value for <i>fRate</i> is not within the valid ranges, or the file is not seekable and a non-zero start position has been specified.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-start
     */
    Start(cnsStart, cnsDuration, fRate, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(10, this, "uint", cnsStart, "uint", cnsDuration, "float", fRate, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Stop method stops reading the file.
     * @remarks
     * This method sends a WMT_STOPPED status notification to the application's <b>IWMReaderCallback::OnStatus</b> function.
     * 
     * Calling <b>Stop</b> eliminates the current read position. If <b>Start</b> is called with a start time set at WM_START_CURRENTPOSITION after calling <b>Stop</b>, an error is returned.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough available memory.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-stop
     */
    Stop() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Pause method pauses the current read operation.
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
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is not enough available memory.
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
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-pause
     */
    Pause() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The Resume method starts the reader from the current position, after a Pause method call.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmreader-resume
     */
    Resume() {
        result := ComCall(13, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
