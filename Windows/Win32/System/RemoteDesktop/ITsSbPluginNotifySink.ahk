#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ITsSbBaseNotifySink.ahk" { ITsSbBaseNotifySink }

/**
 * Exposes methods that notify Remote Desktop Connection Broker (RD Connection Broker) about initialization or termination of a plug-in.
 * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nn-sbtsv-itssbpluginnotifysink
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct ITsSbPluginNotifySink extends ITsSbBaseNotifySink {
    /**
     * The interface identifier for ITsSbPluginNotifySink
     * @type {Guid}
     */
    static IID := Guid("{44dfe30b-c3be-40f5-bf82-7a95bb795adf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITsSbPluginNotifySink interfaces
    */
    struct Vtbl extends ITsSbBaseNotifySink.Vtbl {
        OnInitialized : IntPtr
        OnTerminated  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITsSbPluginNotifySink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the plug-in has completed a call of Initialize.
     * @remarks
     * Plug-ins should call this method after they complete their initialization process.
     * @param {HRESULT} hr Specifies the result of the call to <a href="https://docs.microsoft.com/windows/desktop/api/sbtsv/nf-sbtsv-itssbplugin-initialize">Initialize</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbpluginnotifysink-oninitialized
     */
    OnInitialized(hr) {
        result := ComCall(5, this, "int", hr, "HRESULT")
        return result
    }

    /**
     * Notifies Remote Desktop Connection Broker (RD Connection Broker) that the plug-in has completed a call of Terminate.
     * @remarks
     * Plug-ins should call this method after they complete their termination process or after throwing a fatal exception.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sbtsv/nf-sbtsv-itssbpluginnotifysink-onterminated
     */
    OnTerminated() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITsSbPluginNotifySink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnInitialized := CallbackCreate(GetMethod(implObj, "OnInitialized"), flags, 2)
        this.vtbl.OnTerminated := CallbackCreate(GetMethod(implObj, "OnTerminated"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnInitialized)
        CallbackFree(this.vtbl.OnTerminated)
    }
}
