#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IESimDiscoverEvent.ahk
#Include ..\..\..\Guid.ahk

/**
 * A class representing an eSIM profile discovery event.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
  * >
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverevent
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class ESimDiscoverEvent extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IESimDiscoverEvent

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IESimDiscoverEvent.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the matching ID of the event.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverevent.matchingid
     * @type {HSTRING} 
     */
    MatchingId {
        get => this.get_MatchingId()
    }

    /**
     * Gets the RSP server address of the event.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators.
     * >
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.eSIMManagement_8wekyb3d8bbwe**. For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.esimdiscoverevent.rspserveraddress
     * @type {HSTRING} 
     */
    RspServerAddress {
        get => this.get_RspServerAddress()
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
    get_MatchingId() {
        if (!this.HasProp("__IESimDiscoverEvent")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverEvent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverEvent := IESimDiscoverEvent(outPtr)
        }

        return this.__IESimDiscoverEvent.get_MatchingId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_RspServerAddress() {
        if (!this.HasProp("__IESimDiscoverEvent")) {
            if ((queryResult := this.QueryInterface(IESimDiscoverEvent.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IESimDiscoverEvent := IESimDiscoverEvent(outPtr)
        }

        return this.__IESimDiscoverEvent.get_RspServerAddress()
    }

;@endregion Instance Methods
}
