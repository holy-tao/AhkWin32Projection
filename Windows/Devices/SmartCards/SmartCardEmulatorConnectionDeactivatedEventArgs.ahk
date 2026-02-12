#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardEmulatorConnectionDeactivatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ConnectionDeactivated](smartcardemulator_connectiondeactivated.md) event.
 * @remarks
 * The system generates an instance of this class and passes it as an argument to the application's [ConnectionDeactivated](smartcardemulator_connectiondeactivated.md) event handler.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectiondeactivatedeventargs
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorConnectionDeactivatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardEmulatorConnectionDeactivatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardEmulatorConnectionDeactivatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the connection properties for the smart card emulator.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectiondeactivatedeventargs.connectionproperties
     * @type {SmartCardEmulatorConnectionProperties} 
     */
    ConnectionProperties {
        get => this.get_ConnectionProperties()
    }

    /**
     * Gets the reason that the smart card connection to the NFC reader was deactivated.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectiondeactivatedeventargs.reason
     * @type {Integer} 
     */
    Reason {
        get => this.get_Reason()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SmartCardEmulatorConnectionProperties} 
     */
    get_ConnectionProperties() {
        if (!this.HasProp("__ISmartCardEmulatorConnectionDeactivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorConnectionDeactivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorConnectionDeactivatedEventArgs := ISmartCardEmulatorConnectionDeactivatedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorConnectionDeactivatedEventArgs.get_ConnectionProperties()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Reason() {
        if (!this.HasProp("__ISmartCardEmulatorConnectionDeactivatedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorConnectionDeactivatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorConnectionDeactivatedEventArgs := ISmartCardEmulatorConnectionDeactivatedEventArgs(outPtr)
        }

        return this.__ISmartCardEmulatorConnectionDeactivatedEventArgs.get_Reason()
    }

;@endregion Instance Methods
}
