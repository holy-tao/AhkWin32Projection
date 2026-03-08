#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods to read data from an Advanced Systems Format (ASF) file.
 * @remarks
 * The ASF splitter accepts ASF packets and extracts the samples for individual streams from them. As with the other ASF base components, the ASF splitter object must be initialized with data from an ASF ContentInfo object before use.
 * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nn-wmcontainer-imfasfsplitter
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFASFSplitter extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFASFSplitter
     * @type {Guid}
     */
    static IID => Guid("{12558295-e399-11d5-bc2a-00b0d0f3f4ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "SetFlags", "GetFlags", "SelectStreams", "GetSelectedStreams", "ParseData", "GetNextSample", "Flush", "GetLastSendTime"]

    /**
     * Resets the Advanced Systems Format (ASF) splitter and configures it to parse data from an ASF data section.
     * @param {IMFASFContentInfo} pIContentInfo Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nn-wmcontainer-imfasfcontentinfo">IMFASFContentInfo</a> interface of a ContentInfo object that describes the data to be parsed.
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
     * The <i>pIContentInfo</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-initialize
     */
    Initialize(pIContentInfo) {
        result := ComCall(3, this, "ptr", pIContentInfo, "HRESULT")
        return result
    }

    /**
     * Sets option flags on the Advanced Systems Format (ASF) splitter.
     * @remarks
     * This method can only be called after the splitter is initialized.
     * @param {Integer} dwFlags A bitwise combination of zero or more members of the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-mfasf_splitterflags">MFASF_SPLITTERFLAGS</a> enumeration.
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
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The splitter is not initialized.
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
     * The <i>dwFlags</i> parameter does not contain a valid flag.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDREQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The MFASF_SPLITTER_REVERSE flag is set, but the content cannot be parsed in reverse.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-setflags
     */
    SetFlags(dwFlags) {
        result := ComCall(4, this, "uint", dwFlags, "HRESULT")
        return result
    }

    /**
     * Retrieves the option flags that are set on the ASF splitter.
     * @returns {Integer} Receives the option flags. This value is a bitwise <b>OR</b> of zero or more members of the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/ne-wmcontainer-mfasf_splitterflags">MFASF_SPLITTERFLAGS</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getflags
     */
    GetFlags() {
        result := ComCall(5, this, "uint*", &pdwFlags := 0, "HRESULT")
        return pdwFlags
    }

    /**
     * Sets the streams to be parsed by the Advanced Systems Format (ASF) splitter.
     * @remarks
     * Calling this method supersedes any previous stream selections; only the streams specified in the <i>pwStreamNumbers</i> array will be selected.
     * 
     * By default, no streams are selected by the splitter.
     * 
     * You can obtain a list of the currently selected streams by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getselectedstreams">IMFASFSplitter::GetSelectedStreams</a> method.
     * @param {Pointer<Integer>} pwStreamNumbers An array of variables containing the list of stream numbers to select.
     * @param {Integer} wNumStreams The number of valid elements in the stream number array.
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
     * <i>pwStreamNumbers</i> is <b>NULL</b> and <i>wNumStreams</i> contains a value greater than zero.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_INVALIDSTREAMNUMBER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid stream number was passed in the array.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-selectstreams
     */
    SelectStreams(pwStreamNumbers, wNumStreams) {
        pwStreamNumbersMarshal := pwStreamNumbers is VarRef ? "ushort*" : "ptr"

        result := ComCall(6, this, pwStreamNumbersMarshal, pwStreamNumbers, "ushort", wNumStreams, "HRESULT")
        return result
    }

    /**
     * Gets a list of currently selected streams.
     * @remarks
     * To get the number of selected streams, set <i>pwStreamNumbers</i> to <b>NULL</b>. The method will return <b>MF_E_BUFFERTOSMALL</b> but will also set the value of <c>*pwNumStreams</c> equal  to the number of selected streams. Then allocate an array of that size and call the method again, passing the array in the <i>pwStreamNumbers</i> parameter.
     * 
     * The following code shows these steps:
     * 
     * 
     * ```cpp
     * HRESULT DisplaySelectedStreams(IMFASFSplitter *pSplitter)
     * {
     *     WORD count = 0;
     *     HRESULT hr = pSplitter->GetSelectedStreams(NULL, &count);
     *     if (hr == MF_E_BUFFERTOOSMALL)
     *     {
     *         WORD *pStreamIds = new (std::nothrow) WORD[count];
     *         if (pStreamIds)
     *         {
     *             hr = pSplitter->GetSelectedStreams(pStreamIds, &count);
     *             if (SUCCEEDED(hr))
     *             {
     *                 for (WORD i = 0; i < count; i++)
     *                 {
     *                     printf("Selected stream ID: %d\n", pStreamIds[i]);
     *                 }
     *             }
     *             delete [] pStreamIds;
     *         }
     *         else
     *         {
     *             hr = E_OUTOFMEMORY;
     *         }
     *     }
     *     return hr;
     * }
     * 
     * ```
     * 
     * 
     * Alternatively, you can allocate an array that is equal to the total number of streams and pass that to <i>pwStreamNumbers</i>.
     * 
     * Before calling this method, initialize <c>*pwNumStreams</code>  to the number of elements in <i>pwStreamNumbers</i>. If <i>pwStreamNumbers</i> is <b>NULL</b>, set <code>*pwNumStreams</c> to zero.
     * 
     * By default, no streams are selected by the splitter. Select streams by calling the <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-selectstreams">IMFASFSplitter::SelectStreams</a> method.
     * @param {Pointer<Integer>} pwNumStreams On input, points to a variable that contains the number of elements in the <i>pwStreamNumbers</i> array. Set the variable to zero if <i>pwStreamNumbers</i> is <b>NULL</b>. 
     * 
     * On output, receives the number of elements that were copied into <i>pwStreamNumbers</i>. Each element is the identifier of a selected stream.
     * @returns {Integer} The address of an array of <b>WORDs</b>. This array receives the stream numbers of the selected streams.
     *           This parameter can be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getselectedstreams
     */
    GetSelectedStreams(pwNumStreams) {
        pwNumStreamsMarshal := pwNumStreams is VarRef ? "ushort*" : "ptr"

        result := ComCall(7, this, "ushort*", &pwStreamNumbers := 0, pwNumStreamsMarshal, pwNumStreams, "HRESULT")
        return pwStreamNumbers
    }

    /**
     * Sends packetized Advanced Systems Format (ASF) data to the ASF splitter for processing.
     * @remarks
     * After using this method to parse data, you must call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getnextsample">IMFASFSplitter::GetNextSample</a> to retrieve parsed media samples.
     * 
     * If your ASF data contains variable-sized packets, you must set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mfasfsplitter-packet-boundary-attribute">MFASFSPLITTER_PACKET_BOUNDARY</a> attribute on the buffers to indicate the sample boundaries, and the buffers cannot span multiple packets.
     * 
     * If the method returns ME_E_NOTACCEPTING, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getnextsample">GetNextSample</a> to get the output samples, or call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-flush">IMFASFSplitter::Flush</a> to clear the splitter.
     * 
     * The splitter might hold a reference count on the input buffer. Therefore, do not write over the valid data in the buffer after calling this method.
     * @param {IMFMediaBuffer} pIBuffer Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediabuffer">IMFMediaBuffer</a> interface of a buffer object containing data to be parsed.
     * @param {Integer} cbBufferOffset The offset into the data buffer where the splitter should begin parsing. This value is typically set to 0.
     * @param {Integer} cbLength The length, in bytes, of the data to parse. This value is measured from the offset specified by <i>cbBufferOffset</i>. Set to 0 to process to the end of the buffer.
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
     * The <i>pIBuffer</i> parameter is <b>NULL</b>.
     * 
     * The specified offset value in <i>cbBufferOffset</i> is greater than the length of the buffer.
     * 
     * The total value of <i>cbBufferOffset</i> and <i>cbLength</i> is greater than the length of the buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOT_INITIALIZED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-initialize">IMFASFSplitter::Initialize</a> method was not called or the call failed.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_NOTACCEPTING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The splitter cannot process more input at this time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-parsedata
     */
    ParseData(pIBuffer, cbBufferOffset, cbLength) {
        result := ComCall(8, this, "ptr", pIBuffer, "uint", cbBufferOffset, "uint", cbLength, "HRESULT")
        return result
    }

    /**
     * Retrieves a sample from the Advanced Systems Format (ASF) splitter after the data has been parsed.
     * @remarks
     * Before calling this method, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-parsedata">IMFASFSplitter::ParseData</a> to give input data to the splitter. If the input does not contain enough data for a complete sample, the <b>GetNextSample</b> method succeeds but returns <b>NULL</b> in the <i>ppISample</i> parameter.
     * 
     * The ASF splitter skips samples for unselected streams. To select streams, call <a href="https://docs.microsoft.com/windows/desktop/api/wmcontainer/nf-wmcontainer-imfasfsplitter-selectstreams">IMFASFSplitter::SelectStreams</a>.
     * @param {Pointer<Integer>} pdwStatusFlags 
     * @param {Pointer<Integer>} pwStreamNumber If the method returns a sample in the <i>ppISample</i> parameter, this parameter receives the number of the stream to which the sample belongs.
     * @param {Pointer<IMFSample>} ppISample Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfsample">IMFSample</a> interface of the parsed sample. The caller must release the interface. If no samples are ready, this parameter receives the value <b>NULL</b>.
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
     * <dt><b>MF_E_ASF_INVALIDDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The ASF data in the buffer is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_ASF_MISSINGDATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a gap in the ASF data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getnextsample
     */
    GetNextSample(pdwStatusFlags, pwStreamNumber, ppISample) {
        pdwStatusFlagsMarshal := pdwStatusFlags is VarRef ? "int*" : "ptr"
        pwStreamNumberMarshal := pwStreamNumber is VarRef ? "ushort*" : "ptr"

        result := ComCall(9, this, pdwStatusFlagsMarshal, pdwStatusFlags, pwStreamNumberMarshal, pwStreamNumber, "ptr*", ppISample, "HRESULT")
        return result
    }

    /**
     * Resets the Advanced Systems Format (ASF) splitter and releases all pending samples.
     * @remarks
     * Any samples waiting to be retrieved when <b>Flush</b> is called are lost.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-flush
     */
    Flush() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * Retrieves the send time of the last sample received.
     * @returns {Integer} Receives the send time of the last sample received.
     * @see https://learn.microsoft.com/windows/win32/api/wmcontainer/nf-wmcontainer-imfasfsplitter-getlastsendtime
     */
    GetLastSendTime() {
        result := ComCall(11, this, "uint*", &pdwLastSendTime := 0, "HRESULT")
        return pdwLastSendTime
    }
}
