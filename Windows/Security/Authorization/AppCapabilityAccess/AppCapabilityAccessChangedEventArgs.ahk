#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppCapabilityAccessChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the AccessChanged event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.security.authorization.appcapabilityaccess.appcapabilityaccesschangedeventargs
 * @namespace Windows.Security.Authorization.AppCapabilityAccess
 * @version WindowsRuntime 1.4
 */
class AppCapabilityAccessChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppCapabilityAccessChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppCapabilityAccessChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
