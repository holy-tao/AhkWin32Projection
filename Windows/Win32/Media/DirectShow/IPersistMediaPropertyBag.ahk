#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\IErrorLog.ahk" { IErrorLog }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMediaPropertyBag.ahk" { IMediaPropertyBag }
#Import "..\..\System\Com\IPersist.ahk" { IPersist }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * The IPersistMediaPropertyBag interface sets and retrieves INFO and DISP chunks in Audio-Video Interleaved (AVI) streams.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ipersistmediapropertybag
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IPersistMediaPropertyBag extends IPersist {
    /**
     * The interface identifier for IPersistMediaPropertyBag
     * @type {Guid}
     */
    static IID := Guid("{5738e040-b67f-11d0-bd4d-00a0c911ce86}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPersistMediaPropertyBag interfaces
    */
    struct Vtbl extends IPersist.Vtbl {
        InitNew : IntPtr
        Load    : IntPtr
        Save    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPersistMediaPropertyBag.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InitNew method initializes the object to receive new properties.
     * @remarks
     * Calling this method on the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-mux-filter">AVI Mux</a> filter clears any properties that were previously set using the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ipersistmediapropertybag-load">Load</a> method.
     * 
     * Calling this method on the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-splitter-filter">AVI Splitter</a> filter or the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wave-parser-filter">WAVE Parser</a> filter has no effect.
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-initnew
     */
    InitNew() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * The Load method loads properties from the media property bag into the filter.
     * @remarks
     * Call this method on the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-mux-filter">AVI Mux</a> filter to write the properties into the AVI stream. Call the method when the filter is stopped, before you run the filter graph to author the file. When the graph runs, the filter writes the INFO chunks into the AVI header.
     * 
     * The following code example adds an IART (author name) INFO chunk to a file:
     * 
     * <div class="code"><span><table>
     * <tr>
     * <th>C++</th>
     * </tr>
     * <tr>
     * <td>
     * <pre>
     * IPersistMediaPropertyBag *pPersist = NULL;
     * IMediaPropertyBag *pBag = NULL;
     * VARIANT val;
     * 
     * // Query the AVI Mux filter for IPersistMediaPropertyBag (not shown).
     * 
     * CoCreateInstance(CLSID_MediaPropertyBag, NULL, CLSCTX_INPROC,
     *         IID_IMediaPropertyBag, (LPVOID *)&amp;pBag);
     * 
     * val.vt = VT_BSTR;
     * val.bstrVal = SysAllocString(OLESTR("Author Name"));
     * pBag-&gt;Write(OLESTR("INFO/IART"), &amp;val);
     * pPersist-&gt;Load(pBag, NULL);
     * VariantClear(&amp;val);
     * </pre>
     * </td>
     * </tr>
     * </table></span></div>
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-splitter-filter">AVI Splitter</a> filter and the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wave-parser-filter">WAVE Parser</a> do not support this method.
     * @param {IMediaPropertyBag} pPropBag Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediapropertybag">IMediaPropertyBag</a> interface of a media property bag created by the caller.
     * @param {IErrorLog} pErrorLog Reserved. Set the value to <b>NULL</b>.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Success.
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
     * <b>NULL</b> pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Access denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>VFW_E_WRONG_STATE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter graph is not in a stopped state.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-load
     */
    Load(pPropBag, pErrorLog) {
        result := ComCall(5, this, "ptr", pPropBag, "ptr", pErrorLog, "HRESULT")
        return result
    }

    /**
     * The Save method saves properties from the filter into the media property bag.
     * @remarks
     * If you call this method on the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-splitter-filter">AVI Splitter</a> filter or the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/wave-parser-filter">WAVE Parser</a>, the filter reads any INFO and DISP chunks from the file and stores them in the media property bag. You can use the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-imediapropertybag-enumproperty">IMediaPropertyBag::EnumProperty</a> method to retrieve the chunks.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avi-mux-filter">AVI Mux</a> filter does not implement this method.
     * @param {IMediaPropertyBag} pPropBag Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nn-strmif-imediapropertybag">IMediaPropertyBag</a> interface of a media property bag created by the caller.
     * @param {BOOL} fClearDirty Reserved. Can be any value.
     * @param {BOOL} fSaveAllProperties Reserved. Can be any value.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following:
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
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not implemented.
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
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_INVALID_DATA)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid data.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ipersistmediapropertybag-save
     */
    Save(pPropBag, fClearDirty, fSaveAllProperties) {
        result := ComCall(6, this, "ptr", pPropBag, BOOL, fClearDirty, BOOL, fSaveAllProperties, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPersistMediaPropertyBag.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitNew := CallbackCreate(GetMethod(implObj, "InitNew"), flags, 1)
        this.vtbl.Load := CallbackCreate(GetMethod(implObj, "Load"), flags, 3)
        this.vtbl.Save := CallbackCreate(GetMethod(implObj, "Save"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitNew)
        CallbackFree(this.vtbl.Load)
        CallbackFree(this.vtbl.Save)
    }
}
