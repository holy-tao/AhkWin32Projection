#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IPortableDeviceServiceMethodCallback.ahk" { IPortableDeviceServiceMethodCallback }
#Import ".\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Invokes, or cancels invocation of, a method on a service.
 * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethods
 * @namespace Windows.Win32.Devices.PortableDevices
 */
export default struct IPortableDeviceServiceMethods extends IUnknown {
    /**
     * The interface identifier for IPortableDeviceServiceMethods
     * @type {Guid}
     */
    static IID := Guid("{e20333c9-fd34-412d-a381-cc6f2d820df7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IPortableDeviceServiceMethods interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Invoke      : IntPtr
        InvokeAsync : IntPtr
        Cancel      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IPortableDeviceServiceMethods.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Synchronously invokes a method.
     * @remarks
     * The method invocation is synchronous and will not return until the method has completed. For long-running methods, your application should call the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invokeasync">InvokeAsync</a> method instead.
     * @param {Pointer<Guid>} Method The method to invoke.
     * @param {IPortableDeviceValues} pParameters A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the parameters of the invoked method, or <b>NULL</b> to indicate that the method has no parameters.
     * @param {Pointer<IPortableDeviceValues>} ppResults The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that receives the method results, or <b>NULL</b> to ignore the method results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invoke
     */
    Invoke(Method, pParameters, ppResults) {
        result := ComCall(3, this, Guid.Ptr, Method, "ptr", pParameters, IPortableDeviceValues.Ptr, ppResults, "HRESULT")
        return result
    }

    /**
     * Asynchronously invokes a method.
     * @remarks
     * When invoking multiple methods, clients can create a separate instance of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback">IPortableDeviceServiceMethodCallback</a> interface for each invocation, saving a context with that instance object before passing it to the <b>InvokeAsync</b> method. This way, the method operation can be identified when the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethodcallback-oncomplete">OnComplete</a>  method is called. Use of a unique object for each invocation also allows targeted cancellation of an operation by the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-cancel">Cancel</a> method.
     * @param {Pointer<Guid>} Method The method to invoke.
     * @param {IPortableDeviceValues} pParameters A pointer to an <a href="https://docs.microsoft.com/windows/desktop/wpd_sdk/iportabledevicevalues">IPortableDeviceValues</a> interface that contains the parameters of the invoked method, or <b>NULL</b> to indicate that the method has no parameters.
     * @param {IPortableDeviceServiceMethodCallback} pCallback A pointer to an application-supplied <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback">IPortableDeviceServiceMethodCallback</a> callback object that  receives the method results, or <b>NULL</b> to ignore the method results.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invokeasync
     */
    InvokeAsync(Method, pParameters, pCallback) {
        result := ComCall(4, this, Guid.Ptr, Method, "ptr", pParameters, "ptr", pCallback, "HRESULT")
        return result
    }

    /**
     * Cancels a pending method invocation.
     * @remarks
     * A callback object identifies a method invocation. If the same callback object is reused for multiple calls to the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invokeasync">InvokeAsync</a> method, all method invocations arising from these calls will be cancelled.
     * 
     * To enable targeted cancellation of a specific method invocation, pass a unique instance of the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nn-portabledeviceapi-iportabledeviceservicemethodcallback">IPortableDeviceServiceMethodCallback</a> interface to the <a href="https://docs.microsoft.com/windows/desktop/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-invokeasync">InvokeAsync</a> method.
     * @param {IPortableDeviceServiceMethodCallback} pCallback A pointer to the callback object whose method invocation is to be canceled, or <b>NULL</b> to cancel all pending method invocations.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>. Any other <b>HRESULT</b> value indicates that the call failed.
     * @see https://learn.microsoft.com/windows/win32/api/portabledeviceapi/nf-portabledeviceapi-iportabledeviceservicemethods-cancel
     */
    Cancel(pCallback) {
        result := ComCall(5, this, "ptr", pCallback, "HRESULT")
        return result
    }

    Query(iid) {
        if (IPortableDeviceServiceMethods.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invoke := CallbackCreate(GetMethod(implObj, "Invoke"), flags, 4)
        this.vtbl.InvokeAsync := CallbackCreate(GetMethod(implObj, "InvokeAsync"), flags, 4)
        this.vtbl.Cancel := CallbackCreate(GetMethod(implObj, "Cancel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invoke)
        CallbackFree(this.vtbl.InvokeAsync)
        CallbackFree(this.vtbl.Cancel)
    }
}
