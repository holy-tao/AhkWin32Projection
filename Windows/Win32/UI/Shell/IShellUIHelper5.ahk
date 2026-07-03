#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }
#Import ".\IShellUIHelper4.ahk" { IShellUIHelper4 }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper5 extends IShellUIHelper4 {
    /**
     * The interface identifier for IShellUIHelper5
     * @type {Guid}
     */
    static IID := Guid("{a2a08b09-103d-4d3f-b91c-ea455ca82efa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper5 interfaces
    */
    struct Vtbl extends IShellUIHelper4.Vtbl {
        msProvisionNetworks        : IntPtr
        msReportSafeUrl            : IntPtr
        msSiteModeRefreshBadge     : IntPtr
        msSiteModeClearBadge       : IntPtr
        msDiagnoseConnectionUILess : IntPtr
        msLaunchNetworkClientHelp  : IntPtr
        msChangeDefaultBrowser     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper5.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} bstrProvisioningXml 
     * @returns {VARIANT} 
     */
    msProvisionNetworks(bstrProvisioningXml) {
        bstrProvisioningXml := bstrProvisioningXml is String ? BSTR.Alloc(bstrProvisioningXml).Value : bstrProvisioningXml

        puiResult := VARIANT()
        result := ComCall(67, this, BSTR, bstrProvisioningXml, VARIANT.Ptr, puiResult, "HRESULT")
        return puiResult
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msReportSafeUrl() {
        result := ComCall(68, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeRefreshBadge() {
        result := ComCall(69, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msSiteModeClearBadge() {
        result := ComCall(70, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msDiagnoseConnectionUILess() {
        result := ComCall(71, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    msLaunchNetworkClientHelp() {
        result := ComCall(72, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fChange 
     * @returns {HRESULT} 
     */
    msChangeDefaultBrowser(fChange) {
        result := ComCall(73, this, VARIANT_BOOL, fChange, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellUIHelper5.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.msProvisionNetworks := CallbackCreate(GetMethod(implObj, "msProvisionNetworks"), flags, 3)
        this.vtbl.msReportSafeUrl := CallbackCreate(GetMethod(implObj, "msReportSafeUrl"), flags, 1)
        this.vtbl.msSiteModeRefreshBadge := CallbackCreate(GetMethod(implObj, "msSiteModeRefreshBadge"), flags, 1)
        this.vtbl.msSiteModeClearBadge := CallbackCreate(GetMethod(implObj, "msSiteModeClearBadge"), flags, 1)
        this.vtbl.msDiagnoseConnectionUILess := CallbackCreate(GetMethod(implObj, "msDiagnoseConnectionUILess"), flags, 1)
        this.vtbl.msLaunchNetworkClientHelp := CallbackCreate(GetMethod(implObj, "msLaunchNetworkClientHelp"), flags, 1)
        this.vtbl.msChangeDefaultBrowser := CallbackCreate(GetMethod(implObj, "msChangeDefaultBrowser"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.msProvisionNetworks)
        CallbackFree(this.vtbl.msReportSafeUrl)
        CallbackFree(this.vtbl.msSiteModeRefreshBadge)
        CallbackFree(this.vtbl.msSiteModeClearBadge)
        CallbackFree(this.vtbl.msDiagnoseConnectionUILess)
        CallbackFree(this.vtbl.msLaunchNetworkClientHelp)
        CallbackFree(this.vtbl.msChangeDefaultBrowser)
    }
}
