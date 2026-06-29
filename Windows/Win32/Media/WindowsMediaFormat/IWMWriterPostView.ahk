#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWMWriterPostViewCallback.ahk" { IWMWriterPostViewCallback }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMMediaProps.ahk" { IWMMediaProps }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMWriterPostView interface manages advanced writing functionality related to the postviewing of samples.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriterpostview
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterPostView extends IUnknown {
    /**
     * The interface identifier for IWMWriterPostView
     * @type {Guid}
     */
    static IID := Guid("{81e20ce4-75ef-491a-8004-fc53c45bdc3e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterPostView interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetPostViewCallback       : IntPtr
        SetReceivePostViewSamples : IntPtr
        GetReceivePostViewSamples : IntPtr
        GetPostViewProps          : IntPtr
        SetPostViewProps          : IntPtr
        GetPostViewFormatCount    : IntPtr
        GetPostViewFormat         : IntPtr
        SetAllocateForPostView    : IntPtr
        GetAllocateForPostView    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterPostView.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetPostViewCallback method specifies the callback interface to use for receiving postview samples.
     * @param {IWMWriterPostViewCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmwriterpostviewcallback">IWMWriterPostViewCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewcallback
     */
    SetPostViewCallback(pCallback, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setreceivepostviewsamples
     */
    SetReceivePostViewSamples(wStreamNum, fReceivePostViewSamples) {
        result := ComCall(4, this, "ushort", wStreamNum, BOOL, fReceivePostViewSamples, "HRESULT")
        return result
    }

    /**
     * The GetReceivePostViewSamples method retrieves a flag indicating whether delivery of postview samples has been turned on for the specified stream.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to a flag; True indicates that postview samples are to be delivered.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getreceivepostviewsamples
     */
    GetReceivePostViewSamples(wStreamNum) {
        result := ComCall(5, this, "ushort", wStreamNum, BOOL.Ptr, &pfReceivePostViewSamples := 0, "HRESULT")
        return pfReceivePostViewSamples
    }

    /**
     * The GetPostViewProps method retrieves the properties for the specified output stream.
     * @remarks
     * An application can enumerate through the various outputs, and retrieve the output format properties for that data. Manipulating the object retrieved has no effect on the output, unless the application also calls <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops">SetPostViewProps</a>.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {IWMMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops">IWMMediaProps</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewprops
     */
    GetPostViewProps(wStreamNumber) {
        result := ComCall(6, this, "ushort", wStreamNumber, "ptr*", &ppOutput := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setpostviewprops
     */
    SetPostViewProps(wStreamNumber, pOutput) {
        result := ComCall(7, this, "ushort", wStreamNumber, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * The GetPostViewFormatCount method is used for ascertaining all possible format types supported for the specified stream.
     * @remarks
     * This method can be used along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat">GetPostViewFormat</a> to ascertain all possible format types supported by this output on the reader.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {Integer} Pointer to a count of the output formats.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount
     */
    GetPostViewFormatCount(wStreamNumber) {
        result := ComCall(8, this, "ushort", wStreamNumber, "uint*", &pcFormats := 0, "HRESULT")
        return pcFormats
    }

    /**
     * The GetPostViewFormat method retrieves the media properties for the specified output stream and output format.
     * @remarks
     * This method can be used along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformatcount">GetPostViewFormatCount</a> to determine all possible format types supported by this output on the reader.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {Integer} dwFormatNumber <b>DWORD</b> containing the format number.
     * @returns {IWMMediaProps} Pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmmediaprops">IWMMediaProps</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getpostviewformat
     */
    GetPostViewFormat(wStreamNumber, dwFormatNumber) {
        result := ComCall(9, this, "ushort", wStreamNumber, "uint", dwFormatNumber, "ptr*", &ppProps := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setallocateforpostview
     */
    SetAllocateForPostView(wStreamNumber, fAllocate) {
        result := ComCall(10, this, "ushort", wStreamNumber, BOOL, fAllocate, "HRESULT")
        return result
    }

    /**
     * The GetAllocateForPostView method ascertains whether the application, and not the writer, must supply the buffers.
     * @remarks
     * See the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-setallocateforpostview">SetAllocateForPostView</a>.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @returns {BOOL} Pointer to Boolean value that is True if the application allocates buffers, and False if this is left to the writer.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostview-getallocateforpostview
     */
    GetAllocateForPostView(wStreamNumber) {
        result := ComCall(11, this, "ushort", wStreamNumber, BOOL.Ptr, &pfAllocate := 0, "HRESULT")
        return pfAllocate
    }

    Query(iid) {
        if (IWMWriterPostView.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetPostViewCallback := CallbackCreate(GetMethod(implObj, "SetPostViewCallback"), flags, 3)
        this.vtbl.SetReceivePostViewSamples := CallbackCreate(GetMethod(implObj, "SetReceivePostViewSamples"), flags, 3)
        this.vtbl.GetReceivePostViewSamples := CallbackCreate(GetMethod(implObj, "GetReceivePostViewSamples"), flags, 3)
        this.vtbl.GetPostViewProps := CallbackCreate(GetMethod(implObj, "GetPostViewProps"), flags, 3)
        this.vtbl.SetPostViewProps := CallbackCreate(GetMethod(implObj, "SetPostViewProps"), flags, 3)
        this.vtbl.GetPostViewFormatCount := CallbackCreate(GetMethod(implObj, "GetPostViewFormatCount"), flags, 3)
        this.vtbl.GetPostViewFormat := CallbackCreate(GetMethod(implObj, "GetPostViewFormat"), flags, 4)
        this.vtbl.SetAllocateForPostView := CallbackCreate(GetMethod(implObj, "SetAllocateForPostView"), flags, 3)
        this.vtbl.GetAllocateForPostView := CallbackCreate(GetMethod(implObj, "GetAllocateForPostView"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetPostViewCallback)
        CallbackFree(this.vtbl.SetReceivePostViewSamples)
        CallbackFree(this.vtbl.GetReceivePostViewSamples)
        CallbackFree(this.vtbl.GetPostViewProps)
        CallbackFree(this.vtbl.SetPostViewProps)
        CallbackFree(this.vtbl.GetPostViewFormatCount)
        CallbackFree(this.vtbl.GetPostViewFormat)
        CallbackFree(this.vtbl.SetAllocateForPostView)
        CallbackFree(this.vtbl.GetAllocateForPostView)
    }
}
