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
     * 
     * @param {BSTR} serviceName 
     * @param {BSTR} appName 
     * @param {VARIANT_BOOL} restrictService 
     * @param {VARIANT_BOOL} serviceSidRestricted 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-restrictservice
     */
    RestrictService(serviceName, appName, restrictService, serviceSidRestricted) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(7, this, "ptr", serviceName, "ptr", appName, "short", restrictService, "short", serviceSidRestricted, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} serviceName 
     * @param {BSTR} appName 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-servicerestricted
     */
    ServiceRestricted(serviceName, appName) {
        serviceName := serviceName is String ? BSTR.Alloc(serviceName).Value : serviceName
        appName := appName is String ? BSTR.Alloc(appName).Value : appName

        result := ComCall(8, this, "ptr", serviceName, "ptr", appName, "short*", &serviceRestricted := 0, "HRESULT")
        return serviceRestricted
    }

    /**
     * 
     * @returns {INetFwRules} 
     * @see https://learn.microsoft.com/windows/win32/api/netfw/nf-netfw-inetfwservicerestriction-get_rules
     */
    get_Rules() {
        result := ComCall(9, this, "ptr*", &rules := 0, "HRESULT")
        return INetFwRules(rules)
    }
}
