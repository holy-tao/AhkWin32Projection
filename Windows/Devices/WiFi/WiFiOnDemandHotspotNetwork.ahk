#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWiFiOnDemandHotspotNetwork.ahk
#Include .\IWiFiOnDemandHotspotNetworkStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!IMPORTANT]
  * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
  * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
  * 
  * Represents a device that supports *on-demand hotspot*. The app registers that device with the operating system (OS), where the app can remotely enable the mobile hotspot. By updating properties on this object, the app can signal to the OS to update the user interface (UI). The object is keyed on a caller-chosen globally-unique identifier (GUID) that is intended to identify the device (the [Id](wifiondemandhotspotnetwork_id.md) property).
  * 
  * > [!NOTE]
  * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
  * >
  * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
 * @remarks
 * *On-demand hotspot* is the feature in Windows that allows a the Windows client device to view and remotely enable the mobile hotspot/internet sharing access point on a host Windows device (either a PC or a phone), and connect to it. That allows the client device to share the internet connection of the host device. This functionality is exposed to the user by injecting a Wi-Fi network into the client's network list when the user opens the Wi-Fi Quick Settings or Wi-Fi System Settings available networks (Windows 11).
 * 
 * The app is responsible for determining how to communicate with the hotspot to get the metadata, outside of this API.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork
 * @namespace Windows.Devices.WiFi
 * @version WindowsRuntime 1.4
 */
class WiFiOnDemandHotspotNetwork extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWiFiOnDemandHotspotNetwork

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWiFiOnDemandHotspotNetwork.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * If the operating system (OS) is already configured with a hotspot from the calling app, then **GetOrCreateById** retrieves the [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object that corresponds to the given *networkId*. Otherwise, the method creates a new network for that id.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * * The Id can be any value the app chooses to use to distinguish multiple on-demand hotspots. However, for best performance with ephemeral connections, we recommend reusing the same Id and updating the SSID and Password instead of creating new networks for each one.
     * * The Id need only be unique within an app.
     * * The calling app must have package identity.
     * @param {Guid} networkId The globally-unique identifier (GUID) that identifies a [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object.
     * @returns {WiFiOnDemandHotspotNetwork} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork.getorcreatebyid
     */
    static GetOrCreateById(networkId) {
        if (!WiFiOnDemandHotspotNetwork.HasProp("__IWiFiOnDemandHotspotNetworkStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.WiFi.WiFiOnDemandHotspotNetwork")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWiFiOnDemandHotspotNetworkStatics.IID)
            WiFiOnDemandHotspotNetwork.__IWiFiOnDemandHotspotNetworkStatics := IWiFiOnDemandHotspotNetworkStatics(factoryPtr)
        }

        return WiFiOnDemandHotspotNetwork.__IWiFiOnDemandHotspotNetworkStatics.GetOrCreateById(networkId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * A caller-chosen globally-unique identifier (GUID) that is intended to identify the hotspot.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * The id is unique per calling app, but it might be the same between apps.
     * 
     * An app has visibility only into its own on-demand hotspot networks, and can't see networks added by other apps.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Retrieves from a [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object various properties of the hotspot network, such as battery percentage, display name, availability, and SSID/password.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @returns {WiFiOnDemandHotspotNetworkProperties} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork.getproperties
     */
    GetProperties() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetwork := IWiFiOnDemandHotspotNetwork(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetwork.GetProperties()
    }

    /**
     * > [!IMPORTANT]
     * > Location consent is now required for Wi-Fi BSSID access. For details on how this affects apps using Wi-Fi or location APIs,
     * > see [Changes to API behavior for Wi-Fi access and location](/windows/win32/nativewifi/wi-fi-access-location-changes).
     * 
     * Sets on a [WiFiOnDemandHotspotNetwork](wifiondemandhotspotnetwork.md) object various properties of the hotspot network, such as battery percentage, display name, availability, and SSID/password. If any property is invalid, **UpdateProperties** throws an invalid argument exception.
     * 
     * > [!NOTE]
     * > If you want to use this API in a UWP app, and publish your app to the Microsoft Store, then you'll need to request special approval to use the custom capability **Microsoft.onDemandHotspotControl_8wekyb3d8bbwe** (the On-Demand Network capability). For more info, see [Custom capabilities](/windows/uwp/packaging/app-capability-declarations#custom-capabilities).
     * >
     * > The On-Demand Network capability will be made available only to app developers building end-to-end Wi-Fi hotspot scenarios between a tethering-capable hardware device and a Windows PC.
     * @remarks
     * `UpdateMetadata` should be called regularly by the app, even if no properties have changed. This is to ensure that Windows will show the network in the Wi-Fi available networks list (in other words, so Windows doesn't hide it for being stale). We recommend registering for the [WiFiOnDemandHotspotUpdateMetadataTrigger](/uwp/api/windows.applicationmodel.background.wifiondemandhotspotupdatemetadatatrigger) background task and calling `UpdateMetadata` there.
     * @param {WiFiOnDemandHotspotNetworkProperties} newProperties An object representing the properties to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.wifi.wifiondemandhotspotnetwork.updateproperties
     */
    UpdateProperties(newProperties) {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetwork := IWiFiOnDemandHotspotNetwork(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetwork.UpdateProperties(newProperties)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__IWiFiOnDemandHotspotNetwork")) {
            if ((queryResult := this.QueryInterface(IWiFiOnDemandHotspotNetwork.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWiFiOnDemandHotspotNetwork := IWiFiOnDemandHotspotNetwork(outPtr)
        }

        return this.__IWiFiOnDemandHotspotNetwork.get_Id()
    }

;@endregion Instance Methods
}
