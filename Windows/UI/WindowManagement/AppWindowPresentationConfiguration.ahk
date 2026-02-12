#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAppWindowPresentationConfiguration.ahk
#Include .\IAppWindowPresentationConfigurationFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the base configuration for an AppWindowPresenter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresentationconfiguration
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class AppWindowPresentationConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAppWindowPresentationConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAppWindowPresentationConfiguration.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the kind of presentation the app window is using.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.appwindowpresentationconfiguration.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
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
    get_Kind() {
        if (!this.HasProp("__IAppWindowPresentationConfiguration")) {
            if ((queryResult := this.QueryInterface(IAppWindowPresentationConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAppWindowPresentationConfiguration := IAppWindowPresentationConfiguration(outPtr)
        }

        return this.__IAppWindowPresentationConfiguration.get_Kind()
    }

;@endregion Instance Methods
}
