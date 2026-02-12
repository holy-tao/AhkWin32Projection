#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ConnectionSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IConnectivityManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConnectivityManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{5120d4b1-4fb1-48b0-afc9-42e0092a8164}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AcquireConnectionAsync", "AddHttpRoutePolicy", "RemoveHttpRoutePolicy"]

    /**
     * 
     * @param {CellularApnContext} cellularApnContext_ 
     * @returns {IAsyncOperation<ConnectionSession>} 
     */
    AcquireConnectionAsync(cellularApnContext_) {
        result := ComCall(6, this, "ptr", cellularApnContext_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ConnectionSession, operation)
    }

    /**
     * 
     * @param {RoutePolicy} routePolicy_ 
     * @returns {HRESULT} 
     */
    AddHttpRoutePolicy(routePolicy_) {
        result := ComCall(7, this, "ptr", routePolicy_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {RoutePolicy} routePolicy_ 
     * @returns {HRESULT} 
     */
    RemoveHttpRoutePolicy(routePolicy_) {
        result := ComCall(8, this, "ptr", routePolicy_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
