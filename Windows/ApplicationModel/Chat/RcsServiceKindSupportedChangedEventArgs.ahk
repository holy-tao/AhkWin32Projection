#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRcsServiceKindSupportedChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for the [ServiceKindSupportedChanged](rcstransport_servicekindsupportedchanged.md) event.
 * @remarks
 * An instance of this class is created by the system and passed as an argument to the [ServiceKindSupportedChanged](rcstransport_servicekindsupportedchanged.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsservicekindsupportedchangedeventargs
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class RcsServiceKindSupportedChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRcsServiceKindSupportedChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRcsServiceKindSupportedChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of the Rich Communication Services (RCS) service.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.chat.rcsservicekindsupportedchangedeventargs.servicekind
     * @type {Integer} 
     */
    ServiceKind {
        get => this.get_ServiceKind()
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
    get_ServiceKind() {
        if (!this.HasProp("__IRcsServiceKindSupportedChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRcsServiceKindSupportedChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRcsServiceKindSupportedChangedEventArgs := IRcsServiceKindSupportedChangedEventArgs(outPtr)
        }

        return this.__IRcsServiceKindSupportedChangedEventArgs.get_ServiceKind()
    }

;@endregion Instance Methods
}
