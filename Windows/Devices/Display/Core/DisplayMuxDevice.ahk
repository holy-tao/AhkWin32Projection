#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayMuxDevice.ahk
#Include ..\..\..\Foundation\IClosable.ahk
#Include .\IDisplayMuxDeviceStatics.ahk
#Include ..\..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplayMuxDevice.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\..\WinRTEventHandler.ahk

/**
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayMuxDevice extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayMuxDevice

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayMuxDevice.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static GetDeviceSelector() {
        if (!DisplayMuxDevice.HasProp("__IDisplayMuxDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayMuxDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayMuxDeviceStatics.IID)
            DisplayMuxDevice.__IDisplayMuxDeviceStatics := IDisplayMuxDeviceStatics(factoryPtr)
        }

        return DisplayMuxDevice.__IDisplayMuxDeviceStatics.GetDeviceSelector()
    }

    /**
     * 
     * @param {HSTRING} deviceInterfaceId 
     * @returns {IAsyncOperation<DisplayMuxDevice>} 
     */
    static FromIdAsync(deviceInterfaceId) {
        if (!DisplayMuxDevice.HasProp("__IDisplayMuxDeviceStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Display.Core.DisplayMuxDevice")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayMuxDeviceStatics.IID)
            DisplayMuxDevice.__IDisplayMuxDeviceStatics := IDisplayMuxDeviceStatics(factoryPtr)
        }

        return DisplayMuxDevice.__IDisplayMuxDeviceStatics.FromIdAsync(deviceInterfaceId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * @type {HSTRING} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Boolean} 
     */
    IsActive {
        get => this.get_IsActive()
    }

    /**
     * @type {DisplayTarget} 
     */
    CurrentTarget {
        get => this.get_CurrentTarget()
    }

    /**
     * @type {DisplayTarget} 
     */
    PreferredTarget {
        get => this.get_PreferredTarget()
    }

    /**
     * @type {Boolean} 
     */
    IsAutomaticTargetSwitchingEnabled {
        get => this.get_IsAutomaticTargetSwitchingEnabled()
    }

    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{f63ed5f6-c9fb-5876-9e02-a31a9fee1157}"),
                    DisplayMuxDevice,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        this.Close()

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Id() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.get_Id()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsActive() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.get_IsActive()
    }

    /**
     * 
     * @returns {IVectorView<DisplayTarget>} 
     */
    GetAvailableMuxTargets() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.GetAvailableMuxTargets()
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_CurrentTarget() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.get_CurrentTarget()
    }

    /**
     * 
     * @returns {DisplayTarget} 
     */
    get_PreferredTarget() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.get_PreferredTarget()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutomaticTargetSwitchingEnabled() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.get_IsAutomaticTargetSwitchingEnabled()
    }

    /**
     * 
     * @param {DisplayTarget} target 
     * @returns {IAsyncAction} 
     */
    SetPreferredTarget(target) {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.SetPreferredTarget(target)
    }

    /**
     * 
     * @returns {IAsyncAction} 
     */
    SetAutomaticTargetSwitching() {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.SetAutomaticTargetSwitching()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayMuxDevice, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IDisplayMuxDevice")) {
            if ((queryResult := this.QueryInterface(IDisplayMuxDevice.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayMuxDevice := IDisplayMuxDevice(outPtr)
        }

        return this.__IDisplayMuxDevice.remove_Changed(token)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        if (!this.HasProp("__IClosable")) {
            if ((queryResult := this.QueryInterface(IClosable.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IClosable := IClosable(outPtr)
        }

        return this.__IClosable.Close()
    }

;@endregion Instance Methods
}
