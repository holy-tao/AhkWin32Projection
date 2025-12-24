#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\INetFwRules.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Access to the Windows Service Hardening networking rules.
 * @remarks
 * 
 * When adding rules, note that there may be a small time lag before the newly-added rule is applied.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//netfw/nn-netfw-inetfwservicerestriction
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetFwServiceRestriction extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetFwServiceRestriction
     * @type {Guid}
     */
    static IID => Guid("{8267bbe3-f890-491c-b7b6-2db1ef0e5d2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RestrictService", "ServiceRestricted", "get_Rules"]

    /**
     * @type {INetFwRules} 
     */
    Rules {
        get => this.get_Rules()
    }

    /**
     * The RestrictService method turns service restriction on or off for a given service.
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
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservicerestriction-restrictservice
     */
    RestrictService(serviceName, appName, restrictService, serviceSidRestricted) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(7, this, "ptr", serviceName, "ptr", appName, "short", restrictService, "short", serviceSidRestricted, "HRESULT")
        return result
    }

    /**
     * The ServiceRestricted method indicates whether service restriction rules are enabled to limit traffic to the resources specified by the firewall rules.
     * @param {BSTR} serviceName Name of the service being queried concerning service restriction state.
     * @param {BSTR} appName Name of the application being queried concerning service restriction state.
     * @returns {VARIANT_BOOL} Indicates whether service restriction rules are in place to restrict the specified service.  If true (<b>VARIANT_TRUE</b>), service is restricted.  Otherwise, service is not restricted to the resources specified by firewall rules.
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservicerestriction-servicerestricted
     */
    ServiceRestricted(serviceName, appName) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(8, this, "ptr", serviceName, "ptr", appName, "short*", &serviceRestricted := 0, "HRESULT")
        return serviceRestricted
    }

    /**
     * Retrieves the collection of Windows Service Hardening networking rules.
     * @returns {INetFwRules} 
     * @see https://docs.microsoft.com/windows/win32/api//netfw/nf-netfw-inetfwservicerestriction-get_rules
     */
    get_Rules() {
        result := ComCall(9, this, "ptr*", &rules := 0, "HRESULT")
        return INetFwRules(rules)
    }
}
