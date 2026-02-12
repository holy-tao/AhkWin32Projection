#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHotspotAuthenticationEventDetails.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides the content of the event that is raised for background task handlers for the hotspot authentication event.
  * 
  * > [!NOTE]
  * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index) and [Windows 8 Integration for Wireless Hotspot Operators](/windows-hardware/drivers/mobilebroadband/integrating-windows-with-wireless-hotspots).
  * > 
  * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
 * @remarks
 * An application can register for the hotspot authentication event through the [NetworkOperatorHotspotAuthenticationTrigger](../windows.applicationmodel.background/networkoperatorhotspotauthenticationtrigger.md).
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationeventdetails
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class HotspotAuthenticationEventDetails extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHotspotAuthenticationEventDetails

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHotspotAuthenticationEventDetails.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) that uniquely identifies the authentication attempt for which this event was raised.
     * 
     * > [!NOTE]
     * > This functionality is available only to mobile operator apps and UWP apps given privileged access by mobile network operators. For more information, see [Mobile broadband](/windows-hardware/drivers/mobilebroadband/index) and [Windows 8 Integration for Wireless Hotspot Operators](/windows-hardware/drivers/mobilebroadband/integrating-windows-with-wireless-hotspots).
     * > 
     * > If you want to use this API and publish your app to the Microsoft Store, then you'll need special approval. For more information, see the **Restricted capabilities** section in the [App capability declarations](/windows/uwp/packaging/app-capability-declarations#restricted-capabilities) topic.
     * @remarks
     * The handler retrieving this token must call [TryGetAuthenticationContext](hotspotauthenticationcontext_trygetauthenticationcontext_1029198546.md) to retrieve the full context of this event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.hotspotauthenticationeventdetails.eventtoken
     * @type {HSTRING} 
     */
    EventToken {
        get => this.get_EventToken()
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
    get_EventToken() {
        if (!this.HasProp("__IHotspotAuthenticationEventDetails")) {
            if ((queryResult := this.QueryInterface(IHotspotAuthenticationEventDetails.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHotspotAuthenticationEventDetails := IHotspotAuthenticationEventDetails(outPtr)
        }

        return this.__IHotspotAuthenticationEventDetails.get_EventToken()
    }

;@endregion Instance Methods
}
