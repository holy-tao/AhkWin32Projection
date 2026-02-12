#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IApplicationInitializationCallbackParams.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents an object to pass information for a custom initialization sequence.
 * @remarks
 * In Windows 10 and later, this class is sealed.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.applicationinitializationcallbackparams
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ApplicationInitializationCallbackParams extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IApplicationInitializationCallbackParams

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IApplicationInitializationCallbackParams.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
