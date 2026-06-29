#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ComCallData.ahk" { ComCallData }
#Import ".\IUnknown.ahk" { IUnknown }

/**
 * Provides a mechanism to execute a function inside a specific COM+ object context.
 * @remarks
 * An instance of this interface for the current context can be obtained using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cogetobjectcontext">CoGetObjectContext</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ctxtcall/nn-ctxtcall-icontextcallback
 * @namespace Windows.Win32.System.Com
 */
export default struct IContextCallback extends IUnknown {
    /**
     * The interface identifier for IContextCallback
     * @type {Guid}
     */
    static IID := Guid("{000001da-0000-0000-c000-000000000046}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IContextCallback interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ContextCallback : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IContextCallback.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Enters the object context, executes the specified function, and returns.
     * @remarks
     * This method simulates a method call on an object inside the context. It is intended for low-level operations, such as cleanup/lazy marshaling, that respect the application's reentrancy expectations. 
     * 
     * To give the infrastructure information, an interface and method number must be specified. The parameter <i>riid</i> must not be IID_IUnknown, and the method number must not be less than 3.
     * 
     * If <i>riid</i> is set to IID_IEnterActivityWithNoLock, the function is executed without an activity lock.
     * 
     * If <i>riid</i> is set to IID_ICallbackWithNoReentrancyToApplicationSTA, the function does not reenter an ASTA arbitrarily. Most apps should set <i>riid</i> to this values for general purpose use.
     * @param {Pointer<PFNCONTEXTCALL>} _pfnCallback The function to be called inside the object context.
     * @param {Pointer<ComCallData>} pParam The data to be passed to the function when it is called in the context.
     * @param {Pointer<Guid>} riid The IID of the call that is being simulated. See Remarks for more information.
     * @param {Integer} iMethod The method number of the call that is being simulated. See Remarks for more information.
     * @param {IUnknown} pUnk This parameter is reserved and must be <b>NULL</b>.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, and E_FAIL. If none of these failures occur, the return value of this function is the <b>HRESULT</b> value returned by the <i>pfnCallback</i> function.
     * @see https://learn.microsoft.com/windows/win32/api/ctxtcall/nf-ctxtcall-icontextcallback-contextcallback
     */
    ContextCallback(_pfnCallback, pParam, riid, iMethod, pUnk) {
        result := ComCall(3, this, "ptr", _pfnCallback, ComCallData.Ptr, pParam, Guid.Ptr, riid, "int", iMethod, "ptr", pUnk, "HRESULT")
        return result
    }

    Query(iid) {
        if (IContextCallback.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ContextCallback := CallbackCreate(GetMethod(implObj, "ContextCallback"), flags, 6)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ContextCallback)
    }
}
