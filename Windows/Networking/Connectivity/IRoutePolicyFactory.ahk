#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RoutePolicy.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IRoutePolicyFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRoutePolicyFactory
     * @type {Guid}
     */
    static IID => Guid("{36027933-a18e-4db5-a697-f58fa7364e44}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRoutePolicy"]

    /**
     * 
     * @param {ConnectionProfile} connectionProfile_ 
     * @param {HostName} hostName_ 
     * @param {Integer} type 
     * @returns {RoutePolicy} 
     */
    CreateRoutePolicy(connectionProfile_, hostName_, type) {
        result := ComCall(6, this, "ptr", connectionProfile_, "ptr", hostName_, "int", type, "ptr*", &routePolicy_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RoutePolicy(routePolicy_)
    }
}
