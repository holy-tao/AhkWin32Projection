#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\VpnTrafficFilter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Vpn
 * @version WindowsRuntime 1.4
 */
class IVpnTrafficFilterFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVpnTrafficFilterFactory
     * @type {Guid}
     */
    static IID => Guid("{480d41d5-7f99-474c-86ee-96df168318f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Create"]

    /**
     * Create Extended Stored Procedures
     * @param {VpnAppId} appId 
     * @returns {VpnTrafficFilter} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/extended-stored-procedures-programming/creating-extended-stored-procedures
     */
    Create(appId) {
        result := ComCall(6, this, "ptr", appId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return VpnTrafficFilter(result_)
    }
}
