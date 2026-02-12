#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRoutePolicy.ahk
#Include .\IRoutePolicyFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * The RoutePolicy class is used to represent the traffic routing policy for a special PDP Context/APN.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.routepolicy
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class RoutePolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRoutePolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRoutePolicy.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates an instance of [RoutePolicy](routepolicy.md) using the defined connection profile and host name values.
     * @remarks
     * A host name can be:<table>
     *    <tr><th>Value</th><th>Description</th></tr>
     *    <tr><td>Domain Name</td><td>All the traffic destined to this domain name will be routed to special PDP Context. If you specify Contoso.com, for example, all traffic going to *.Contoso.com will be routed to special PDP Context.</td></tr>
     *    <tr><td>IP Address</td><td>All the traffic destined to this IP Address will be routed to special PDP Context.</td></tr>
     *    <tr><td>Not specified</td><td>Windows will route all traffic to special PDP context.</td></tr>
     * </table>
     * @param {ConnectionProfile} connectionProfile_ The connection profile
     * @param {HostName} hostName_ The host name for the route policy to the special PDP context.
     * @param {Integer} type The domain type of *hostName* when the [HostNameType](../windows.networking/hostnametype.md) value indicates a domain name.
     * @returns {RoutePolicy} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.routepolicy.#ctor
     */
    static CreateRoutePolicy(connectionProfile_, hostName_, type) {
        if (!RoutePolicy.HasProp("__IRoutePolicyFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Connectivity.RoutePolicy")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRoutePolicyFactory.IID)
            RoutePolicy.__IRoutePolicyFactory := IRoutePolicyFactory(factoryPtr)
        }

        return RoutePolicy.__IRoutePolicyFactory.CreateRoutePolicy(connectionProfile_, hostName_, type)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Retrieves the connection profile for an access point connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.routepolicy.connectionprofile
     * @type {ConnectionProfile} 
     */
    ConnectionProfile {
        get => this.get_ConnectionProfile()
    }

    /**
     * Provides the host name for the route policy to the special PDP context.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.routepolicy.hostname
     * @type {HostName} 
     */
    HostName {
        get => this.get_HostName()
    }

    /**
     * Indicates if the [HostName](routepolicy_hostname.md) is a suffix or a fully qualified domain name reference. Possible values are defined by [DomainNameType](../windows.networking/domainnametype.md).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.routepolicy.hostnametype
     * @type {Integer} 
     */
    HostNameType {
        get => this.get_HostNameType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ConnectionProfile} 
     */
    get_ConnectionProfile() {
        if (!this.HasProp("__IRoutePolicy")) {
            if ((queryResult := this.QueryInterface(IRoutePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRoutePolicy := IRoutePolicy(outPtr)
        }

        return this.__IRoutePolicy.get_ConnectionProfile()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_HostName() {
        if (!this.HasProp("__IRoutePolicy")) {
            if ((queryResult := this.QueryInterface(IRoutePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRoutePolicy := IRoutePolicy(outPtr)
        }

        return this.__IRoutePolicy.get_HostName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HostNameType() {
        if (!this.HasProp("__IRoutePolicy")) {
            if ((queryResult := this.QueryInterface(IRoutePolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRoutePolicy := IRoutePolicy(outPtr)
        }

        return this.__IRoutePolicy.get_HostNameType()
    }

;@endregion Instance Methods
}
