#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILanIdentifier.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents physical identification data for a specific [NetworkAdapter](networkadapter.md) object. Retrieve
  * `LanIdentifier` instances through [NetworkInformation.GetLanIdentifiers](networkinformation_getlanidentifiers_1178330225.md).
 * @remarks
 * Location data is expressed either as a BSSID if the network adapter media type is Wireless LAN, or as a tuple &lt;ChassisId, Port Number&gt; if the network adapter type is Ethernet. The data is represented according to the LLDP protocol.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifier
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class LanIdentifier extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILanIdentifier

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILanIdentifier.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [LanIdentifierData](lanidentifierdata.md) object containing locality identification information for the network adapter's connection.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifier.infrastructureid
     * @type {LanIdentifierData} 
     */
    InfrastructureId {
        get => this.get_InfrastructureId()
    }

    /**
     * Gets a [LanIdentifierData](lanidentifierdata.md) object containing the port ID from the Link Layer Discovery Protocol (LLDP) locality information for an Ethernet type network adapter.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifier.portid
     * @type {LanIdentifierData} 
     */
    PortId {
        get => this.get_PortId()
    }

    /**
     * Gets the adapter [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that identifies the network adapter to associate with the locality information.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.lanidentifier.networkadapterid
     * @type {Guid} 
     */
    NetworkAdapterId {
        get => this.get_NetworkAdapterId()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {LanIdentifierData} 
     */
    get_InfrastructureId() {
        if (!this.HasProp("__ILanIdentifier")) {
            if ((queryResult := this.QueryInterface(ILanIdentifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanIdentifier := ILanIdentifier(outPtr)
        }

        return this.__ILanIdentifier.get_InfrastructureId()
    }

    /**
     * 
     * @returns {LanIdentifierData} 
     */
    get_PortId() {
        if (!this.HasProp("__ILanIdentifier")) {
            if ((queryResult := this.QueryInterface(ILanIdentifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanIdentifier := ILanIdentifier(outPtr)
        }

        return this.__ILanIdentifier.get_PortId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkAdapterId() {
        if (!this.HasProp("__ILanIdentifier")) {
            if ((queryResult := this.QueryInterface(ILanIdentifier.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILanIdentifier := ILanIdentifier(outPtr)
        }

        return this.__ILanIdentifier.get_NetworkAdapterId()
    }

;@endregion Instance Methods
}
