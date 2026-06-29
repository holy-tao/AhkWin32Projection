#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IDeferredCommand.ahk" { IDeferredCommand }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * The IQueueCommand interface queues a command for processing at a designated time.
 * @see https://learn.microsoft.com/windows/win32/api/control/nn-control-iqueuecommand
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IQueueCommand extends IUnknown {
    /**
     * The interface identifier for IQueueCommand
     * @type {Guid}
     */
    static IID := Guid("{56a868b7-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IQueueCommand interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InvokeAtStreamTime       : IntPtr
        InvokeAtPresentationTime : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IQueueCommand.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The InvokeAtStreamTime method queues a method or property change for execution at a specified stream time (that is, presentation time relative to the current stream time offset).
     * @remarks
     * Use the <b>IDispatch::GetIDsOfNames</b> method to retrieve the DISPID for the <i>dispidMember</i> parameter.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iqueuecommand-invokeatstreamtime
     */
    InvokeAtStreamTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "short*" : "ptr"

        result := ComCall(3, this, IDeferredCommand.Ptr, pCmd, "double", time, Guid.Ptr, iid, "int", dispidMethod, "short", wFlags, "int", cArgs, VARIANT.Ptr, pDispParams, VARIANT.Ptr, pvarResult, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    /**
     * The InvokeAtPresentationTime method queues a method to be invoked at the specified presentation time.
     * @remarks
     * Use the <b>IDispatch::GetIDsOfNames</b> method to retrieve the DISPID for the <i>dispidMember</i> parameter.
     * 
     * For a code example, see <a href="https://docs.microsoft.com/windows/desktop/api/control/nf-control-iqueuecommand-invokeatstreamtime">IQueueCommand::InvokeAtStreamTime</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/control/nf-control-iqueuecommand-invokeatpresentationtime
     */
    InvokeAtPresentationTime(pCmd, time, iid, dispidMethod, wFlags, cArgs, pDispParams, pvarResult, puArgErr) {
        puArgErrMarshal := puArgErr is VarRef ? "short*" : "ptr"

        result := ComCall(4, this, IDeferredCommand.Ptr, pCmd, "double", time, Guid.Ptr, iid, "int", dispidMethod, "short", wFlags, "int", cArgs, VARIANT.Ptr, pDispParams, VARIANT.Ptr, pvarResult, puArgErrMarshal, puArgErr, "HRESULT")
        return result
    }

    Query(iid) {
        if (IQueueCommand.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InvokeAtStreamTime := CallbackCreate(GetMethod(implObj, "InvokeAtStreamTime"), flags, 10)
        this.vtbl.InvokeAtPresentationTime := CallbackCreate(GetMethod(implObj, "InvokeAtPresentationTime"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InvokeAtStreamTime)
        CallbackFree(this.vtbl.InvokeAtPresentationTime)
    }
}
