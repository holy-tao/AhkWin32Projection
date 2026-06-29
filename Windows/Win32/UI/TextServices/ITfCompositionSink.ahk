#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfComposition.ahk" { ITfComposition }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfCompositionSink interface is implemented by a text service to receive a notification when a composition is terminated.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcompositionsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfCompositionSink extends IUnknown {
    /**
     * The interface identifier for ITfCompositionSink
     * @type {Guid}
     */
    static IID := Guid("{a781718c-579a-4b15-a280-32b8577acc5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfCompositionSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCompositionTerminated : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfCompositionSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfCompositionSink::OnCompositionTerminated method
     * @remarks
     * There is no required action for the TSF text service when this method is called. The TSF text service can use this notification to revert partially composed text into readable text or erase the composition entirely. The TSF manager will automatically clear the GUID_PROP_COMPOSING property value over the affected text.
     * @param {Integer} ecWrite Contains a <a href="https://docs.microsoft.com/windows/desktop/TSF/tfeditcookie">TfEditCookie</a> value that identifies the edit context. This is the same value passed for <i>ecWrite</i> in the call to <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcontextcomposition-startcomposition">ITfContextComposition::StartComposition</a>.
     * @param {ITfComposition} pComposition Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfComposition</a> object terminated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcompositionsink-oncompositionterminated
     */
    OnCompositionTerminated(ecWrite, pComposition) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pComposition, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfCompositionSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCompositionTerminated := CallbackCreate(GetMethod(implObj, "OnCompositionTerminated"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCompositionTerminated)
    }
}
