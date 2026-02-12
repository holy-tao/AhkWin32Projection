#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMMediaProps.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMWriterPostView interface manages advanced writing functionality related to the postviewing of samples.
 * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nn-wmsdkidl-iwmwriterpostview
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterPostView extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterPostView
     * @type {Guid}
     */
    static IID => Guid("{81e20ce4-75ef-491a-8004-fc53c45bdc3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetPostViewCallback", "SetReceivePostViewSamples", "GetReceivePostViewSamples", "GetPostViewProps", "SetPostViewProps", "GetPostViewFormatCount", "GetPostViewFormat", "SetAllocateForPostView", "GetAllocateForPostView"]

    /**
     * The SetPostViewCallback method specifies the callback interface to use for receiving postview samples.
     * @param {IWMWriterPostViewCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterpostviewcallback">IWMWriterPostViewCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewcallback
     */
    SetPostViewCallback(pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pCallback, pvContextMarshal, pvContext, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The SetReceivePostViewSamples method enables or disables delivery of postview samples for the specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {BOOL} fReceivePostViewSamples Boolean value that is True if postview samples must be delivered.
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
     * <i>wStreamNum</i> is less than 1 or greater than the maximum number of streams.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Could not get the output for that stream.
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
     * Stream does not support postview.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setreceivepostviewsamples
     */
    SetReceivePostViewSamples(wStreamNum, fReceivePostViewSamples) {
        result := ComCall(4, this, "ushort", wStreamNum, "int", fReceivePostViewSamples, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetReceivePostViewSamples method retrieves a flag indicating whether delivery of postview samples has been turned on for the specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to a flag; True indicates that postview samples are to be delivered.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getreceivepostviewsamples
     */
    GetReceivePostViewSamples(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, "int*", &pfReceivePostViewSamples := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfReceivePostViewSamples
    }

    /**
     * The GetPostViewProps method retrieves the properties for the specified output stream.
     * @remarks
     * An application can enumerate through the various outputs, and retrieve the output format properties for that data. Manipulating the object retrieved has no effect on the output, unless the application also calls <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops">SetPostViewProps</a>.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {IWMMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops">IWMMediaProps</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewprops
     */
    GetPostViewProps(wStreamNumber) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr*", &ppOutput := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMMediaProps(ppOutput)
    }

    /**
     * The SetPostViewProps method specifies the format for the specified output stream.
     * @remarks
     * It is not possible to resize the video output using postview properties.
     * 
     * <b>SetPostViewProps</b> fails if <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriter-beginwriting">IWMWriter::BeginWriting</a> has been called. If any postview properties need to be changed, this should be done before calling <b>BeginWriting</b>.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {IWMMediaProps} pOutput Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops">IWMMediaProps</a> interface.
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
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream number specified by <i>wStreamNumber</i> is not valid.
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
     * The method was unable to create an internal structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops
     */
    SetPostViewProps(wStreamNumber, pOutput) {
        result := ComCall(7, this, "ushort", wStreamNumber, "ptr", pOutput, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetPostViewFormatCount method is used for ascertaining all possible format types supported for the specified stream.
     * @remarks
     * This method can be used along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat">GetPostViewFormat</a> to ascertain all possible format types supported by this output on the reader.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {Integer} Pointer to a count of the output formats.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount
     */
    GetPostViewFormatCount(wStreamNumber) {
        result := ComCall(8, this, "ushort", wStreamNumber, "uint*", &pcFormats := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pcFormats
    }

    /**
     * The GetPostViewFormat method retrieves the media properties for the specified output stream and output format.
     * @remarks
     * This method can be used along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount">GetPostViewFormatCount</a> to determine all possible format types supported by this output on the reader.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {Integer} dwFormatNumber <b>DWORD</b> containing the format number.
     * @returns {IWMMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops">IWMMediaProps</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat
     */
    GetPostViewFormat(wStreamNumber, dwFormatNumber) {
        result := ComCall(9, this, "ushort", wStreamNumber, "uint", dwFormatNumber, "ptr*", &ppProps := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IWMMediaProps(ppProps)
    }

    /**
     * The SetAllocateForPostView method specifies whether the application, and not the writer, must supply the buffers.
     * @remarks
     * The application can provide buffers for any of the outputs, rather than use those allocated by the reader. For example, some applications can allocate Microsoft DirectDraw® buffers.
     * 
     * The actual allocation of buffers is handled by the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmreadercallbackadvanced">IWMReaderCallbackAdvanced</a> interface.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {BOOL} fAllocate Boolean value. Set to True if the application allocates buffers, and False if this is left to the reader.
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
     * <dt><b>NS_E_INVALID_STREAM</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The stream number specified by <i>wStreamNumber</i> is not valid.
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
     * The method was unable to create an internal structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setallocateforpostview
     */
    SetAllocateForPostView(wStreamNumber, fAllocate) {
        result := ComCall(10, this, "ushort", wStreamNumber, "int", fAllocate, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The GetAllocateForPostView method ascertains whether the application, and not the writer, must supply the buffers.
     * @remarks
     * See the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setallocateforpostview">SetAllocateForPostView</a>.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to Boolean value that is True if the application allocates buffers, and False if this is left to the writer.
     * @see https://learn.microsoft.com/windows/win32/api//content/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getallocateforpostview
     */
    GetAllocateForPostView(wStreamNumber) {
        result := ComCall(11, this, "ushort", wStreamNumber, "int*", &pfAllocate := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfAllocate
    }
}
