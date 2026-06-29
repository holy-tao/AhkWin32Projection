#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMIndexer interface is used to create an index for ASF files to enable seeking.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmindexer
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMIndexer extends IUnknown {
    /**
     * The interface identifier for IWMIndexer
     * @type {Guid}
     */
    static IID := Guid("{6d7cdc71-9888-11d3-8edc-00c04f6109cf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMIndexer interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        StartIndexing : IntPtr
        Cancel        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMIndexer.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The StartIndexing method initiates indexing.
     * @remarks
     * <b>StartIndexing</b> is an asynchronous call; it returns almost immediately and the application must wait for appropriate <b>OnStatus</b> calls to be sent to the callback function.
     * 
     * If you call <b>StartIndexing</b> for a file that is already indexed, the old index is discarded.
     * 
     * When the indexer successfully indexes a file, it will set some of the reserved attribute values as described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Index type
     *             </th>
     * <th>Attributes set
     *             </th>
     * </tr>
     * <tr>
     * <td>WMT_IT_PRESENTATION_TIME</td>
     * <td>
     * g_wszWMSeekable
     * 
     * g_wszWMStridable, if a video stream is present.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>WMT_IT_FRAME_NUMBERS</td>
     * <td>
     * g_wszWMNumberOfFrames
     * 
     * g_wszWMSeekable
     * 
     * g_wszWMStridable
     * 
     * </td>
     * </tr>
     * </table>
     * @param {PWSTR} pwszURL Pointer to a wide-character <b>null</b>-terminated string containing the URL or file name.
     * @param {IWMStatusCallback} pCallback Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nn-wmsdkidl-iwmstatuscallback">IWMStatusCallback</a> interface.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
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
     * The parameter <i>pwszURL</i> or <i>pCallback</i> is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_BUSY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method cannot start indexing in the current state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmindexer-startindexing
     */
    StartIndexing(pwszURL, pCallback, pvContext) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", pwszURL, "ptr", pCallback, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The Cancel method cancels the current indexing operation.
     * @returns {HRESULT} This method always returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmindexer-cancel
     */
    Cancel() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMIndexer.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.StartIndexing := CallbackCreate(GetMethod(implObj, "StartIndexing"), flags, 4)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.StartIndexing)
        CallbackFree(this.vtbl.Cancel)
    }
}
