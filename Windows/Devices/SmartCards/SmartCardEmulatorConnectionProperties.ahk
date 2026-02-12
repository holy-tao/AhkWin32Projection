#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISmartCardEmulatorConnectionProperties.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides information about a smart card emulator connection to an NFC reader.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectionproperties
 * @namespace Windows.Devices.SmartCards
 * @version WindowsRuntime 1.4
 */
class SmartCardEmulatorConnectionProperties extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISmartCardEmulatorConnectionProperties

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISmartCardEmulatorConnectionProperties.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the identifier for the connection.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectionproperties.id
     * @type {Guid} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * Gets an enum value indicating if the connection is to an NFC reader or something else.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.smartcards.smartcardemulatorconnectionproperties.source
     * @type {Integer} 
     */
    Source {
        get => this.get_Source()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Id() {
        if (!this.HasProp("__ISmartCardEmulatorConnectionProperties")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorConnectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorConnectionProperties := ISmartCardEmulatorConnectionProperties(outPtr)
        }

        return this.__ISmartCardEmulatorConnectionProperties.get_Id()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Source() {
        if (!this.HasProp("__ISmartCardEmulatorConnectionProperties")) {
            if ((queryResult := this.QueryInterface(ISmartCardEmulatorConnectionProperties.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISmartCardEmulatorConnectionProperties := ISmartCardEmulatorConnectionProperties(outPtr)
        }

        return this.__ISmartCardEmulatorConnectionProperties.get_Source()
    }

;@endregion Instance Methods
}
