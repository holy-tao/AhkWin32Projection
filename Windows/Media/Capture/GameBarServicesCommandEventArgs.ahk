#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGameBarServicesCommandEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [GameBarServices.CommandReceived](./gamebarservices_commandreceived.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicescommandeventargs
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class GameBarServicesCommandEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGameBarServicesCommandEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGameBarServicesCommandEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value specifying the Game Bar command associated with the event.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicescommandeventargs.command
     * @type {Integer} 
     */
    Command {
        get => this.get_Command()
    }

    /**
     * Gets a value specifying the origin of the Game Bar command.
     * @see https://learn.microsoft.com/uwp/api/windows.media.capture.gamebarservicescommandeventargs.origin
     * @type {Integer} 
     */
    Origin {
        get => this.get_Origin()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Command() {
        if (!this.HasProp("__IGameBarServicesCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesCommandEventArgs := IGameBarServicesCommandEventArgs(outPtr)
        }

        return this.__IGameBarServicesCommandEventArgs.get_Command()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Origin() {
        if (!this.HasProp("__IGameBarServicesCommandEventArgs")) {
            if ((queryResult := this.QueryInterface(IGameBarServicesCommandEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameBarServicesCommandEventArgs := IGameBarServicesCommandEventArgs(outPtr)
        }

        return this.__IGameBarServicesCommandEventArgs.get_Origin()
    }

;@endregion Instance Methods
}
