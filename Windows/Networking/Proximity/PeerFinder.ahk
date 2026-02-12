#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPeerFinderStatics2.ahk
#Include .\IPeerFinderStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Enables you to discover other instances of your app on nearby devices and create a socket connection between the peer apps by using a tap gesture or by browsing. For creating Bluetooth socket connections on Windows 8.1 and later, use [Windows.Devices.Bluetooth.Rfcomm](../windows.devices.bluetooth.rfcomm/windows_devices_bluetooth_rfcomm.md) instead.
 * @remarks
 * > [!IMPORTANT]
 * > The Proximity APIs do not provide authentication. You should avoid exchanging sensitive data with these APIs.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder
 * @namespace Windows.Networking.Proximity
 * @version WindowsRuntime 1.4
 */
class PeerFinder extends IInspectable {
;@region Static Properties
    /**
     * Gets or sets the role of the app in peer-to-peer connections.
     * @remarks
     * The Role property is used in multi-peer app connections to identify whether the peer app is the **Host** or **Client**, or if the peer app is participating in a two-peer connection as a **Peer**. For multi-peer app connections, you must set the Role property before calling the [Start](peerfinder_start_119778276.md) method. If the Role property is not set, the default is **Peer**.
     * 
     * In a multi-peer app scenario, the Role identifies the capability of the apps to connect. A **Host** app can connect to up to five **Client** apps. **Host** apps can only discover apps that advertise as **Client** apps. **Client** apps can only discover apps that advertise as **Host** apps. The **Peer** role identifies a two-app scenario. Therefore, **Peer** apps can only discover other **Peer** apps. The same rules apply for peer apps connected using a tap gesture. For example, apps advertising as **Host** apps can only tap to connect with apps advertising as **Client** apps.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.role
     * @type {Integer} 
     */
    static Role {
        get => PeerFinder.get_Role()
        set => PeerFinder.put_Role(value)
    }

    /**
     * Gets or sets user or device data to include during device discovery.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.discoverydata
     * @type {IBuffer} 
     */
    static DiscoveryData {
        get => PeerFinder.get_DiscoveryData()
        set => PeerFinder.put_DiscoveryData(value)
    }

    /**
     * Specifies whether the [PeerFinder](peerfinder.md) class may connect a [StreamSocket](../windows.networking.sockets/streamsocket_streamsocket_1221375020.md) object by using Bluetooth.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.allowbluetooth
     * @type {Boolean} 
     */
    static AllowBluetooth {
        get => PeerFinder.get_AllowBluetooth()
        set => PeerFinder.put_AllowBluetooth(value)
    }

    /**
     * Specifies whether the [PeerFinder](peerfinder.md) class may connect to a [StreamSocket](../windows.networking.sockets/streamsocket.md) object using TCP/IP.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.allowinfrastructure
     * @type {Boolean} 
     */
    static AllowInfrastructure {
        get => PeerFinder.get_AllowInfrastructure()
        set => PeerFinder.put_AllowInfrastructure(value)
    }

    /**
     * Specifies whether the [PeerFinder](peerfinder.md) class may connect a [StreamSocket](../windows.networking.sockets/streamsocket_streamsocket_1221375020.md) object by using Wi-Fi Direct.
     * @remarks
     * Setting the AllowWiFiDirect property to false disables the ability to browse for peer apps using Wi-Fi Direct. You will not be able to use the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method to browse for remote peers.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.allowwifidirect
     * @type {Boolean} 
     */
    static AllowWiFiDirect {
        get => PeerFinder.get_AllowWiFiDirect()
        set => PeerFinder.put_AllowWiFiDirect(value)
    }

    /**
     * Gets or sets the name that identifies your computer to remote peers.
     * @remarks
     * > [!IMPORTANT]
     * > Always set the DisplayName property to a unique value for your app before you call the [Start](peerfinder_start_119778276.md) method.
     * 
     * The **DisplayName** property value is included in the [PeerInformation](peerinformation.md) instance that's created when a remote peer calls the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method and finds your computer.
     * 
     * If you don't specify a value for the **DisplayName** property, the computer name is used.
     * 
     * The maximum length of **DisplayName** is 50 characters.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.displayname
     * @type {HSTRING} 
     */
    static DisplayName {
        get => PeerFinder.get_DisplayName()
        set => PeerFinder.put_DisplayName(value)
    }

    /**
     * Gets a value that indicates which discovery options are available to use with the [PeerFinder](peerfinder.md) class.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.supporteddiscoverytypes
     * @type {Integer} 
     */
    static SupportedDiscoveryTypes {
        get => PeerFinder.get_SupportedDiscoveryTypes()
    }

    /**
     * Gets a list of alternate appId values to match with peer applications on other platforms.
     * @remarks
     * The AlternateIdentities property is used to add alternate proximity app Ids that match the proximity app Ids of peer apps running on other platforms. The [PeerFinder](peerfinder.md) class uses the alternate app Ids to match a peer app running on Windows with a peer app running on another platform. For example, if you create an app for Windows and also create the same app for another platform, the apps will not have the same unique app Id on both platforms. You can use the [PeerFinder](peerfinder.md) class to match the peer apps by adding the app Id from the other platform to the AlternateIdentities property of your Windows app, and by adding the app Id for your Windows app to the alternate identities of the other platform.
     * 
     * The other platform must also support adding alternate identities so that the proximity app Id can be specified on that platform. You must include the proximity app Id on the other platform for the [PeerFinder](peerfinder.md) class to connect your apps when tapping with a Windows device. The format of the alternate identity string for a specific platform is determined by the implementation of that platform.
     * 
     * The format of the proximity app Id is **&lt;package family name&gt;!&lt;app Id&gt;**. You can get the package family name from the [Windows.ApplicationModel.Package.Current.Id.FamilyName](../windows.applicationmodel/packageid_familyname.md) property. You must copy the app Id value from the **Id** attribute of the **Application** element in the package manifest for your app. For Example, `PeerFinder.Add("WindowsPhone", "{1c6379c1-9d5e-4254-8f4c-be7ea24057d1}")` adds a Windows Phone 8 app id as an alternate identity in your Windows 8 app. `PeerFinder.Add("Windows", "b3c3e7ef-371a-464f-a75e-95ddbdcaf974_7fed2v891h66p!App")` adds a Windows 8 app id as an alternate identity in a Windows Phone 8 app.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.alternateidentities
     * @type {IMap<HSTRING, HSTRING>} 
     */
    static AlternateIdentities {
        get => PeerFinder.get_AlternateIdentities()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Integer} 
     */
    static get_Role() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics2.IID)
            PeerFinder.__IPeerFinderStatics2 := IPeerFinderStatics2(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics2.get_Role()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_Role(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics2.IID)
            PeerFinder.__IPeerFinderStatics2 := IPeerFinderStatics2(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics2.put_Role(value)
    }

    /**
     * 
     * @returns {IBuffer} 
     */
    static get_DiscoveryData() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics2.IID)
            PeerFinder.__IPeerFinderStatics2 := IPeerFinderStatics2(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics2.get_DiscoveryData()
    }

    /**
     * 
     * @param {IBuffer} value 
     * @returns {HRESULT} 
     */
    static put_DiscoveryData(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics2.IID)
            PeerFinder.__IPeerFinderStatics2 := IPeerFinderStatics2(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics2.put_DiscoveryData(value)
    }

    /**
     * Creates a new instance of a [PeerWatcher](peerwatcher.md) object for dynamic discovery of peer apps.
     * @remarks
     * You must first call the [Start](peerfinder_start_119778276.md) method before calling the CreateWatcher method.
     * 
     * If you call the CreateWatcher method multiple times, you will receive a reference to the same [PeerWatcher](peerwatcher.md) instance. 
     * 
     * 
     * 
     * [!code-csharp[_StartPeerWatcher](../windows.networking.proximity/code/Proximity_PeerWatcher/cs/MainPage.xaml.cs#Snippet_StartPeerWatcher)]
     * @returns {PeerWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.createwatcher
     */
    static CreateWatcher() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics2.IID)
            PeerFinder.__IPeerFinderStatics2 := IPeerFinderStatics2(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics2.CreateWatcher()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_AllowBluetooth() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_AllowBluetooth()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_AllowBluetooth(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.put_AllowBluetooth(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_AllowInfrastructure() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_AllowInfrastructure()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_AllowInfrastructure(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.put_AllowInfrastructure(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    static get_AllowWiFiDirect() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_AllowWiFiDirect()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    static put_AllowWiFiDirect(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.put_AllowWiFiDirect(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_DisplayName() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    static put_DisplayName(value) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.put_DisplayName(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_SupportedDiscoveryTypes() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_SupportedDiscoveryTypes()
    }

    /**
     * 
     * @returns {IMap<HSTRING, HSTRING>} 
     */
    static get_AlternateIdentities() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.get_AlternateIdentities()
    }

    /**
     * Makes an app discoverable to remote peers.
     * @remarks
     * You can call the **Start** method to begin the process of finding a peer app and to make your app discoverable to remote peers that call the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method. A peer is a device that has an app running in the foreground with a matching AppId. A peer can also have a matching Browse Id that's specified as an alternate identity. For more information, see [AlternateIdentities](peerfinder_alternateidentities.md).
     * 
     * You can connect to only one peer at a time if your app is in the peer or client role. If your app is in the host role, you can connect up to 5 clients at a time.
     * 
     * When an app is activated by tapping a nearby device, the activation parameters indicate whether the [PeerFinder](peerfinder.md) should be started or if the app was launched with activation arguments. The format of the activation parameters is *"Windows.Networking.Proximity.PeerFinder:StreamSocket Role=&lt;Host|Client&gt;"*. For more information, see the "Activating apps using Proximity" section of [Supporting Proximity and Tapping.](/previous-versions/windows/apps/hh465229(v=win.10))
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > Always set the [DisplayName](peerfinder_displayname.md) property to a unique value for your app before you call the [Start](peerfinder_start_119778276.md) method.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.start
     */
    static Start() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.Start()
    }

    /**
     * Makes an app discoverable to remote peers.
     * @remarks
     * You can call the **Start** method to begin the process of finding a peer app and to make your app discoverable to remote peers that call the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method. A peer is a device that has an app running in the foreground with a matching AppId. A peer can also have a matching Browse Id that's specified as an alternate identity. For more information, see [AlternateIdentities](peerfinder_alternateidentities.md).
     * 
     * You can use this overload of the Start method to send a message to a peer app that will be passed as an app activation argument.
     * 
     * You can connect to only one peer at a time if your app is in the peer or client role. If your app is in the host role, you can connect up to 5 clients at a time.
     * 
     * When an app is activated by tapping a nearby device, the activation parameters indicate whether the [PeerFinder](peerfinder.md) should be started or if the app was launched with activation arguments. The format of the activation parameters is *"Windows.Networking.Proximity.PeerFinder:StreamSocket Role=&lt;Host|Client&gt;"*. For more information, see the "Activating apps using Proximity" section of [Supporting Proximity and Tapping.](/previous-versions/windows/apps/hh465229(v=win.10))
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > Always set the [DisplayName](peerfinder_displayname.md) property to a unique value for your app before you call the Start method.
     * @param {HSTRING} peerMessage The message to deliver to the proximate device.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.start
     */
    static StartWithMessage(peerMessage) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.StartWithMessage(peerMessage)
    }

    /**
     * Stops advertising for a peer connection.
     * @remarks
     * You can call the Stop method to stop the [PeerFinder](peerfinder.md) when you no longer want to advertise for or accept new triggered (tapped) or browsed connections. Stop does not close an existing connection. However, the Stop method will cancel outstanding calls to the [ConnectAsync](peerfinder_connectasync_380619906.md) method and triggered connection requests. The Stop method does not wait for the cancellation to complete.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.stop
     */
    static Stop() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.Stop()
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, TriggeredConnectionStateChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_TriggeredConnectionStateChanged(handler) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.add_TriggeredConnectionStateChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_TriggeredConnectionStateChanged(cookie) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.remove_TriggeredConnectionStateChanged(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<IInspectable, ConnectionRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_ConnectionRequested(handler) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.add_ConnectionRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    static remove_ConnectionRequested(cookie) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.remove_ConnectionRequested(cookie)
    }

    /**
     * Asynchronously browses for peer devices that are running the same app within wireless range.
     * @remarks
     * If your app is running on a PC, you can browse for peer PCs that are running your app. Peer discovery in this case takes place over Wi-Fi Direct. If your app is running on a phone, you can browse for peer phones that are running your app. In this case, peer discovery takes place over Bluetooth. Because the transport used for peer discovery differs between PC and phone, your app running on a PC can only find peer PCs and your app running on a phone can only find peer phones.
     * 
     * When the asynchronous browsing operation finishes successfully, it returns a list of peers that are within wireless range. A peer is a device that has an app running in the foreground with a matching app Id. A peer can also have a matching browse Id that's specified as an alternate identity. For more information, see [AlternateIdentities](peerfinder_alternateidentities.md).
     * 
     * If an app calls the [ConnectAsync](peerfinder_connectasync_380619906.md) method to create a connection with a peer, the app will no longer advertise for a connection and will not be found by the FindAllPeersAsync method until the app calls the [Close](../windows.networking.sockets/streamsocket_close_811482585.md) method to close the socket connection.
     * 
     * You will only find peers where the device is within wireless range and the peer app is running in the foreground. If a peer app is running in the background, proximity does not advertise for peer connections.
     * 
     * As an alternative to the FindAllPeersAsync method, you can dynamically search for peer apps as they are discovered within range using the [PeerWatcher](peerwatcher.md) object.
     * @returns {IAsyncOperation<IVectorView<PeerInformation>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.findallpeersasync
     */
    static FindAllPeersAsync() {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.FindAllPeersAsync()
    }

    /**
     * Connects to a peer discovered by a call to the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method.
     * @remarks
     * You can obtain an instance of a [PeerInformation](peerinformation.md) object for a peer from a call to the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method, or in a handler for the [ConnectionRequested](peerfinder_connectionrequested.md) event.
     * 
     * If an app calls the ConnectAsync method to create a connection with a peer, the app will no longer advertise for a connection and will not be found by the [FindAllPeersAsync](peerfinder_findallpeersasync_830195586.md) method until the app calls the [Close](../windows.networking.sockets/streamsocket_close_811482585.md) method to close the socket connection.
     * 
     * If you open a socket connection by calling the ConnectAsync method, only one socket connection can be open at a time for the computer. If your app, or another app calls the ConnectAsync method, then the existing socket connection will close.
     * 
     * An *Access Denied* exception will be thrown if you attempt to call **ConnectAsync** when your app is in the background.
     * 
     * 
     * 
     * > [!IMPORTANT]
     * > The Proximity APIs do not provide authentication. You should avoid exchanging sensitive data with these APIs.
     * @param {PeerInformation} peerInformation_ A peer information object representing the peer to connect to.
     * @returns {IAsyncOperation<StreamSocket>} 
     * @see https://learn.microsoft.com/uwp/api/windows.networking.proximity.peerfinder.connectasync
     */
    static ConnectAsync(peerInformation_) {
        if (!PeerFinder.HasProp("__IPeerFinderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Networking.Proximity.PeerFinder")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPeerFinderStatics.IID)
            PeerFinder.__IPeerFinderStatics := IPeerFinderStatics(factoryPtr)
        }

        return PeerFinder.__IPeerFinderStatics.ConnectAsync(peerInformation_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
