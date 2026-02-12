#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkOperatorTetheringClient.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains details about a tethering client.
 * @remarks
 * Your code does not instantiate this class directly. Instead, use [NetworkOperatorTetheringManager.GetTetheringClients](networkoperatortetheringmanager_gettetheringclients_34653131.md) to retrieve a list of instances initialized for the current tethering clients.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringclient
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class NetworkOperatorTetheringClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkOperatorTetheringClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkOperatorTetheringClient.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the MAC address of this tethering client.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringclient.macaddress
     * @type {HSTRING} 
     */
    MacAddress {
        get => this.get_MacAddress()
    }

    /**
     * Gets a list of hostnames used by this tethering client.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.networkoperatortetheringclient.hostnames
     * @type {IVectorView<HostName>} 
     */
    HostNames {
        get => this.get_HostNames()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MacAddress() {
        if (!this.HasProp("__INetworkOperatorTetheringClient")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringClient := INetworkOperatorTetheringClient(outPtr)
        }

        return this.__INetworkOperatorTetheringClient.get_MacAddress()
    }

    /**
     * 
     * @returns {IVectorView<HostName>} 
     */
    get_HostNames() {
        if (!this.HasProp("__INetworkOperatorTetheringClient")) {
            if ((queryResult := this.QueryInterface(INetworkOperatorTetheringClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkOperatorTetheringClient := INetworkOperatorTetheringClient(outPtr)
        }

        return this.__INetworkOperatorTetheringClient.get_HostNames()
    }

;@endregion Instance Methods
}
