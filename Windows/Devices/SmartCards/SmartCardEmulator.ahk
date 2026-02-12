#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardEmulator.ahk
#Include .\ISmartCardEmulator2.ahk
#Include .\ISmartCardEmulatorStatics2.ahk
#Include .\ISmartCardEmulatorStatics.ahk
#Include .\ISmartCardEmulatorStatics3.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\SmartCardEmulator.ahk
#Include .\SmartCardEmulatorApduReceivedEventArgs.ahk
#Include .\SmartCardEmulatorConnectionDeactivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a smart card emulator device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulator extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardEmulator

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardEmulator.IID

    /**
     * Gets the maximum number of permitted applet ID group registrations.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.maxappletidgroupregistrations
     * @type {Integer} 
     */
    static MaxAppletIdGroupRegistrations {
        get => SmartCardEmulator.get_MaxAppletIdGroupRegistrations()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the registered applet identifier groups for this smart card, asynchronously.
     * @returns {IAsyncOperation<IVectorView<SmartCardAppletIdGroupRegistration>>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.getappletidgroupregistrationsasync
     */
    static GetAppletIdGroupRegistrationsAsync() {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics2.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics2 := ISmartCardEmulatorStatics2(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics2.GetAppletIdGroupRegistrationsAsync()
    }

    /**
     * Asynchronously registers a group of applet IDs.
     * @param {SmartCardAppletIdGroup} appletIdGroup The group of applet IDs to register.
     * @returns {IAsyncOperation<SmartCardAppletIdGroupRegistration>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.registerappletidgroupasync
     */
    static RegisterAppletIdGroupAsync(appletIdGroup) {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics2.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics2 := ISmartCardEmulatorStatics2(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics2.RegisterAppletIdGroupAsync(appletIdGroup)
    }

    /**
     * Asynchronously unregisters a previously registered group of applet IDs.
     * @param {SmartCardAppletIdGroupRegistration} registration The previously registered group of applet IDs.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.unregisterappletidgroupasync
     */
    static UnregisterAppletIdGroupAsync(registration) {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics2.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics2 := ISmartCardEmulatorStatics2(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics2.UnregisterAppletIdGroupAsync(registration)
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_MaxAppletIdGroupRegistrations() {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics2.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics2 := ISmartCardEmulatorStatics2(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics2.get_MaxAppletIdGroupRegistrations()
    }

    /**
     * Returns the [SmartCardEmulator](smartcardemulator.md) object representing the default smart card emulator device.
     * @returns {IAsyncOperation<SmartCardEmulator>} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.getdefaultasync
     */
    static GetDefaultAsync() {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics := ISmartCardEmulatorStatics(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics.GetDefaultAsync()
    }

    /**
     * Returns whether the SmartCardEmulator is supported.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.issupported
     */
    static IsSupported() {
        if (!SmartCardEmulator.HasProp("__ISmartCardEmulatorStatics3")) {
            activatableClassId := HSTRING.Create("Windows.Devices.SmartCards.SmartCardEmulator")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISmartCardEmulatorStatics3.IID)
            SmartCardEmulator.__ISmartCardEmulatorStatics3 := ISmartCardEmulatorStatics3(factoryPtr)
        }

        return SmartCardEmulator.__ISmartCardEmulatorStatics3.IsSupported()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current card emulation policy set by the user.
     * @remarks
     * You can launch the URI `ms-settings-nfctransactions:` from within your app to take the user to the NFC control panel for transactions so they can change the enablement policy.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.enablementpolicy
     * @type {Integer} 
     */
    EnablementPolicy {
        get => this.get_EnablementPolicy()
    }

    /**
     * Occurs when an application protocol data unit (APDU) is received by the NFC controller.
     * @type {TypedEventHandler<SmartCardEmulator, SmartCardEmulatorApduReceivedEventArgs>}
    */
    OnApduReceived {
        get {
            if(!this.HasProp("__OnApduReceived")){
                this.__OnApduReceived := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{146f9403-42f4-59a2-a85a-8294af3e3e78}"),
                    SmartCardEmulator,
                    SmartCardEmulatorApduReceivedEventArgs
                )
                this.__OnApduReceivedToken := this.add_ApduReceived(this.__OnApduReceived.iface)
            }
            return this.__OnApduReceived
        }
    }

    /**
     * Occurs when the connection with the device is physically broken or when the NFC reader requests a connection to a different app.
     * @type {TypedEventHandler<SmartCardEmulator, SmartCardEmulatorConnectionDeactivatedEventArgs>}
    */
    OnConnectionDeactivated {
        get {
            if(!this.HasProp("__OnConnectionDeactivated")){
                this.__OnConnectionDeactivated := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cb9840cb-cc46-5c37-ab00-dd23d77b263b}"),
                    SmartCardEmulator,
                    SmartCardEmulatorConnectionDeactivatedEventArgs
                )
                this.__OnConnectionDeactivatedToken := this.add_ConnectionDeactivated(this.__OnConnectionDeactivated.iface)
            }
            return this.__OnConnectionDeactivated
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnApduReceivedToken")) {
            this.remove_ApduReceived(this.__OnApduReceivedToken)
            this.__OnApduReceived.iface.Dispose()
        }

        if(this.HasProp("__OnConnectionDeactivatedToken")) {
            this.remove_ConnectionDeactivated(this.__OnConnectionDeactivatedToken)
            this.__OnConnectionDeactivated.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EnablementPolicy() {
        if (!this.HasProp("__ISmartCardEmulator")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator := ISmartCardEmulator(outPtr)
        }

        return this.__ISmartCardEmulator.get_EnablementPolicy()
    }

    /**
     * 
     * @param {TypedEventHandler<SmartCardEmulator, SmartCardEmulatorApduReceivedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ApduReceived(value) {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.add_ApduReceived(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ApduReceived(value) {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.remove_ApduReceived(value)
    }

    /**
     * 
     * @param {TypedEventHandler<SmartCardEmulator, SmartCardEmulatorConnectionDeactivatedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_ConnectionDeactivated(value) {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.add_ConnectionDeactivated(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} value 
     * @returns {HRESULT} 
     */
    remove_ConnectionDeactivated(value) {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.remove_ConnectionDeactivated(value)
    }

    /**
     * Starts the smart card emulator. This method must be called from a background task.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.start
     */
    Start() {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.Start()
    }

    /**
     * Gets a Boolean value indicating if host card emulation is supported by this device.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulator.ishostcardemulationsupported
     */
    IsHostCardEmulationSupported() {
        if (!this.HasProp("__ISmartCardEmulator2")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulator2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulator2 := ISmartCardEmulator2(outPtr)
        }

        return this.__ISmartCardEmulator2.IsHostCardEmulationSupported()
    }

;@endregion Instance Methods
}
