#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\INSSBuffer.ahk" { INSSBuffer }
#Import ".\IWMStatusCallback.ahk" { IWMStatusCallback }

/**
 * The IWMWriterPostViewCallback interface manages the receiving of uncompressed samples from the writer. Postview can be used only for video streams.This interface must be implemented by the application and passed to IWMWriterPostView::SetPostViewCallback.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmwriterpostviewcallback
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMWriterPostViewCallback extends IWMStatusCallback {
    /**
     * The interface identifier for IWMWriterPostViewCallback
     * @type {Guid}
     */
    static IID := Guid("{d9d6549d-a193-4f24-b308-03123d9b7f8d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMWriterPostViewCallback interfaces
    */
    struct Vtbl extends IWMStatusCallback.Vtbl {
        OnPostViewSample    : IntPtr
        AllocateForPostView : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMWriterPostViewCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnPostViewSample method is called when new postview data is available. The application implements this method.
     * @remarks
     * Postview data is available only for video.
     * @param {Integer} wStreamNumber <b>WORD</b> containing the stream number.
     * @param {Integer} cnsSampleTime Sample time, in 100-nanosecond units.
     * @param {Integer} cnsSampleDuration Sample duration, in 100-nanosecond units. This will usually be 10000 (1 millisecond).
     * @param {Integer} dwFlags <b>DWORD</b> containing none, one, or more of the following flags.
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
     * <td>This is basically the same as a key frame. It indicates a good point to go to during a seek, for example.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DISCONTINUITY</td>
     * <td>The data stream has a gap in it, which could be due to a seek, a network loss, or some other reason. This can be useful extra information for an application such as a codec or renderer. The flag is set on the first piece of data following the gap.</td>
     * </tr>
     * <tr>
     * <td>WM_SF_DATALOSS</td>
     * <td>Some data has been lost between the previous sample and the sample with this flag set.</td>
     * </tr>
     * </table>
     * @param {INSSBuffer} pSample Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface on an object that contains the sample.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {HRESULT} This method is implemented by the application. It should return S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-onpostviewsample
     */
    OnPostViewSample(wStreamNumber, cnsSampleTime, cnsSampleDuration, dwFlags, pSample, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(4, this, "ushort", wStreamNumber, "uint", cnsSampleTime, "uint", cnsSampleDuration, "uint", dwFlags, "ptr", pSample, pvContextMarshal, pvContext, "HRESULT")
        return result
    }

    /**
     * The AllocateForPostView method allocates a buffer for use in postviewing operations. The application implements this method.
     * @param {Integer} wStreamNum <b>WORD</b> containing the stream number.
     * @param {Integer} cbBuffer Size of <i>ppBuffer</i>, in bytes.
     * @param {Pointer<Void>} pvContext Generic pointer, for use by the application.
     * @returns {INSSBuffer} Pointer to a pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsbuffer/nn-wmsbuffer-inssbuffer">INSSBuffer</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriterpostviewcallback-allocateforpostview
     */
    AllocateForPostView(wStreamNum, cbBuffer, pvContext) {
        pvContextMarshal := pvContext is VarRef ? "ptr" : "ptr"

        result := ComCall(5, this, "ushort", wStreamNum, "uint", cbBuffer, "ptr*", &ppBuffer := 0, pvContextMarshal, pvContext, "HRESULT")
        return INSSBuffer(ppBuffer)
    }

    Query(iid) {
        if (IWMWriterPostViewCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPostViewSample := CallbackCreate(GetMethod(implObj, "OnPostViewSample"), flags, 7)
        this.vtbl.AllocateForPostView := CallbackCreate(GetMethod(implObj, "AllocateForPostView"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPostViewSample)
        CallbackFree(this.vtbl.AllocateForPostView)
    }
}
