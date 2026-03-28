#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables interfaces that are usually synchronous to function asynchronously.
 * @remarks
 * <b>IDataObjectAsyncCapability</b> is an optional interface that is implemented by a data object. It allows the drop target to negotiate with the drop source to extract data from the data object asynchronously.
 * 
 * This interface is primarily exported by the data objects used with drag-and-drop and Clipboard operations. Typically, such operations are synchronous. However, if data rendering will be time-consuming, <b>IDataObjectAsyncCapability</b> can be used to allow data extraction to take place on a background thread. See the <i>Dragging and Dropping Shell Objects Asynchronously</i> section of <a href="https://docs.microsoft.com/windows/desktop/shell/datascenarios">Handling Shell Data Transfer Scenarios</a> for a detailed discussion of how to use this interface.
 * 
 * Drop sources and targets use this interface when they wish to have a lengthy data extraction process handled by a background thread.
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/nn-shldisp-idataobjectasynccapability
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDataObjectAsyncCapability extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDataObjectAsyncCapability
     * @type {Guid}
     */
    static IID => Guid("{3d8b0590-f691-11d2-8ea9-006097df5bd4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetAsyncMode", "GetAsyncMode", "StartOperation", "InOperation", "EndOperation"]

    /**
     * Called by a drop source to specify whether the data object supports asynchronous data extraction.
     * @remarks
     * This method is called by the drop source to indicate that the data object supports asynchronous data extraction. Store the <i>fDoOpAsync</i> for later use by <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-getasyncmode">IDataObjectAsyncCapability::GetAsyncMode</a>. The drop target determines whether asynchronous data extraction is supported by calling <b>IDataObjectAsyncCapability::GetAsyncMode</b> to retrieve the <i>fDoOpAsync</i> value.
     * 
     * If <i>fDoOpAsync</i> is set to <b>VARIANT_TRUE</b>, <b>SetAsyncMode</b> must call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-addref">IDataObjectAsyncCapability::AddRef</a>, and store the interface pointer for use by <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-endoperation">IDataObjectAsyncCapability::EndOperation</a>.
     * @param {BOOL} fDoOpAsync Type: <b>BOOL</b>
     * 
     * <b>VARIANT_TRUE</b> if an asynchronous operation is supported; otherwise, <b>VARIANT_FALSE</b>. The default value is <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-setasyncmode
     */
    SetAsyncMode(fDoOpAsync) {
        result := ComCall(3, this, "int", fDoOpAsync, "HRESULT")
        return result
    }

    /**
     * Called by a drop target to determine whether the data object supports asynchronous data extraction.
     * @remarks
     * The purpose of this method is to give the drop target the value of the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-setasyncmode">IDataObjectAsyncCapability::SetAsyncMode</a> method's <i>fDoOpAsync</i> parameter. This parameter is set to <b>VARIANT_FALSE</b> by default. If the data object supports asynchronous data extraction, it must call <b>IDataObjectAsyncCapability::SetAsyncMode</b> and set <i>fDoOpAsync</i> to <b>VARIANT_TRUE</b>.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>VARIANT_TRUE</b> if an asynchronous operation is supported; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-getasyncmode
     */
    GetAsyncMode() {
        result := ComCall(4, this, "int*", &pfIsOpAsync := 0, "HRESULT")
        return pfIsOpAsync
    }

    /**
     * Called by a drop target to indicate that asynchronous data extraction is starting.
     * @remarks
     * The drop target calls this method to notify the data object that asynchronous data extraction is starting. The method should store this information so that it can be returned by <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-inoperation">IDataObjectAsyncCapability::InOperation</a>. Once <b>StartOperation</b> has been called, the drop target returns the <a href="https://docs.microsoft.com/windows/desktop/api/oleidl/nf-oleidl-idroptarget-drop">IDropTarget::Drop</a> call as it would for normal synchronous data extraction.
     * @param {IBindCtx} pbcReserved Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * Reserved. Set this value to <b>nullptr</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-startoperation
     */
    StartOperation(pbcReserved) {
        result := ComCall(5, this, "ptr", pbcReserved, "HRESULT")
        return result
    }

    /**
     * Called by the drop source to determine whether the target is extracting data asynchronously.
     * @remarks
     * This method is called by the drop source after <a href="https://docs.microsoft.com/windows/desktop/api/ole2/nf-ole2-dodragdrop">DoDragDrop</a> returns. The <i>pfInAsyncOp</i> parameter should be set to <b>VARIANT_TRUE</b> only if the drop target has called <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-startoperation">IDataObjectAsyncCapability::StartOperation</a>.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>VARIANT_TRUE</b> if data extraction is being handled asynchronously; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-inoperation
     */
    InOperation() {
        result := ComCall(6, this, "int*", &pfInAsyncOp := 0, "HRESULT")
        return pfInAsyncOp
    }

    /**
     * Notifies the data object that the asynchronous data extraction has ended.
     * @remarks
     * <b>EndOperation</b> retrieves the <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nn-shldisp-idataobjectasynccapability">IDataObjectAsyncCapability</a> pointer stored by <a href="https://docs.microsoft.com/windows/desktop/api/shldisp/nf-shldisp-idataobjectasynccapability-setasyncmode">IDataObjectAsyncCapability::SetAsyncMode</a> and passes its parameter values to that interface's <b>IDataObjectAsyncCapability::EndOperation</b> method. <b>EndOperation</b> then releases the <b>IDataObjectAsyncCapability</b> pointer.
     * 
     * <b>EndOperation</b> is also responsible for any associated clean-up operations. When finished, <b>EndOperation</b> should notify the drop source through a private interface.
     * @param {HRESULT} _hResult 
     * @param {IBindCtx} pbcReserved Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * Reserved. Set to <b>nullptr</b>.
     * @param {Integer} dwEffects Type: <b>DWORD</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> value that indicates the result of an optimized move. This should be the same value that would be passed to the data object as a CFSTR_PERFORMEDDROPEFFECT format with a normal data extraction operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-endoperation
     */
    EndOperation(_hResult, pbcReserved, dwEffects) {
        result := ComCall(7, this, "int", _hResult, "ptr", pbcReserved, "uint", dwEffects, "HRESULT")
        return result
    }
}
