#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CALLFRAMEINFO.ahk" { CALLFRAMEINFO }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Invokes an object with an indirect reference to the invocations arguments, rather than the traditional direct call.
 * @remarks
 * The actual detailed semantics of how to carry out an indirect call are independent of the <b>ICallIndirect</b> interface itself; they are instead specific to the implementation of the interface. For example, implementations of <b>ICallIndirect</b> found in call interceptors carry out the call by constructing and appropriate <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframe">ICallFrame</a> instance and then invoking <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframeevents-oncall">ICallFrameEvents::OnCall</a> in the registered sink. Other implementations might do some appropriate munging of the invocations arguments, then forward the call on to some actual specific object, presumably one previously registered with the <b>ICallIndirect</b> using some implementation-specific means.
 * @see https://learn.microsoft.com/windows/win32/api/callobj/nn-callobj-icallindirect
 * @namespace Windows.Win32.System.Com.CallObj
 */
export default struct ICallIndirect extends IUnknown {
    /**
     * The interface identifier for ICallIndirect
     * @type {Guid}
     */
    static IID := Guid("{d573b4b1-894e-11d2-b8b6-00c04fb9618a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ICallIndirect interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CallIndirect  : IntPtr
        GetMethodInfo : IntPtr
        GetStackSize  : IntPtr
        GetIID        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ICallIndirect.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Invokes one of the methods in the interface with an indirect reference to the arguments of the invocation.
     * @param {Pointer<HRESULT>} phrReturn The value returned from the invocation of the method.
     * @param {Integer} iMethod The method number to be invoked.
     * @param {Pointer<Void>} pvArgs A pointer to the stack frame with which to make the invocation. Details of the exact representation of this stack frame are processor-architecture specific.
     * @param {Pointer<Integer>} cbArgs The number of bytes to be popped from the stack to clear the stack of arguments to this invocation.
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
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-callindirect
     */
    CallIndirect(phrReturn, iMethod, pvArgs, cbArgs) {
        phrReturnMarshal := phrReturn is VarRef ? "int*" : "ptr"
        pvArgsMarshal := pvArgs is VarRef ? "ptr" : "ptr"
        cbArgsMarshal := cbArgs is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, phrReturnMarshal, phrReturn, "uint", iMethod, pvArgsMarshal, pvArgs, cbArgsMarshal, cbArgs, "HRESULT")
        return result
    }

    /**
     * Retrieves information about the interface method from the call frame.
     * @remarks
     * The information returned is a static analysis of the method, not a dynamic one, in that it is based on an analysis of the method signature only, not the actual current contents of the call frame. For example, the static analysis might indicate that this method has the potential of having an in-interface, but because of, say, a union switch, a given call might not actually have any such interfaces. This method is equivalent to the <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframe-getinfo">GetInfo</a> and <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nf-callobj-icallframe-getnames">GetNames</a> methods in <a href="https://docs.microsoft.com/windows/desktop/api/callobj/nn-callobj-icallframe">ICallFrame</a>, but avoids the need to actually make any invocation to get the information.
     * @param {Integer} iMethod The method number.
     * @param {Pointer<CALLFRAMEINFO>} pInfo A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/callobj/ns-callobj-callframeinfo">CALLFRAMEINFO</a> structure containing information about the specified method.
     * @param {Pointer<PWSTR>} pwszMethod The method name. This parameter is optional.
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
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getmethodinfo
     */
    GetMethodInfo(iMethod, pInfo, pwszMethod) {
        pwszMethodMarshal := pwszMethod is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "uint", iMethod, CALLFRAMEINFO.Ptr, pInfo, pwszMethodMarshal, pwszMethod, "HRESULT")
        return result
    }

    /**
     * Retrieves the number of bytes that should be popped from the stack in order to return from an invocation of the method.
     * @param {Integer} iMethod The method number.
     * @returns {Integer} The number of bytes to be popped from the stack to clear the stack of arguments to an invocation.
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getstacksize
     */
    GetStackSize(iMethod) {
        result := ComCall(5, this, "uint", iMethod, "uint*", &cbArgs := 0, "HRESULT")
        return cbArgs
    }

    /**
     * Retrieves the interface id supported by this ICallIndirect implementation.
     * @param {Pointer<Guid>} piid A pointer to the interface. This parameter is optional.
     * @param {Pointer<BOOL>} pfDerivesFromIDispatch Indicates whether the interface is derived from <b>IDispatch</b>. This parameter is optional.
     * @param {Pointer<Integer>} pcMethod Receives the number of methods in the interface.
     * @param {Pointer<PWSTR>} pwszInterface Receives the interface name if it is available.
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
     * @see https://learn.microsoft.com/windows/win32/api/callobj/nf-callobj-icallindirect-getiid
     */
    GetIID(piid, pfDerivesFromIDispatch, pcMethod, pwszInterface) {
        pfDerivesFromIDispatchMarshal := pfDerivesFromIDispatch is VarRef ? "int*" : "ptr"
        pcMethodMarshal := pcMethod is VarRef ? "uint*" : "ptr"
        pwszInterfaceMarshal := pwszInterface is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, Guid.Ptr, piid, pfDerivesFromIDispatchMarshal, pfDerivesFromIDispatch, pcMethodMarshal, pcMethod, pwszInterfaceMarshal, pwszInterface, "HRESULT")
        return result
    }

    Query(iid) {
        if (ICallIndirect.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CallIndirect := CallbackCreate(GetMethod(implObj, "CallIndirect"), flags, 5)
        this.vtbl.GetMethodInfo := CallbackCreate(GetMethod(implObj, "GetMethodInfo"), flags, 4)
        this.vtbl.GetStackSize := CallbackCreate(GetMethod(implObj, "GetStackSize"), flags, 3)
        this.vtbl.GetIID := CallbackCreate(GetMethod(implObj, "GetIID"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CallIndirect)
        CallbackFree(this.vtbl.GetMethodInfo)
        CallbackFree(this.vtbl.GetStackSize)
        CallbackFree(this.vtbl.GetIID)
    }
}
