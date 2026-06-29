#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\TfLayoutCode.ahk" { TfLayoutCode }
#Import ".\ITfContext.ahk" { ITfContext }
#Import ".\ITfContextView.ahk" { ITfContextView }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfTextLayoutSink interface supports the context layout change by an application. Install this advise sink by calling ITfSource::AdviseSink with IID_ITfTextLayoutSink. A text service can optionally implement this interface.
 * @remarks
 * TSF does not currently support multiple views; some features of this interface are limited.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itftextlayoutsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfTextLayoutSink extends IUnknown {
    /**
     * The interface identifier for ITfTextLayoutSink
     * @type {Guid}
     */
    static IID := Guid("{2af2d06a-dd5b-4927-a0b4-54f19c91fade}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfTextLayoutSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnLayoutChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfTextLayoutSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfTextLayoutSink::OnLayoutChange method
     * @remarks
     * Each context has a default view for which a reference can be obtained using the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontext-getactiveview">ITfContext::GetActiveView</a> method. The method returns only the value TF_LC_CHANGE for the <i>lcode</i> parameter for this view, because the values are possible only for multiple views. Because TSF does not support multiple views, this method never receives other values of the <b>TfLayoutCode</b> enumeration.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface for the context that changed.
     * @param {TfLayoutCode} lcode Specifies the <a href="https://docs.microsoft.com/windows/win32/api/msctf/ne-msctf-tflayoutcode">TfLayoutCode</a> element that describes the layout change.
     * @param {ITfContextView} pView Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontextview">ITfContextView</a> interface for the context view in that the layout change occurred.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itftextlayoutsink-onlayoutchange
     */
    OnLayoutChange(pic, lcode, pView) {
        result := ComCall(3, this, "ptr", pic, TfLayoutCode, lcode, "ptr", pView, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfTextLayoutSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnLayoutChange := CallbackCreate(GetMethod(implObj, "OnLayoutChange"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnLayoutChange)
    }
}
