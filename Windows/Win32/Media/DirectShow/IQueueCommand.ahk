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
     * The InvokeAtStreamTime method queues a method or property change for execution at a specified stream time (that is, presentation time relative to the current stream time offset).
     * @param {Pointer<IDeferredCommand>} pCmd Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ideferredcommand">IDeferredCommand</a> interface pointer.
     * @param {Float} time Time at which to invoke the command.
     * @param {Pointer<Guid>} iid Pointer to the interface identifier (IID) of interface.
     * @param {Integer} dispidMethod Dispatch identifier (DISPID) of a method or property on the interface. Equivalent to the <i>dispIdMember</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Integer} wFlags Flags describing the context of the call. Equivalent to the <i>wFlags</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Integer} cArgs Number of arguments in <i>pDispParams</i>. Equivalent to the <b>cArgs</b> member of the <b>DISPPARAMS</b> structure.
     * @param {Pointer<VARIANT>} pDispParams Pointer to an array that contains the arguments. Equivalent to the <b>rgvarg</b> member of the <b>DISPPARAMS</b> structure.
     * @param {Pointer<VARIANT>} pvarResult Pointer to a VARIANT that receives the result. Equivalent to the <i>pVarResult</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Pointer<Integer>} puArgErr Pointer to a variable that receives the index of the first argument that has an error. Equivalent to the <i>puArgErr</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-iqueuecommand-invokeatstreamtime
     */
    InvokeAtStreamTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, "ptr*", pCmd, "double", time, "ptr", iid, "int", dispidMethod, "short", wFlags, "int", cArgs, "ptr", pDispParams, "ptr", pvarResult, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    /**
     * The InvokeAtPresentationTime method queues a method to be invoked at the specified presentation time.
     * @param {Pointer<IDeferredCommand>} pCmd Address of a variable that receives an <a href="https://docs.microsoft.com/windows/desktop/api/control/nn-control-ideferredcommand">IDeferredCommand</a> interface pointer.
     * @param {Float} time Time at which to invoke the command.
     * @param {Pointer<Guid>} iid Pointer to the interface identifier (IID) of interface.
     * @param {Integer} dispidMethod Dispatch identifier (DISPID) of a method or property on the interface. Equivalent to the <i>dispIdMember</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Integer} wFlags Flags describing the context of the call. Equivalent to the <i>wFlags</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Integer} cArgs Number of arguments in <i>pDispParams</i>. Equivalent to the <b>cArgs</b> member of the <b>DISPPARAMS</b> structure.
     * @param {Pointer<VARIANT>} pDispParams Pointer to an array that contains the arguments. Equivalent to the <b>rgvarg</b> member of the <b>DISPPARAMS</b> structure.
     * @param {Pointer<VARIANT>} pvarResult Pointer a VARIANT that receives the result. Equivalent to the <i>pVarResult</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @param {Pointer<Integer>} puArgErr Pointer to a variable that receives the index of the first argument that has an error. Equivalent to the <i>puArgErr</i> parameter of the <b>IDispatch::Invoke</b> method.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value.
     * @see https://docs.microsoft.com/windows/win32/api//control/nf-control-iqueuecommand-invokeatpresentationtime
     */
    InvokeAtPresentationTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, "ptr*", pCmd, "double", time, "ptr", iid, "int", dispidMethod, "short", wFlags, "int", cArgs, "ptr", pDispParams, "ptr", pvarResult, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }
}
