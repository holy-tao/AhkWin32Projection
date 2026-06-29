#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IWdsTransportCacheable.ahk" { IWdsTransportCacheable }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Represents the diagnostics policy part of the WDS transport server's configuration.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportdiagnosticspolicy
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportDiagnosticsPolicy extends IWdsTransportCacheable {
    /**
     * The interface identifier for IWdsTransportDiagnosticsPolicy
     * @type {Guid}
     */
    static IID := Guid("{13b33efc-7856-4f61-9a59-8de67b6b87b6}")

    /**
     * The class identifier for WdsTransportDiagnosticsPolicy
     * @type {Guid}
     */
    static CLSID := Guid("{eb3333e1-a7ad-46f5-80d6-6b740204e509}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportDiagnosticsPolicy interfaces
    */
    struct Vtbl extends IWdsTransportCacheable.Vtbl {
        get_Enabled    : IntPtr
        put_Enabled    : IntPtr
        get_Components : IntPtr
        put_Components : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportDiagnosticsPolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {Integer} 
     */
    Components {
        get => this.get_Components()
        set => this.put_Components(value)
    }

    /**
     * Receives or sets a value that enables a WDS client to configure diagnostic logging on the server. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-get_enabled
     */
    get_Enabled() {
        result := ComCall(11, this, VARIANT_BOOL.Ptr, &pbEnabled := 0, "HRESULT")
        return pbEnabled
    }

    /**
     * Receives or sets a value that enables a WDS client to configure diagnostic logging on the server. (Put)
     * @param {VARIANT_BOOL} bEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-put_enabled
     */
    put_Enabled(bEnabled) {
        result := ComCall(12, this, VARIANT_BOOL, bEnabled, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client to configure which WDS transport components have event logging. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-get_components
     */
    get_Components() {
        result := ComCall(13, this, "uint*", &pulComponents := 0, "HRESULT")
        return pulComponents
    }

    /**
     * Enables a WDS client to configure which WDS transport components have event logging. (Put)
     * @param {Integer} ulComponents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportdiagnosticspolicy-put_components
     */
    put_Components(ulComponents) {
        result := ComCall(14, this, "uint", ulComponents, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportDiagnosticsPolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_Components := CallbackCreate(GetMethod(implObj, "get_Components"), flags, 2)
        this.vtbl.put_Components := CallbackCreate(GetMethod(implObj, "put_Components"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_Components)
        CallbackFree(this.vtbl.put_Components)
    }
}
