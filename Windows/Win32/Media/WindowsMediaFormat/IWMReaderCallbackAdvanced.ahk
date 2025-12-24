#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\INSSBuffer.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderCallback interface is implemented by the application to handle data being read from a file.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadercallbackadvanced
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderCallbackAdvanced extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMReaderCallbackAdvanced
     * @type {Guid}
     */
    static IID => Guid("{96406beb-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStreamSample", "OnTime", "OnStreamSelection", "OnOutputPropsChanged", "AllocateForStream", "AllocateForOutput"]

    /**
     * The OnStreamSample method delivers stream samples from the source file without decompressing them first.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cnsSampleTime <b>QWORD</b> containing the sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration <b>QWORD</b> containing the sample duration, in 100-nanosecond units.
     * @param {Integer} dwFlags The flags that can be specified have the following uses.
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
     * <td>This is the same as a <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmformat-glossary">key frame</a>. It indicates a good point to go to during a seek, for example.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>The data stream has a gap in it, which could be due to a seek, a network loss, or other reason. This can be useful extra information for an application such as a codec or renderer. The flag is set on the first piece of data following the gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>Some data has been lost between the previous sample, and the sample with this flag set.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to a sample stored in an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface. The reader calls <b>SAFE_RELEASE</b> on this pointer after your <b>OnStreamSample</b> method returns. You can call <b>AddRef</b> on this pointer if you need to keep a reference count on the buffer. Do not call <b>Release</b> on this pointer unless you have called <b>AddRef</b>.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} To use this method, you must implement it in your application. You can return whatever <b>HRESULT</b> error codes are appropriate to your implementation. For more information about the <b>HRESULT</b> error codes included for use by the Windows Media Format SDK, see <a href="/windows/desktop/wmformat/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamsample
     */
    OnStreamSample(wStreamNum, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ushort", wStreamNum, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The OnTime method notifies the application of the clock time the reader is working to. This method is used when a user-provided clock has been specified.
     * @param {Integer} cnsCurrentTime <b>QWORD</b> containing the current time in 100-nanosecond units.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {HRESULT} To use this method, you must implement it in your application. You can return whatever <b>HRESULT</b> error codes are appropriate to your implementation. For more information about the <b>HRESULT</b> error codes included for use by the Windows Media Format SDK, see <a href="/windows/desktop/wmformat/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-ontime
     */
    OnTime(cnsCurrentTime, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "uint", cnsCurrentTime, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The OnStreamSelection method notifies the application of stream changes made due to bandwidth restrictions. To have this method called, call IWMReaderAdvanced::SetReceiveSelectionCallbacks.
     * @param {Integer} wStreamCount <b>WORD</b> containing the number of entries in the <i>pStreamNumbers</i> array.
     * @param {Pointer<Integer>} pStreamNumbers Pointer to an array of stream numbers.
     * @param {Pointer<Integer>} pSelections Pointer to an array of members of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_stream_selection">WMT_STREAM_SELECTION</a> enumeration type. Each element in this array corresponds to the stream number contained in the corresponding element of the array pointed to by <i>pStreamNumbers</i>.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {HRESULT} To use this method, you must implement it in your application. You can return whatever <b>HRESULT</b> error codes are appropriate to your implementation. For more information about the <b>HRESULT</b> error codes included for use by the Windows Media Format SDK, see <a href="/windows/desktop/wmformat/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onstreamselection
     */
    OnStreamSelection(wStreamCount, pStreamNumbers, pSelections, pvContext) {
        pStreamNumbersMarshal := pStreamNumbers is VarRef ? "ushort*" : "ptr"
        pSelectionsMarshal := pSelections is VarRef ? "int*" : "ptr"
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamCount, pStreamNumbersMarshal, pStreamNumbers, pSelectionsMarshal, pSelections, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The OnOutputPropsChanged method indicates that the media properties for the specified output have changed. This change occurs as a result of a call to the IWMReader::SetOutputProps method.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Pointer<WM_MEDIA_TYPE>} pMediaType Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_media_type">WM_MEDIA_TYPE</a> structure.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <b>IWMReader::Start</b> method.
     * @returns {HRESULT} To use this method, you must implement it in your application. You can return whatever <b>HRESULT</b> error codes are appropriate to your implementation. For more information about the <b>HRESULT</b> error codes included for use by the Windows Media Format SDK, see <a href="/windows/desktop/wmformat/error-codes">Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-onoutputpropschanged
     */
    OnOutputPropsChanged(dwOutputNum, pMediaType, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(6, this, "uint", dwOutputNum, "ptr", pMediaType, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The AllocateForStream method allocates user-created buffers for stream samples delivered to IWMReaderCallbackAdvanced::OnStreamSample. For more information about allocating your own buffers, see User Allocated Sample Support.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cbBuffer Size of the buffer, in bytes.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} If the method succeeds, returns a pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforstream
     */
    AllocateForStream(wStreamNum, cbBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(7, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    /**
     * The AllocateForOutput method allocates user-created buffers for samples delivered to IWMReaderCallback::OnSample. For more information about allocating your own buffers, see User Allocated Sample Support.
     * @param {Integer} dwOutputNum <b>DWORD</b> containing the output number.
     * @param {Integer} cbBuffer Size of the buffer, in bytes.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application. This pointer is the context pointer given to the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-start">IWMReader::Start</a> method.
     * @returns {INSSBuffer} If the method succeeds, returns a pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmreadercallbackadvanced-allocateforoutput
     */
    AllocateForOutput(dwOutputNum, cbBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(8, this, "uint", dwOutputNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }
}
