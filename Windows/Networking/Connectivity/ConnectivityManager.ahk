#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IConnectivityManagerStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides APIs to (1) acquire cellular connections (custom APN contexts) and (2) add or remove per-app HTTP route
  * policies that direct HTTP traffic through specific connection profiles.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivitymanager
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class ConnectivityManager extends IInspectable {
;@region Static Methods
    /**
     * Establishes a connection to a specific access point on a network. The request is defined using a [CellularApnContext](cellularapncontext.md) object.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators. Mobile operators must enable the `cellularDeviceControl` restricted capability to use this API.
     * @param {CellularApnContext} cellularApnContext_ Provides specific details about the APN.
     * @returns {IAsyncOperation<ConnectionSession>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivitymanager.acquireconnectionasync
     */
    static AcquireConnectionAsync(cellularApnContext_) {
        if (!ConnectivityManager.HasProp("__IConnectivityManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.ConnectivityManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConnectivityManagerStatics.IID)
            ConnectivityManager.__IConnectivityManagerStatics := IConnectivityManagerStatics(factoryPtr)
        }

        return ConnectivityManager.__IConnectivityManagerStatics.AcquireConnectionAsync(cellularApnContext_)
    }

    /**
     * Specifies a [RoutePolicy](routepolicy.md) that the Http stack (WinInet) will follow when routing traffic. Routing policies are only available for cellular profiles
     * @param {RoutePolicy} routePolicy_ Indicates the policy for traffic routing.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivitymanager.addhttproutepolicy
     */
    static AddHttpRoutePolicy(routePolicy_) {
        if (!ConnectivityManager.HasProp("__IConnectivityManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.ConnectivityManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConnectivityManagerStatics.IID)
            ConnectivityManager.__IConnectivityManagerStatics := IConnectivityManagerStatics(factoryPtr)
        }

        return ConnectivityManager.__IConnectivityManagerStatics.AddHttpRoutePolicy(routePolicy_)
    }

    /**
     * Removes a previously specified [RoutePolicy](routepolicy.md) from the Http stack (WinInet).
     * @param {RoutePolicy} routePolicy_ The [RoutePolicy](routepolicy.md) to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.connectivitymanager.removehttproutepolicy
     */
    static RemoveHttpRoutePolicy(routePolicy_) {
        if (!ConnectivityManager.HasProp("__IConnectivityManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.ConnectivityManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IConnectivityManagerStatics.IID)
            ConnectivityManager.__IConnectivityManagerStatics := IConnectivityManagerStatics(factoryPtr)
        }

        return ConnectivityManager.__IConnectivityManagerStatics.RemoveHttpRoutePolicy(routePolicy_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
