#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHostName.ahk
#Include ..\Foundation\IStringable.ahk
#Include .\IHostNameStatics.ahk
#Include .\IHostNameFactory.ahk
#Include ..\..\Guid.ahk

/**
 * Represents a host name or IP address (domain, IPv4, IPv6, or Bluetooth) used by Windows networking APIs.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname
 * @namespace Windows.Networking
 * @version WindowsRuntime 1.4
 */
class HostName extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHostName

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHostName.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Compares two strings to determine if they represent the same hostname.
     * @remarks
     * The Compare method is used to compare two strings to determine if the strings represent the same hostname. This method compares canonical names created from the *value1* and *value2* parameters to determine the value to return.
     * @param {HSTRING} value1 A hostname or IP address.
     * @param {HSTRING} value2 A hostname or IP address.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.compare
     */
    static Compare(value1, value2) {
        if (!HostName.HasProp("__IHostNameStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.HostName")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHostNameStatics.IID)
            HostName.__IHostNameStatics := IHostNameStatics(factoryPtr)
        }

        return HostName.__IHostNameStatics.Compare(value1, value2)
    }

    /**
     * Creates a new [HostName](hostname.md) object from a string that contains a hostname or an IP address.
     * @remarks
     * This constructor creates a new [HostName](hostname.md) object. The *hostName* parameter can contain a hostname or an IP address. A [HostName](hostname.md) object can be used for a local hostname or a remote hostname.
     * 
     * The *hostName* parameter can contain one of the following:
     * 
     * 
     * + The name of a host that can be resolved by the Domain Name System (DNS) or by another namespace provider.
     * + The name of a host that matches a string in the following file on the local computer: *%WINDIR%\\system32\drivers\etc\hosts*
     * + A string that contains an IPv4 or an IPv6 network address of the host. An IPv4 address string is in dotted-decimal notation ("192.168.1.111", for example). An IPv6 address is in hexadecimal notation ("21DA:00D3:0010:2F3B:02AA:00FF:FE28:9C5A", for example).
     * If the *hostName* parameter is the "localhost" string, this represents all loopback addresses on the local computer.
     * 
     * The [NetworkInformation.GetHostNames](../windows.networking.connectivity/networkinformation_gethostnames_136280557.md) method in the [Windows.Networking.Connectivity](../windows.networking.connectivity/windows_networking_connectivity.md) namespace can be used to retrieve a list of host names or IP addresses associated with the local machine. One of these hostnames or IP addresses can then be used for the *hostName* parameter.
     * 
     * The constructor will fail if the *hostName* parameter is null or contains an empty string.
     * @param {HSTRING} hostName_ A string that contains a hostname or an IP address.
     * @returns {HostName} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.#ctor
     */
    static CreateHostName(hostName_) {
        if (!HostName.HasProp("__IHostNameFactory")) {
            activatableClassId := HSTRING.Create("Windows.Networking.HostName")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IHostNameFactory.IID)
            HostName.__IHostNameFactory := IHostNameFactory(factoryPtr)
        }

        return HostName.__IHostNameFactory.CreateHostName(hostName_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the [IPInformation](../windows.networking.connectivity/ipinformation.md) object for a local IP address assigned to a [HostName](hostname.md) object.
     * @remarks
     * The [IPInformation](../windows.networking.connectivity/ipinformation.md) property is only set when the [HostName](hostname.md) object is a local IPv4 or IPv6 address returned by the [GetHostNames](../windows.networking.connectivity/networkinformation_gethostnames_136280557.md) method. This property represents the [IPInformation](../windows.networking.connectivity/ipinformation.md) object for the local IP address. If the [HostName](hostname.md) object is not a local IPv4 or IPv6 address, this property will be null.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.ipinformation
     * @type {IPInformation} 
     */
    IPInformation {
        get => this.get_IPInformation()
    }

    /**
     * Gets the original string used to construct the [HostName](hostname.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.rawname
     * @type {HSTRING} 
     */
    RawName {
        get => this.get_RawName()
    }

    /**
     * Gets the display name for the [HostName](hostname.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets the canonical name for the [HostName](hostname.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.canonicalname
     * @type {HSTRING} 
     */
    CanonicalName {
        get => this.get_CanonicalName()
    }

    /**
     * Gets the [HostNameType](hostnametype.md) of the [HostName](hostname.md) object.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.type
     * @type {Integer} 
     */
    Type {
        get => this.get_Type()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IPInformation} 
     */
    get_IPInformation() {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.get_IPInformation()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RawName() {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.get_RawName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CanonicalName() {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.get_CanonicalName()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Type() {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.get_Type()
    }

    /**
     * Determines whether the specified [HostName](hostname.md) object has an equivalent value to the current [HostName](hostname.md) object.
     * @remarks
     * The [Equals](/dotnet/api/system.object.equals?view=dotnet-uwp-10.0&preserve-view=true) method determines whether the [HostName](hostname.md) object specified by the *hostName* parameter is the same instance of the current [HostName](hostname.md) object.
     * 
     * The IsEqual method determines whether the [HostName](hostname.md) object specified by the *hostName* parameter has an equivalent value to the current [HostName](hostname.md) object. Two [HostName](hostname.md) objects are considered to have the equivalent value if the [CanonicalName](hostname_canonicalname.md) property has the same value.
     * @param {HostName} hostName_ A [HostName](hostname.md) object that is compared with the current [HostName](hostname.md).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.isequal
     */
    IsEqual(hostName_) {
        if (!this.HasProp("__IHostName")) {
            if ((queryResult := this.QueryInterface(IHostName.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostName := IHostName(outPtr)
        }

        return this.__IHostName.IsEqual(hostName_)
    }

    /**
     * Returns a string that represents the [HostName](hostname.md) object.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.hostname.tostring
     */
    ToString() {
        if (!this.HasProp("__IStringable")) {
            if ((queryResult := this.QueryInterface(IStringable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStringable := IStringable(outPtr)
        }

        return this.__IStringable.ToString()
    }

;@endregion Instance Methods
}
