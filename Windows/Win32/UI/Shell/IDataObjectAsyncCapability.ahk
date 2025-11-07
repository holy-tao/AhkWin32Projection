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
     * 
     * @param {BOOL} fDoOpAsync 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-setasyncmode
     */
    SetAsyncMode(fDoOpAsync) {
        result := ComCall(3, this, "int", fDoOpAsync, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-getasyncmode
     */
    GetAsyncMode() {
        result := ComCall(4, this, "int*", &pfIsOpAsync := 0, "HRESULT")
        return pfIsOpAsync
    }

    /**
     * 
     * @param {IBindCtx} pbcReserved 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-startoperation
     */
    StartOperation(pbcReserved) {
        result := ComCall(5, this, "ptr", pbcReserved, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-inoperation
     */
    InOperation() {
        result := ComCall(6, this, "int*", &pfInAsyncOp := 0, "HRESULT")
        return pfInAsyncOp
    }

    /**
     * 
     * @param {HRESULT} hResult 
     * @param {IBindCtx} pbcReserved 
     * @param {Integer} dwEffects 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shldisp/nf-shldisp-idataobjectasynccapability-endoperation
     */
    EndOperation(hResult, pbcReserved, dwEffects) {
        result := ComCall(7, this, "int", hResult, "ptr", pbcReserved, "uint", dwEffects, "HRESULT")
        return result
    }
}
