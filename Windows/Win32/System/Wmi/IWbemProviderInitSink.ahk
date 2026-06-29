#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemProviderInitSink interface is implemented by WMI and called by providers to report initialization status.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemproviderinitsink
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemProviderInitSink extends IUnknown {
    /**
     * The interface identifier for IWbemProviderInitSink
     * @type {Guid}
     */
    static IID := Guid("{1be41571-91dd-11d1-aeb2-00c04fb68820}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemProviderInitSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetStatus : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemProviderInitSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemProviderInitSink::SetStatus method indicates to Windows Management whether a provider is fully or partially initialized.
     * @remarks
     * All types of providers call 
     * <b>IWbemProviderInitSink::SetStatus</b> to indicate initialization status to Windows Management.
     * 
     * If <i>lStatus</i> is set to <b>WBEM_S_INITIALIZED</b>, Windows Management expects the provider to be fully capable of immediately servicing requests.
     * @param {Integer} lStatus 
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @returns {HRESULT} This method always returns <b>WBEM_S_NO_ERROR</b>.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemproviderinitsink-setstatus
     */
    SetStatus(lStatus, lFlags) {
        result := ComCall(3, this, "int", lStatus, "int", lFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemProviderInitSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetStatus := CallbackCreate(GetMethod(implObj, "SetStatus"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetStatus)
    }
}
