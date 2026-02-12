#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowingEnvironmentRemovedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides event data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironmentremovedeventargs
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class WindowingEnvironmentRemovedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowingEnvironmentRemovedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowingEnvironmentRemovedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the windowing environment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironmentremovedeventargs.windowingenvironment
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        if (!this.HasProp("__IWindowingEnvironmentRemovedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironmentRemovedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironmentRemovedEventArgs := IWindowingEnvironmentRemovedEventArgs(outPtr)
        }

        return this.__IWindowingEnvironmentRemovedEventArgs.get_WindowingEnvironment()
    }

;@endregion Instance Methods
}
