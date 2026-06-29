#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IStreamBufferSink.ahk" { IStreamBufferSink }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IStreamBufferSource interface is exposed by the Stream Buffer Source filter. Use this interface to play live content from the Stream Buffer Sink filter.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IStreamBufferSource)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/sbe/nn-sbe-istreambuffersource
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IStreamBufferSource extends IUnknown {
    /**
     * The interface identifier for IStreamBufferSource
     * @type {Guid}
     */
    static IID := Guid("{1c5bd776-6ced-4f44-8164-5eab0e98db12}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStreamBufferSource interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetStreamSink : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStreamBufferSource.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The SetStreamSink method sets a pointer to the Stream Buffer Sink filter, so that the Stream Buffer Source filter can stream data from the sink filter.
     * @remarks
     * The source filter and the sink filter must be within the same process, but can reside in different filter graphs. If they are in different processes, call <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ifilesourcefilter-load">IFileSourceFilter::Load</a> with the same file name used in the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nf-sbe-istreambuffersink-lockprofile">IStreamBufferSink::LockProfile</a> method.
     * 
     * Several Stream Buffer Source filters can stream from the same sink filter.
     * @param {IStreamBufferSink} pIStreamBufferSink Pointer to the Stream Buffer Sink filter's <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/sbe/nn-sbe-istreambuffersink">IStreamBufferSink Interface</a> interface.
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
     * @see https://learn.microsoft.com/windows/win32/api/sbe/nf-sbe-istreambuffersource-setstreamsink
     */
    SetStreamSink(pIStreamBufferSink) {
        result := ComCall(3, this, "ptr", pIStreamBufferSink, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStreamBufferSource.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStreamSink := CallbackCreate(GetMethod(implObj, "SetStreamSink"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStreamSink)
    }
}
