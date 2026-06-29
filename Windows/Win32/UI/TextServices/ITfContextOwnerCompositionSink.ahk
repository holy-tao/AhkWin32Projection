#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfRange.ahk" { ITfRange }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITfCompositionView.ahk" { ITfCompositionView }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfContextOwnerCompositionSink interface is implemented by an application to receive composition-related notifications.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfcontextownercompositionsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfContextOwnerCompositionSink extends IUnknown {
    /**
     * The interface identifier for ITfContextOwnerCompositionSink
     * @type {Guid}
     */
    static IID := Guid("{5f20aa40-b57a-4f34-96ab-3576f377cc79}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfContextOwnerCompositionSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStartComposition  : IntPtr
        OnUpdateComposition : IntPtr
        OnEndComposition    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfContextOwnerCompositionSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfContextOwnerCompositionSink::OnStartComposition method
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the new composition.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a value that allows or denies the new composition. Receives a nonzero value to allow the composition or zero to deny the composition.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onstartcomposition
     */
    OnStartComposition(pComposition) {
        result := ComCall(3, this, "ptr", pComposition, BOOL.Ptr, &pfOk := 0, "HRESULT")
        return pfOk
    }

    /**
     * ITfContextOwnerCompositionSink::OnUpdateComposition method
     * @remarks
     * To determine what has changed within the composition, compare <i>pRangeNew</i> with the range returned from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfcompositionview-getrange">ITfCompositionView::GetRange</a>. The range returned by <b>ITfCompositionView::GetRange</b> is not updated until after <b>ITfContextOwnerCompositionSink::OnUpdateComposition</b> returns.
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the composition updated.
     * @param {ITfRange} pRangeNew Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the range of text the composition will cover after the composition is updated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onupdatecomposition
     */
    OnUpdateComposition(pComposition, pRangeNew) {
        result := ComCall(4, this, "ptr", pComposition, "ptr", pRangeNew, "HRESULT")
        return result
    }

    /**
     * ITfContextOwnerCompositionSink::OnEndComposition method
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the composition terminated.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextownercompositionsink-onendcomposition
     */
    OnEndComposition(pComposition) {
        result := ComCall(5, this, "ptr", pComposition, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfContextOwnerCompositionSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStartComposition := CallbackCreate(GetMethod(implObj, "OnStartComposition"), flags, 3)
        this.vtbl.OnUpdateComposition := CallbackCreate(GetMethod(implObj, "OnUpdateComposition"), flags, 3)
        this.vtbl.OnEndComposition := CallbackCreate(GetMethod(implObj, "OnEndComposition"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStartComposition)
        CallbackFree(this.vtbl.OnUpdateComposition)
        CallbackFree(this.vtbl.OnEndComposition)
    }
}
