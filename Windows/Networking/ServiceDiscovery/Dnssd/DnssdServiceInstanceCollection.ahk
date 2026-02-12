#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include .\DnssdServiceInstance.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\Collections\IIterable.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A collection of DNS Service Discovery (DNS-SD) service instances.
  * 
  * > [!NOTE]
  * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
  * 
  * > [!NOTE]
  * > Win32 DNS Service Discovery (DNS-SD) APIs are declared in the [windns.h header](/windows/win32/api/windns/). For example, the Win32 APIs for announcing and discovering services are [DnsServiceRegister](/windows/win32/api/windns/nf-windns-dnsserviceregister) and [DnsServiceBrowse](/windows/win32/api/windns/nf-windns-dnsservicebrowse).
 * @remarks
 * Your code does not create a DnssdServiceInstanceCollection directly. Instead, handle the [DnssdServiceWatcher.EnumerationCompleted](dnssdservicewatcher_enumerationcompleted.md) event. When that event is triggered, the second argument to the event handler is a pointer to a DnssdServiceInstanceCollection object that contains information about the discovered service instances.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection
 * @namespace Windows.Networking.ServiceDiscovery.Dnssd
 * @version WindowsRuntime 1.4
 */
class DnssdServiceInstanceCollection extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVectorView

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVectorView.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the number of items in the collection
     * 
     * > [!NOTE]
     * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Gets the [DnssdServiceInstance](dnssdserviceinstance.md) at a given index into the [DnssdServiceInstanceCollection](dnssdserviceinstancecollection.md).
     * 
     * > [!NOTE]
     * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @param {Integer} index The index of the instance to be retrieved. Indices are 0-based. If your code specifies an index that is out of bounds, an exception is thrown. The maximum valid index is equal to one less than the [DnssdServiceInstanceCollection.Size](dnssdserviceinstancecollection_size.md) value.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection.getat
     */
    GetAt(index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f75ff82a-7e10-5cf6-8064-6ae585e0bd8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DnssdServiceInstance, outPtr)
        }

        return this.__IVectorView.GetAt(index)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f75ff82a-7e10-5cf6-8064-6ae585e0bd8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DnssdServiceInstance, outPtr)
        }

        return this.__IVectorView.get_Size()
    }

    /**
     * Gets a value indicating whether a given [DnssdServiceInstance](dnssdserviceinstance.md) is at the specified index in this service instance collection.
     * 
     * > [!NOTE]
     * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @param {Generic} value The [DnssdServiceInstance](dnssdserviceinstance.md) to get the index of.
     * @param {Pointer<UInt32>} index The index, if the [DnssdServiceInstance](dnssdserviceinstance.md) is found.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection.indexof
     */
    IndexOf(value, index) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f75ff82a-7e10-5cf6-8064-6ae585e0bd8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DnssdServiceInstance, outPtr)
        }

        return this.__IVectorView.IndexOf(value, index)
    }

    /**
     * Gets multiple [DnssdServiceInstance](dnssdserviceinstance_dnssdserviceinstance_1133705402.md) objects from a DNS-SD service instance collection.
     * 
     * > [!NOTE]
     * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @param {Integer} startIndex Index of the first collection item to be retrieved.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items The retrieved [DnssdServiceInstance](dnssdserviceinstance_dnssdserviceinstance_1133705402.md) objects.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection.getmany
     */
    GetMany(startIndex, items_length, items) {
        if (!this.HasProp("__IVectorView")) {
            piid := Guid("{f75ff82a-7e10-5cf6-8064-6ae585e0bd8d}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVectorView := IVectorView(DnssdServiceInstance, outPtr)
        }

        return this.__IVectorView.GetMany(startIndex, items_length, items)
    }

    /**
     * Gets an iterator that is initialized to refer to the first item in the instance collection.
     * 
     * > [!NOTE]
     * > DnssdServiceInstanceCollection is not supported and may be altered or unavailable in the future. Instead, use the Windows.Devices.Enumeration API.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.servicediscovery.dnssd.dnssdserviceinstancecollection.first
     */
    First() {
        if (!this.HasProp("__IIterable")) {
            piid := Guid("{1de3a3e5-387e-5328-b864-3f0e3475d343}")
            if ((queryResult := this.QueryInterface(piid, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIterable := IIterable(DnssdServiceInstance, outPtr)
        }

        return this.__IIterable.First()
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }

;@endregion Instance Methods
}
