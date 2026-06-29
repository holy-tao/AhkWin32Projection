#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\ICallFrame.ahk" { ICallFrame }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Delivers method call notifications.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/nn-callobj-icallframeevents
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct ICallFrameEvents extends IUnknown {
    /**
     * The interface identifier for ICallFrameEvents
     * @type {Guid}
     */
    static IID := Guid("{fd5e0843-fc91-11d0-97d7-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallFrameEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnCall : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallFrameEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Informs the event sink if it receives a method call on the interceptor. The sink is provided with an ICallFrame instance which is bound to the intercepted incoming method invocation. Through that sink the call frame can be manipulated in various ways.
     * @remarks
     * On return from <b>OnCall</b>, the interceptor assumes that by some means the out-values of the method have been appropriately initialized as needed, if any; the interceptor does not itself manipulate the call frame further in any way. Typically, the <b>OnCall</b> implementation will have set the out-values by some means, either by invoking the call frame on an object, successfully unmarshalling some previously marshaled out-values, or clearing them with <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframe-free">ICallFrame::Free</a>.
     * 
     * The return value should also have been appropriately set during the call in a similar manner. See <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframe-setreturnvalue">ICallFrame::SetReturnValue</a>.
     * @param {ICallFrame} pFrame A call frame bound to the just-received invocation.
     * @returns {HRESULT} This method can return the following values.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unexpected error has occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallframeevents-oncall
     */
    OnCall(pFrame) {
        result := ComCall(3, this, "ptr", pFrame, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICallFrameEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnCall := CallbackCreate(GetMethod(implObj, "OnCall"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnCall)
    }
}
