#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWbemClassObject.ahk" { IWbemClassObject }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWbemProviderIdentity interface is implemented by an event provider if the provider registers itself using more than one Name (multiple instances of __Win32Provider) with the same CLSID value.
 * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nn-wbemprov-iwbemprovideridentity
 * @namespace Windows.Win32.System.Wmi
 */
export default struct IWbemProviderIdentity extends IUnknown {
    /**
     * The interface identifier for IWbemProviderIdentity
     * @type {Guid}
     */
    static IID := Guid("{631f7d97-d993-11d2-b339-00105a1f4aaf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWbemProviderIdentity interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetRegistrationObject : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWbemProviderIdentity.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The IWbemProviderIdentity::SetRegistrationObject method is called by the Windows Management service prior to initializing an event provider (if the provider implements IWbemProviderIdentity).
     * @remarks
     * Any <b>HRESULT</b> return code other than <b>WBEM_S_NO_ERROR</b> indicates a provider failure.
     * @param {Integer} lFlags Reserved. This parameter must be 0 (zero).
     * @param {IWbemClassObject} pProvReg Instance of 
     * <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/--win32provider">__Win32Provider</a> that announces the provider's name and <b>CLSID</b>.
     * @returns {HRESULT} This method returns an <b>HRESULT</b> with one of the following values.
     * @see https://learn.microsoft.com/windows/win32/api/wbemprov/nf-wbemprov-iwbemprovideridentity-setregistrationobject
     */
    SetRegistrationObject(lFlags, pProvReg) {
        result := ComCall(3, this, "int", lFlags, "ptr", pProvReg, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWbemProviderIdentity.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRegistrationObject := CallbackCreate(GetMethod(implObj, "SetRegistrationObject"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRegistrationObject)
    }
}
