#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionInfraredFrameSource.ahk
#Include .\IPerceptionInfraredFrameSource2.ahk
#Include .\IPerceptionInfraredFrameSourceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionInfraredFrameSource.ahk
#Include .\PerceptionFrameSourcePropertiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A frame source that provides infrared frames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionInfraredFrameSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionInfraredFrameSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionInfraredFrameSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new infrared frame source watcher.
     * @returns {PerceptionInfraredFrameSourceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.createwatcher
     */
    static CreateWatcher() {
        if (!PerceptionInfraredFrameSource.HasProp("__IPerceptionInfraredFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionInfraredFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionInfraredFrameSourceStatics.IID)
            PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics := IPerceptionInfraredFrameSourceStatics(factoryPtr)
        }

        return PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics.CreateWatcher()
    }

    /**
     * Finds all infrared frame sources.
     * @returns {IAsyncOperation<IVectorView<PerceptionInfraredFrameSource>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.findallasync
     */
    static FindAllAsync() {
        if (!PerceptionInfraredFrameSource.HasProp("__IPerceptionInfraredFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionInfraredFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionInfraredFrameSourceStatics.IID)
            PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics := IPerceptionInfraredFrameSourceStatics(factoryPtr)
        }

        return PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics.FindAllAsync()
    }

    /**
     * Finds an infrared frame source by looking up its unique ID.
     * @param {HSTRING} id The unique ID of the infrared frame source.
     * @returns {IAsyncOperation<PerceptionInfraredFrameSource>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.fromidasync
     */
    static FromIdAsync(id) {
        if (!PerceptionInfraredFrameSource.HasProp("__IPerceptionInfraredFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionInfraredFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionInfraredFrameSourceStatics.IID)
            PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics := IPerceptionInfraredFrameSourceStatics(factoryPtr)
        }

        return PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics.FromIdAsync(id)
    }

    /**
     * Requests access to use infrared frame sources.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!PerceptionInfraredFrameSource.HasProp("__IPerceptionInfraredFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionInfraredFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionInfraredFrameSourceStatics.IID)
            PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics := IPerceptionInfraredFrameSourceStatics(factoryPtr)
        }

        return PerceptionInfraredFrameSource.__IPerceptionInfraredFrameSourceStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string value indicating the unique ID of the infrared frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string value indicating the display name of the infrared frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a string value indicating the kind of physical device that generates the infrared frames.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.devicekind
     * @type {HSTRING} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * Gets a boolean value indicating whether or not the source is available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.available
     * @type {Boolean} 
     */
    Available {
        get => this.get_Available()
    }

    /**
     * Gets a boolean value indicating whether or not the source is active.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.active
     * @type {Boolean} 
     */
    Active {
        get => this.get_Active()
    }

    /**
     * Gets a boolean value indicating whether or not the source is the subject of controller mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.iscontrolled
     * @type {Boolean} 
     */
    IsControlled {
        get => this.get_IsControlled()
    }

    /**
     * Gets a read-only collection of frame source properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a read-only collection of video profiles that are supported by the infrared frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.supportedvideoprofiles
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    SupportedVideoProfiles {
        get => this.get_SupportedVideoProfiles()
    }

    /**
     * Gets a read-only collection of video profiles that are currently available from the infrared frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.availablevideoprofiles
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    AvailableVideoProfiles {
        get => this.get_AvailableVideoProfiles()
    }

    /**
     * Gets a PerceptionVideoProfile object indicating the current video profile.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.videoprofile
     * @type {PerceptionVideoProfile} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
    }

    /**
     * Gets a CameraIntrinsics value specifying the intrinsic properties of the infrared frame source camera device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.cameraintrinsics
     * @type {CameraIntrinsics} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * Gets a string value that identifies the device on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Subscribes to the AvailableChanged event.
     * @type {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>}
    */
    OnAvailableChanged {
        get {
            if(!this.HasProp("__OnAvailableChanged")){
                this.__OnAvailableChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31edabbd-d123-5e88-89d8-c80ee8f0f2ca}"),
                    PerceptionInfraredFrameSource,
                    IInspectable
                )
                this.__OnAvailableChangedToken := this.add_AvailableChanged(this.__OnAvailableChanged.iface)
            }
            return this.__OnAvailableChanged
        }
    }

    /**
     * Subscribes to the ActiveChanged event.
     * @type {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>}
    */
    OnActiveChanged {
        get {
            if(!this.HasProp("__OnActiveChanged")){
                this.__OnActiveChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31edabbd-d123-5e88-89d8-c80ee8f0f2ca}"),
                    PerceptionInfraredFrameSource,
                    IInspectable
                )
                this.__OnActiveChangedToken := this.add_ActiveChanged(this.__OnActiveChanged.iface)
            }
            return this.__OnActiveChanged
        }
    }

    /**
     * Subscribes to the PropertiesChanged event.
     * @type {TypedEventHandler<PerceptionInfraredFrameSource, PerceptionFrameSourcePropertiesChangedEventArgs>}
    */
    OnPropertiesChanged {
        get {
            if(!this.HasProp("__OnPropertiesChanged")){
                this.__OnPropertiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b6c1b828-a157-54ed-9c18-6919b9f91be9}"),
                    PerceptionInfraredFrameSource,
                    PerceptionFrameSourcePropertiesChangedEventArgs
                )
                this.__OnPropertiesChangedToken := this.add_PropertiesChanged(this.__OnPropertiesChanged.iface)
            }
            return this.__OnPropertiesChanged
        }
    }

    /**
     * Subscribes to the VideoProfileChanged event.
     * @type {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>}
    */
    OnVideoProfileChanged {
        get {
            if(!this.HasProp("__OnVideoProfileChanged")){
                this.__OnVideoProfileChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31edabbd-d123-5e88-89d8-c80ee8f0f2ca}"),
                    PerceptionInfraredFrameSource,
                    IInspectable
                )
                this.__OnVideoProfileChangedToken := this.add_VideoProfileChanged(this.__OnVideoProfileChanged.iface)
            }
            return this.__OnVideoProfileChanged
        }
    }

    /**
     * Subscribes to the CameraIntrinsicsChanged event.
     * @type {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>}
    */
    OnCameraIntrinsicsChanged {
        get {
            if(!this.HasProp("__OnCameraIntrinsicsChanged")){
                this.__OnCameraIntrinsicsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{31edabbd-d123-5e88-89d8-c80ee8f0f2ca}"),
                    PerceptionInfraredFrameSource,
                    IInspectable
                )
                this.__OnCameraIntrinsicsChangedToken := this.add_CameraIntrinsicsChanged(this.__OnCameraIntrinsicsChanged.iface)
            }
            return this.__OnCameraIntrinsicsChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnAvailableChangedToken")) {
            this.remove_AvailableChanged(this.__OnAvailableChangedToken)
            this.__OnAvailableChanged.iface.Dispose()
        }

        if(this.HasProp("__OnActiveChangedToken")) {
            this.remove_ActiveChanged(this.__OnActiveChangedToken)
            this.__OnActiveChanged.iface.Dispose()
        }

        if(this.HasProp("__OnPropertiesChangedToken")) {
            this.remove_PropertiesChanged(this.__OnPropertiesChangedToken)
            this.__OnPropertiesChanged.iface.Dispose()
        }

        if(this.HasProp("__OnVideoProfileChangedToken")) {
            this.remove_VideoProfileChanged(this.__OnVideoProfileChangedToken)
            this.__OnVideoProfileChanged.iface.Dispose()
        }

        if(this.HasProp("__OnCameraIntrinsicsChangedToken")) {
            this.remove_CameraIntrinsicsChanged(this.__OnCameraIntrinsicsChangedToken)
            this.__OnCameraIntrinsicsChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailableChanged(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.add_AvailableChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AvailableChanged(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.remove_AvailableChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActiveChanged(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.add_ActiveChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActiveChanged(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.remove_ActiveChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, PerceptionFrameSourcePropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertiesChanged(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.add_PropertiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PropertiesChanged(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.remove_PropertiesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoProfileChanged(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.add_VideoProfileChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoProfileChanged(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.remove_VideoProfileChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionInfraredFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraIntrinsicsChanged(handler) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.add_CameraIntrinsicsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraIntrinsicsChanged(token) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.remove_CameraIntrinsicsChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceKind() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_DeviceKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Available() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_Available()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Active() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_Active()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsControlled() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_IsControlled()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_Properties()
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_SupportedVideoProfiles() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_SupportedVideoProfiles()
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_AvailableVideoProfiles() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_AvailableVideoProfiles()
    }

    /**
     * 
     * @returns {PerceptionVideoProfile} 
     */
    get_VideoProfile() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_VideoProfile()
    }

    /**
     * 
     * @returns {CameraIntrinsics} 
     */
    get_CameraIntrinsics() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.get_CameraIntrinsics()
    }

    /**
     * Attempts to acquire Controller Mode on the infrared frame source.
     * @returns {PerceptionControlSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.acquirecontrolsession
     */
    AcquireControlSession() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.AcquireControlSession()
    }

    /**
     * Retrieves a boolean value indicating whether or not the infrared frame source can be controlled separately from another frame source.
     * @param {HSTRING} targetId A string representing the unique ID of the other frame source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.cancontrolindependentlyfrom
     */
    CanControlIndependentlyFrom(targetId) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.CanControlIndependentlyFrom(targetId)
    }

    /**
     * Checks whether or not the infrared frame source is correlated with the target entity.
     * @param {HSTRING} targetId The unique ID of the target entity.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.iscorrelatedwith
     */
    IsCorrelatedWith(targetId) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.IsCorrelatedWith(targetId)
    }

    /**
     * Gets the transform from the infrared frame source to the target entity and sets hasResult to true, if a correlation exists. If a correlation does not exist, hasResult is set to false and result is not modified.
     * @param {HSTRING} targetId The unique ID of the target entity.
     * @param {Pointer<Matrix4x4>} result_ If a correlation exists, this will be set to a 4x4 transform matrix that changes basis from the infrared frame source coordinate system to the target entity coordinate system.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.trygettransformto
     */
    TryGetTransformTo(targetId, result_) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.TryGetTransformTo(targetId, result_)
    }

    /**
     * Attempts to get the intrinsic properties of the depth camera that is correlated with this infrared source.
     * @param {PerceptionDepthFrameSource} target The depth frame source to try to get intrinsic properties of.
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCameraIntrinsics>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.trygetdepthcorrelatedcameraintrinsicsasync
     */
    TryGetDepthCorrelatedCameraIntrinsicsAsync(target) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.TryGetDepthCorrelatedCameraIntrinsicsAsync(target)
    }

    /**
     * Attempts to get a coordinate mapper that maps from infrared frame image space to depth frame space.
     * @param {HSTRING} targetId The unique ID of the depth frame source to try to map to.
     * @param {PerceptionDepthFrameSource} depthFrameSourceToMapWith The depth frame source to try to map to. This should be in a correlation group with the infrared frame source.
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCoordinateMapper>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.trygetdepthcorrelatedcoordinatemapperasync
     */
    TryGetDepthCorrelatedCoordinateMapperAsync(targetId, depthFrameSourceToMapWith) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.TryGetDepthCorrelatedCoordinateMapperAsync(targetId, depthFrameSourceToMapWith)
    }

    /**
     * Attempts to set a video profile on this infrared frame source. Requires an active Controller Mode control session on this frame source.
     * @param {PerceptionControlSession} controlSession A PerceptionControlSession representing active control of this frame source.
     * @param {PerceptionVideoProfile} profile_ The video profile to set.
     * @returns {IAsyncOperation<PerceptionFrameSourcePropertyChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.trysetvideoprofileasync
     */
    TrySetVideoProfileAsync(controlSession, profile_) {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.TrySetVideoProfileAsync(controlSession, profile_)
    }

    /**
     * Gets a frame reader that reads frames from this infrared frame source.
     * @returns {PerceptionInfraredFrameReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioninfraredframesource.openreader
     */
    OpenReader() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource := IPerceptionInfraredFrameSource(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource.OpenReader()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IPerceptionInfraredFrameSource2")) {
            if ((queryResult := this.QueryInterface(IPerceptionInfraredFrameSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionInfraredFrameSource2 := IPerceptionInfraredFrameSource2(outPtr)
        }

        return this.__IPerceptionInfraredFrameSource2.get_DeviceId()
    }

;@endregion Instance Methods
}
