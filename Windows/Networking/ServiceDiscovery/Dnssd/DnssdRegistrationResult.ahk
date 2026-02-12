#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDnssdRegistrationResult.ahk
#Include ..\..\..\Foundation\IStringable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Encapsulates detailed information about the result of an attempt to register a service instance using DNS-SD.
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * See [RFC 1034](https://www.ietf.org/rfc/rfc1034.txt) for details about the format and contents of the DNS SRV RR, and [RFC 2782](https://www.ietf.org/rfc/rfc2782.txt) for details about how DNS-SD clients and servers use those records.
 * 
 * If your code attempts to register a service instance with the same name as a previously-registered service, your service will be renamed to avoid a conflict by adding a number in parentheses at the end of the name you specified. For example, if you specified "mygame" and that name was already registered for another service, your service would be renamed to something like, "mygame (2)". When this is done, **HasInstanceNameChanged** is set to **true**.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationresult
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdRegistrationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDnssdRegistrationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDnssdRegistrationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * An enumeration value indicating the result of a service instance registration attempt.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * The IP address of the successfully-created service instance.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationresult.ipaddress
     * @type {HostName} 
     */
    IPAddress {
        get => this.get_IPAddress()
    }

    /**
     * Indicates whether the instance name was changed in the course of the registration process.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationresult.hasinstancenamechanged
     * @type {Boolean} 
     */
    HasInstanceNameChanged {
        get => this.get_HasInstanceNameChanged()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Constructor.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Networking.ServiceDiscovery.Dnssd.DnssdRegistrationResult")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        if (!this.HasProp("__IDnssdRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IDnssdRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdRegistrationResult := IDnssdRegistrationResult(outPtr)
        }

        return this.__IDnssdRegistrationResult.get_Status()
    }

    /**
     * 
     * @returns {HostName} 
     */
    get_IPAddress() {
        if (!this.HasProp("__IDnssdRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IDnssdRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdRegistrationResult := IDnssdRegistrationResult(outPtr)
        }

        return this.__IDnssdRegistrationResult.get_IPAddress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasInstanceNameChanged() {
        if (!this.HasProp("__IDnssdRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IDnssdRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDnssdRegistrationResult := IDnssdRegistrationResult(outPtr)
        }

        return this.__IDnssdRegistrationResult.get_HasInstanceNameChanged()
    }

    /**
     * Gets the DNS SRV RR of a successfully registered service instance.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdregistrationresult.tostring
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
