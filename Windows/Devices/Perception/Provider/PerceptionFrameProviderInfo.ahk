#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPerceptionFrameProviderInfo.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * A specific set of properties describing a unique IPerceptionFrameProvider.
 * @remarks
 * The properties are:
 * 
 * Id - A unique identifier of the IPerceptionFrameProvider, for example, a [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) or "com.contoso.depthcamera.x500.serialNumber1234".
 * + This id must be persistent across reboots.
 * + This id must be different between devices for a single manufacturer.
 * + This id must be approximately globally unique such that there are no conflicts on any one host.
 * 
 * 
 * DisplayName - A friendly name for the provider, for example, "Contoso Depth Camera x500".
 * 
 * DeviceKind - A descriptor of the kind of FrameProvider categorically, for example, "com.contoso.depthcamera.x500".
 * 
 * FrameKind - The type of frames the device creates. This must be one of:
 * + KnownPerceptionFrameKind::Color
 * + KnownPerceptionFrameKind::Depth
 * + KnownPerceptionFrameKind::Infrared
 * 
 * 
 * Hidden - Whether or not the device enumerates via FindAllAsync or device added events on source watchers. If false, the device is accessible only via FromIdAsync. If false, and the device is registered in a FaceAuthenticationGroup, the device is still enumerated as a Face Authentication source.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class PerceptionFrameProviderInfo extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPerceptionFrameProviderInfo

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPerceptionFrameProviderInfo.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets the unique identifier of the IPerceptionFrameProvider.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo.id
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
        set => this.put_Id(value)
    }

    /**
     * Gets or sets the friendly name for the device, for example, "Contoso Depth Camera x500".
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
        set => this.put_DisplayName(value)
    }

    /**
     * Gets or sets the descriptor of the kind of FrameProvider categorically, for example, "com.contoso.depthcamera.x500".
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo.devicekind
     * @type {HSTRING} 
     */
    DeviceKind {
        get => this.get_DeviceKind()
        set => this.put_DeviceKind(value)
    }

    /**
     * Gets or sets the type of frames the device creates.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo.framekind
     * @type {HSTRING} 
     */
    FrameKind {
        get => this.get_FrameKind()
        set => this.put_FrameKind(value)
    }

    /**
     * Gets or sets a value indicating whether the device enumerates via FindAllAsync or device-added events on source watchers.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.perception.provider.perceptionframeproviderinfo.hidden
     * @type {Boolean} 
     */
    Hidden {
        get => this.get_Hidden()
        set => this.put_Hidden(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new PerceptionFrameProviderInfo instance.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Devices.Perception.Provider.PerceptionFrameProviderInfo")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.get_Id()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Id(value) {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.put_Id(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.get_DisplayName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DisplayName(value) {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.put_DisplayName(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceKind() {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.get_DeviceKind()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_DeviceKind(value) {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.put_DeviceKind(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_FrameKind() {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.get_FrameKind()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_FrameKind(value) {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.put_FrameKind(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Hidden() {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.get_Hidden()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Hidden(value) {
        if (!this.HasProp("__IPerceptionFrameProviderInfo")) {
            if ((queryResult := this.QueryInterface(IPerceptionFrameProviderInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPerceptionFrameProviderInfo := IPerceptionFrameProviderInfo(outPtr)
        }

        return this.__IPerceptionFrameProviderInfo.put_Hidden(value)
    }

;@endregion Instance Methods
}
