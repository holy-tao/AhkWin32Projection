#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIPInformation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the association between an IP address and an adapter on the network.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.ipinformation
 * @namespace Windows.Networking.Connectivity
 * @version WindowsRuntime 1.4
 */
class IPInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIPInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIPInformation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Retrieves the network adapter associated with the IP address.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.ipinformation.networkadapter
     * @type {NetworkAdapter} 
     */
    NetworkAdapter {
        get => this.get_NetworkAdapter()
    }

    /**
     * Retrieves the length of the prefix, or network part of the IP address.
     * @remarks
     * For a unicast IPv4 address, any value greater than 32 is an illegal value. For a unicast IPv6 address, any value greater than 128 is an illegal value. A value of 255 is commonly used to represent an illegal value.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.connectivity.ipinformation.prefixlength
     * @type {IReference<Integer>} 
     */
    PrefixLength {
        get => this.get_PrefixLength()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {NetworkAdapter} 
     */
    get_NetworkAdapter() {
        if (!this.HasProp("__IIPInformation")) {
            if ((queryResult := this.QueryInterface(IIPInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIPInformation := IIPInformation(outPtr)
        }

        return this.__IIPInformation.get_NetworkAdapter()
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_PrefixLength() {
        if (!this.HasProp("__IIPInformation")) {
            if ((queryResult := this.QueryInterface(IIPInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIPInformation := IIPInformation(outPtr)
        }

        return this.__IIPInformation.get_PrefixLength()
    }

;@endregion Instance Methods
}
