#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionColorFrameSource.ahk
#Include .\IPerceptionColorFrameSource2.ahk
#Include .\IPerceptionColorFrameSourceStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\PerceptionColorFrameSource.ahk
#Include .\PerceptionFrameSourcePropertiesChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * A frame source that provides color frames.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource
 * @namespace Windows.Devices.Perception
 * @version WindowsRuntime 1.4
 */
class PerceptionColorFrameSource extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionColorFrameSource

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionColorFrameSource.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new color frame source watcher.
     * @returns {PerceptionColorFrameSourceWatcher} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.createwatcher
     */
    static CreateWatcher() {
        if (!PerceptionColorFrameSource.HasProp("__IPerceptionColorFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionColorFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionColorFrameSourceStatics.IID)
            PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics := IPerceptionColorFrameSourceStatics(factoryPtr)
        }

        return PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics.CreateWatcher()
    }

    /**
     * Finds all color frame sources.
     * @returns {IAsyncOperation<IVectorView<PerceptionColorFrameSource>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.findallasync
     */
    static FindAllAsync() {
        if (!PerceptionColorFrameSource.HasProp("__IPerceptionColorFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionColorFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionColorFrameSourceStatics.IID)
            PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics := IPerceptionColorFrameSourceStatics(factoryPtr)
        }

        return PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics.FindAllAsync()
    }

    /**
     * Finds an color frame source by looking up its unique ID.
     * @param {HSTRING} id The unique ID of the color frame source.
     * @returns {IAsyncOperation<PerceptionColorFrameSource>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.fromidasync
     */
    static FromIdAsync(id) {
        if (!PerceptionColorFrameSource.HasProp("__IPerceptionColorFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionColorFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionColorFrameSourceStatics.IID)
            PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics := IPerceptionColorFrameSourceStatics(factoryPtr)
        }

        return PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics.FromIdAsync(id)
    }

    /**
     * Requests access to use color frame sources.
     * @returns {IAsyncOperation<Integer>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.requestaccessasync
     */
    static RequestAccessAsync() {
        if (!PerceptionColorFrameSource.HasProp("__IPerceptionColorFrameSourceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.PerceptionColorFrameSource")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPerceptionColorFrameSourceStatics.IID)
            PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics := IPerceptionColorFrameSourceStatics(factoryPtr)
        }

        return PerceptionColorFrameSource.__IPerceptionColorFrameSourceStatics.RequestAccessAsync()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a string value indicating the unique ID of the color frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets a string value indicating the display name of the color frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Gets a string value indicating the kind of physical device that generates the color frames for this source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.devicekind
     * @type {HSTRING} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
    }

    /**
     * Gets a boolean value indicating whether or not the source is available.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.available
     * @type {Boolean} 
     */
    Available {
        get => this.get_Available()
    }

    /**
     * Gets a boolean value indicating whether or not the source is active.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.active
     * @type {Boolean} 
     */
    Active {
        get => this.get_Active()
    }

    /**
     * Gets a boolean value indicating whether or not the source is the subject of controller mode.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.iscontrolled
     * @type {Boolean} 
     */
    IsControlled {
        get => this.get_IsControlled()
    }

    /**
     * Gets a read-only collection of frame source properties.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.properties
     * @type {IMapView<HSTRING, IInspectable>} 
     */
    Properties {
        get => this.get_Properties()
    }

    /**
     * Gets a read-only collection of video profiles that are supported by the color frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.supportedvideoprofiles
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    SupportedVideoProfiles {
        get => this.get_SupportedVideoProfiles()
    }

    /**
     * Gets a read-only collection of video profiles that are currently available from the color frame source.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.availablevideoprofiles
     * @type {IVectorView<PerceptionVideoProfile>} 
     */
    AvailableVideoProfiles {
        get => this.get_AvailableVideoProfiles()
    }

    /**
     * Gets a PerceptionVideoProfile object indicating the current video profile.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.videoprofile
     * @type {PerceptionVideoProfile} 
     */
    VideoProfile {
        get => this.get_VideoProfile()
    }

    /**
     * Gets a CameraIntrinsics value specifying the intrinsic properties of the color frame source camera device.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.cameraintrinsics
     * @type {CameraIntrinsics} 
     */
    CameraIntrinsics {
        get => this.get_CameraIntrinsics()
    }

    /**
     * Gets a string value that identifies the device on the system.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * Subscribes to the AvailableChanged event.
     * @type {TypedEventHandler<PerceptionColorFrameSource, IInspectable>}
    */
    OnAvailableChanged {
        get {
            if(!this.HasProp("__OnAvailableChanged")){
                this.__OnAvailableChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{023444d9-7b47-5497-9569-4399faf96717}"),
                    PerceptionColorFrameSource,
                    IInspectable
                )
                this.__OnAvailableChangedToken := this.add_AvailableChanged(this.__OnAvailableChanged.iface)
            }
            return this.__OnAvailableChanged
        }
    }

    /**
     * Subscribes to the ActiveChanged event.
     * @type {TypedEventHandler<PerceptionColorFrameSource, IInspectable>}
    */
    OnActiveChanged {
        get {
            if(!this.HasProp("__OnActiveChanged")){
                this.__OnActiveChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{023444d9-7b47-5497-9569-4399faf96717}"),
                    PerceptionColorFrameSource,
                    IInspectable
                )
                this.__OnActiveChangedToken := this.add_ActiveChanged(this.__OnActiveChanged.iface)
            }
            return this.__OnActiveChanged
        }
    }

    /**
     * Subscribes to the PropertiesChanged event.
     * @type {TypedEventHandler<PerceptionColorFrameSource, PerceptionFrameSourcePropertiesChangedEventArgs>}
    */
    OnPropertiesChanged {
        get {
            if(!this.HasProp("__OnPropertiesChanged")){
                this.__OnPropertiesChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{b2c3a488-7ed9-5110-804a-9792ef7f26be}"),
                    PerceptionColorFrameSource,
                    PerceptionFrameSourcePropertiesChangedEventArgs
                )
                this.__OnPropertiesChangedToken := this.add_PropertiesChanged(this.__OnPropertiesChanged.iface)
            }
            return this.__OnPropertiesChanged
        }
    }

    /**
     * Subscribes to the VideoProfileChanged event.
     * @type {TypedEventHandler<PerceptionColorFrameSource, IInspectable>}
    */
    OnVideoProfileChanged {
        get {
            if(!this.HasProp("__OnVideoProfileChanged")){
                this.__OnVideoProfileChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{023444d9-7b47-5497-9569-4399faf96717}"),
                    PerceptionColorFrameSource,
                    IInspectable
                )
                this.__OnVideoProfileChangedToken := this.add_VideoProfileChanged(this.__OnVideoProfileChanged.iface)
            }
            return this.__OnVideoProfileChanged
        }
    }

    /**
     * Subscribes to the CameraIntrinsicsChanged event.
     * @type {TypedEventHandler<PerceptionColorFrameSource, IInspectable>}
    */
    OnCameraIntrinsicsChanged {
        get {
            if(!this.HasProp("__OnCameraIntrinsicsChanged")){
                this.__OnCameraIntrinsicsChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{023444d9-7b47-5497-9569-4399faf96717}"),
                    PerceptionColorFrameSource,
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
     * @param {TypedEventHandler<PerceptionColorFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AvailableChanged(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.add_AvailableChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AvailableChanged(token) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.remove_AvailableChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ActiveChanged(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.add_ActiveChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ActiveChanged(token) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.remove_ActiveChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSource, PerceptionFrameSourcePropertiesChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_PropertiesChanged(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.add_PropertiesChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_PropertiesChanged(token) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.remove_PropertiesChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_VideoProfileChanged(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.add_VideoProfileChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_VideoProfileChanged(token) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.remove_VideoProfileChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<PerceptionColorFrameSource, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_CameraIntrinsicsChanged(handler) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.add_CameraIntrinsicsChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_CameraIntrinsicsChanged(token) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.remove_CameraIntrinsicsChanged(token)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_Id()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_DisplayName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceKind() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_DeviceKind()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Available() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_Available()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Active() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_Active()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsControlled() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_IsControlled()
    }

    /**
     * 
     * @returns {IMapView<HSTRING, IInspectable>} 
     */
    get_Properties() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_Properties()
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_SupportedVideoProfiles() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_SupportedVideoProfiles()
    }

    /**
     * 
     * @returns {IVectorView<PerceptionVideoProfile>} 
     */
    get_AvailableVideoProfiles() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_AvailableVideoProfiles()
    }

    /**
     * 
     * @returns {PerceptionVideoProfile} 
     */
    get_VideoProfile() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_VideoProfile()
    }

    /**
     * 
     * @returns {CameraIntrinsics} 
     */
    get_CameraIntrinsics() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.get_CameraIntrinsics()
    }

    /**
     * Attempts to acquire Controller Mode on the color frame source.
     * @returns {PerceptionControlSession} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.acquirecontrolsession
     */
    AcquireControlSession() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.AcquireControlSession()
    }

    /**
     * This method returns a boolean value indicating whether or not the color frame source can be controlled separately from another frame source.
     * @param {HSTRING} targetId A string representing the unique ID of the other frame source.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.cancontrolindependentlyfrom
     */
    CanControlIndependentlyFrom(targetId) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.CanControlIndependentlyFrom(targetId)
    }

    /**
     * Checks whether or not the color frame source is correlated with the target entity. If the result is true, a transform matrix can be retrieved to change coordinate basis from this color frame source to the entity, or vice versa.
     * @param {HSTRING} targetId The unique ID of the target entity.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.iscorrelatedwith
     */
    IsCorrelatedWith(targetId) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.IsCorrelatedWith(targetId)
    }

    /**
     * This method returns the transform from the color frame source to the target entity and sets hasResult to true, if a correlation exists. If a correlation does not exist, hasResult is set to false and result is not modified.
     * @param {HSTRING} targetId The unique ID of the target entity.
     * @param {Pointer<Matrix4x4>} result_ If a correlation exists, this will be set to a 4x4 transform matrix that changes basis from the color frame source coordinate system to the target entity coordinate system.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.trygettransformto
     */
    TryGetTransformTo(targetId, result_) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.TryGetTransformTo(targetId, result_)
    }

    /**
     * Attempts to get the intrinsic properties of the depth camera that is correlated with this color source.
     * @param {PerceptionDepthFrameSource} correlatedDepthFrameSource The depth frame source to try to get intrinsic properties of.
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCameraIntrinsics>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.trygetdepthcorrelatedcameraintrinsicsasync
     */
    TryGetDepthCorrelatedCameraIntrinsicsAsync(correlatedDepthFrameSource) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.TryGetDepthCorrelatedCameraIntrinsicsAsync(correlatedDepthFrameSource)
    }

    /**
     * Attempts to get a coordinate mapper that maps from color frame image space to depth frame space.
     * @param {HSTRING} targetSourceId The unique ID of the depth frame source to try to map to.
     * @param {PerceptionDepthFrameSource} correlatedDepthFrameSource The depth frame source to try to map to. This should be in a correlation group with the color frame source.
     * @returns {IAsyncOperation<PerceptionDepthCorrelatedCoordinateMapper>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.trygetdepthcorrelatedcoordinatemapperasync
     */
    TryGetDepthCorrelatedCoordinateMapperAsync(targetSourceId, correlatedDepthFrameSource) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.TryGetDepthCorrelatedCoordinateMapperAsync(targetSourceId, correlatedDepthFrameSource)
    }

    /**
     * Attempts to set a video profile on this color frame source. Requires an active Controller Mode control session on this frame source.
     * @param {PerceptionControlSession} controlSession A PerceptionControlSession representing active control of this frame source.
     * @param {PerceptionVideoProfile} profile_ The video profile to set.
     * @returns {IAsyncOperation<PerceptionFrameSourcePropertyChangeResult>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.trysetvideoprofileasync
     */
    TrySetVideoProfileAsync(controlSession, profile_) {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.TrySetVideoProfileAsync(controlSession, profile_)
    }

    /**
     * Gets a frame reader that reads frames from this color frame source.
     * @returns {PerceptionColorFrameReader} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.perceptioncolorframesource.openreader
     */
    OpenReader() {
        if (!this.HasProp("__IPerceptionColorFrameSource")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource := IPerceptionColorFrameSource(outPtr)
        }

        return this.__IPerceptionColorFrameSource.OpenReader()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IPerceptionColorFrameSource2")) {
            if ((queryResult := this.QueryInterface(IPerceptionColorFrameSource2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionColorFrameSource2 := IPerceptionColorFrameSource2(outPtr)
        }

        return this.__IPerceptionColorFrameSource2.get_DeviceId()
    }

;@endregion Instance Methods
}
