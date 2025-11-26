#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Enables interfaces that are usually synchronous to function asynchronously.
 * @remarks
 * 
 * <b>IDataObjectAsyncCapability</b> is an optional interface that is implemented by a data object. It allows the drop target to negotiate with the drop source to extract data from the data object asynchronously.
 * 
 * This interface is primarily exported by the data objects used with drag-and-drop and Clipboard operations. Typically, such operations are synchronous. However, if data rendering will be time-consuming, <b>IDataObjectAsyncCapability</b> can be used to allow data extraction to take place on a background thread. See the <i>Dragging and Dropping Shell Objects Asynchronously</i> section of <a href="https://docs.microsoft.com/windows/desktop/shell/datascenarios">Handling Shell Data Transfer Scenarios</a> for a detailed discussion of how to use this interface.
 * 
 * Drop sources and targets use this interface when they wish to have a lengthy data extraction process handled by a background thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shldisp/nn-shldisp-idataobjectasynccapability
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
     * @param {BOOL} fDoOpAsync Type: <b>BOOL</b>
     * 
     * <b>VARIANT_TRUE</b> if an asynchronous operation is supported; otherwise, <b>VARIANT_FALSE</b>. The default value is <b>VARIANT_FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-idataobjectasynccapability-setasyncmode
     */
    SetAsyncMode(fDoOpAsync) {
        result := ComCall(3, this, "int", fDoOpAsync, "HRESULT")
        return result
    }

    /**
     * Called by a drop target to determine whether the data object supports asynchronous data extraction.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>VARIANT_TRUE</b> if an asynchronous operation is supported; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-idataobjectasynccapability-getasyncmode
     */
    GetAsyncMode() {
        result := ComCall(4, this, "int*", &pfIsOpAsync := 0, "HRESULT")
        return pfIsOpAsync
    }

    /**
     * Called by a drop target to indicate that asynchronous data extraction is starting.
     * @param {IBindCtx} pbcReserved Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * Reserved. Set this value to <b>nullptr</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-idataobjectasynccapability-startoperation
     */
    StartOperation(pbcReserved) {
        result := ComCall(5, this, "ptr", pbcReserved, "HRESULT")
        return result
    }

    /**
     * Called by the drop source to determine whether the target is extracting data asynchronously.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * <b>VARIANT_TRUE</b> if data extraction is being handled asynchronously; otherwise, <b>VARIANT_FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-idataobjectasynccapability-inoperation
     */
    InOperation() {
        result := ComCall(6, this, "int*", &pfInAsyncOp := 0, "HRESULT")
        return pfInAsyncOp
    }

    /**
     * Notifies the data object that the asynchronous data extraction has ended.
     * @param {HRESULT} hResult Type: <b>HRESULT</b>
     * 
     * Indicates the outcome of the data extraction. Set this value to S_OK if successful, or a COM error code otherwise.
     * @param {IBindCtx} pbcReserved Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-ibindctx">IBindCtx</a>*</b>
     * 
     * Reserved. Set to <b>nullptr</b>.
     * @param {Integer} dwEffects Type: <b>DWORD</b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/com/dropeffect-constants">DROPEFFECT</a> value that indicates the result of an optimized move. This should be the same value that would be passed to the data object as a CFSTR_PERFORMEDDROPEFFECT format with a normal data extraction operation.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shldisp/nf-shldisp-idataobjectasynccapability-endoperation
     */
    EndOperation(hResult, pbcReserved, dwEffects) {
        result := ComCall(7, this, "int", hResult, "ptr", pbcReserved, "uint", dwEffects, "HRESULT")
        return result
    }
}
