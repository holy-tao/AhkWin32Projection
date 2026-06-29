#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\INetFwRules.ahk" { INetFwRules }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * Access to the Windows Service Hardening networking rules.
 * @remarks
 * When adding rules, note that there may be a small time lag before the newly-added rule is applied.
 * @see https://learn.microsoft.com/windows/win32/api/netfw/nn-netfw-inetfwservicerestriction
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetFwServiceRestriction extends IDispatch {
    /**
     * The interface identifier for INetFwServiceRestriction
     * @type {Guid}
     */
    static IID := Guid("{8267bbe3-f890-491c-b7b6-2db1ef0e5d2b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetFwServiceRestriction interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        RestrictService   : IntPtr
        ServiceRestricted : IntPtr
        get_Rules         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetFwServiceRestriction.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {INetFwRules} 
     */
    Rules {
        get => this.get_Rules()
    }

    /**
     * The RestrictService method turns service restriction on or off for a given service.
     * @remarks
     * When adding rules, note that there may be a small time lag before the newly-added rule is applied.
     * @param {BSTR} serviceName Name of the service for which service restriction is being turned on or off.
     * @param {BSTR} appName Name of the application for which service restriction is being turned on or off.
     * @param {VARIANT_BOOL} restrictService Indicates whether service restriction is being turned on or off.  If this value is true (<b>VARIANT_TRUE</b>), the service will be restricted when sending or receiving network traffic.  The Windows Service Hardening rules collection can contain rules which can allow this service specific inbound or outbound network access per specific requirements.  If false (<b>VARIANT_FALSE</b>), the service is not restricted by Windows Service Hardening.
     * @param {VARIANT_BOOL} serviceSidRestricted Indicates the type of service SID for the specified service.  If this value is true (<b>VARIANT_TRUE</b>), the service SID will be restricted.  Otherwise, it will be unrestricted.
     * @returns {HRESULT} <h3>C++</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * <h3>VB</h3>
     * If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted due to permissions issues.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed due to an invalid parameter.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-restrictservice
     */
    RestrictService(serviceName, appName, restrictService, serviceSidRestricted) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(7, this, BSTR, serviceName, BSTR, appName, VARIANT_BOOL, restrictService, VARIANT_BOOL, serviceSidRestricted, "HRESULT")
        return result
    }

    /**
     * The ServiceRestricted method indicates whether service restriction rules are enabled to limit traffic to the resources specified by the firewall rules.
     * @param {BSTR} serviceName Name of the service being queried concerning service restriction state.
     * @param {BSTR} appName Name of the application being queried concerning service restriction state.
     * @returns {VARIANT_BOOL} Indicates whether service restriction rules are in place to restrict the specified service.  If true (<b>VARIANT_TRUE</b>), service is restricted.  Otherwise, service is not restricted to the resources specified by firewall rules.
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-servicerestricted
     */
    ServiceRestricted(serviceName, appName) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(8, this, BSTR, serviceName, BSTR, appName, VARIANT_BOOL.Ptr, &serviceRestricted := 0, "HRESULT")
        return serviceRestricted
    }

    /**
     * Retrieves the collection of Windows Service Hardening networking rules.
     * @returns {INetFwRules} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-get_rules
     */
    get_Rules() {
        result := ComCall(9, this, "ptr*", &rules := 0, "HRESULT")
        return INetFwRules(rules)
    }

    Query(iid) {
        if (INetFwServiceRestriction.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RestrictService := CallbackCreate(GetMethod(implObj, "RestrictService"), flags, 5)
        this.vtbl.ServiceRestricted := CallbackCreate(GetMethod(implObj, "ServiceRestricted"), flags, 4)
        this.vtbl.get_Rules := CallbackCreate(GetMethod(implObj, "get_Rules"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RestrictService)
        CallbackFree(this.vtbl.ServiceRestricted)
        CallbackFree(this.vtbl.get_Rules)
    }
}
