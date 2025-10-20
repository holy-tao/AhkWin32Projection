#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQueueCommand interface queues a command for processing at a designated time.
 * @see https://docs.microsoft.com/windows/win32/api//control/nn-control-iqueuecommand
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQueueCommand extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQueueCommand
     * @type {Guid}
     */
    static IID => Guid("{56a868b7-0ad4-11ce-b03a-0020af0ba770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InvokeAtStreamTime", "InvokeAtPresentationTime"]

    /**
     * 
     * @param {Pointer<IDeferredCommand>} pCmd 
     * @param {Float} time 
     * @param {Pointer<Guid>} iid 
     * @param {Integer} dispidMethod 
     * @param {Integer} wFlags 
     * @param {Integer} cArgs 
     * @param {Pointer<VARIANT>} pDispParams 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iqueuecommand-invokeatstreamtime
     */
    InvokeAtStreamTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        result := ComCall(3, this, "ptr*", pCmd, "double", time, "ptr", iid, "int", dispidMethod, "short", wFlags, "int", cArgs, "ptr", pDispParams, "ptr", pvarResult, "short*", puArgErr, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IDeferredCommand>} pCmd 
     * @param {Float} time 
     * @param {Pointer<Guid>} iid 
     * @param {Integer} dispidMethod 
     * @param {Integer} wFlags 
     * @param {Integer} cArgs 
     * @param {Pointer<VARIANT>} pDispParams 
     * @param {Pointer<VARIANT>} pvarResult 
     * @param {Pointer<Integer>} puArgErr 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iqueuecommand-invokeatpresentationtime
     */
    InvokeAtPresentationTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        result := ComCall(4, this, "ptr*", pCmd, "double", time, "ptr", iid, "int", dispidMethod, "short", wFlags, "int", cArgs, "ptr", pDispParams, "ptr", pvarResult, "short*", puArgErr, "HRESULT")
        return result
    }
}
