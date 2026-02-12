#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\INetworkAdapter.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a network adapter and provides access to information about its capabilities, connection status, and network properties.
 * @remarks
 * A [NetworkAdapter](networkadapter.md) instance is typically obtained from a [ConnectionProfile](connectionprofile.md) through the 
 * [NetworkAdapter](connectionprofile_networkadapter.md) property. You can use this object to access details about the physical or virtual 
 * network interface, including bandwidth capabilities, interface type, and associated network item information.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class NetworkAdapter extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => INetworkAdapter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => INetworkAdapter.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value indicating the maximum outbound speed in bits per second.
     * @remarks
     * This property represents the current speed in bits per second of the transmit link for the [NetworkAdapter](networkadapter.md). This value represents the maximum speed of the interface and is generally much higher than the actual speed when sending network data on this link, particularly for wireless networks.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.outboundmaxbitspersecond
     * @type {Integer} 
     */
    OutboundMaxBitsPerSecond {
        get => this.get_OutboundMaxBitsPerSecond()
    }

    /**
     * Gets a value indicating the maximum inbound data transfer rate in bits per second.
     * @remarks
     * This value represents the maximum speed of the interface and is generally much higher than the actual transfer speed while receiving network data, particularly for wireless networks.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.inboundmaxbitspersecond
     * @type {Integer} 
     */
    InboundMaxBitsPerSecond {
        get => this.get_InboundMaxBitsPerSecond()
    }

    /**
     * Gets the network interface type as defined by the Internet Assigned Numbers Authority (IANA) for the  
     * [NetworkAdapter](networkadapter.md).  
     * The table lists common values; many other values are possible (see Remarks).
     * @remarks
     * This property represents the interface type as defined by the Internet Assigned Numbers Authority (IANA).  
     * For the complete, current list of possible values, see the IANA ifType registry:  
     * <https://www.iana.org/assignments/ianaiftype-mib/ianaiftype-mib>.  
     * > [!NOTE]
     * > Values outside the table may appear as new interface types are assigned. Handle unknown values defensively.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.ianainterfacetype
     * @type {Integer} 
     */
    IanaInterfaceType {
        get => this.get_IanaInterfaceType()
    }

    /**
     * Gets the [NetworkItem](networkitem.md) object that represents the connected network.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.networkitem
     * @type {NetworkItem} 
     */
    NetworkItem {
        get => this.get_NetworkItem()
    }

    /**
     * Gets the network adapter ID.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.networkadapterid
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
     * @returns {Integer} 
     */
    get_OutboundMaxBitsPerSecond() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.get_OutboundMaxBitsPerSecond()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InboundMaxBitsPerSecond() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.get_InboundMaxBitsPerSecond()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_IanaInterfaceType() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.get_IanaInterfaceType()
    }

    /**
     * 
     * @returns {NetworkItem} 
     */
    get_NetworkItem() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.get_NetworkItem()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NetworkAdapterId() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.get_NetworkAdapterId()
    }

    /**
     * Gets the connection profile currently associated with the network adapter.
     * @returns {IAsyncOperation<ConnectionProfile>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.networkadapter.getconnectedprofileasync
     */
    GetConnectedProfileAsync() {
        if (!this.HasProp("__INetworkAdapter")) {
            if ((queryResult := this.QueryInterface(INetworkAdapter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__INetworkAdapter := INetworkAdapter(outPtr)
        }

        return this.__INetworkAdapter.GetConnectedProfileAsync()
    }

;@endregion Instance Methods
}
