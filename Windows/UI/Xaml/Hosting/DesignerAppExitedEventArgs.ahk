#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDesignerAppExitedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the DesignerAppManager.DesignerAppExited event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappexitedeventargs
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class DesignerAppExitedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDesignerAppExitedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDesignerAppExitedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the exit code with which the app exited.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.designerappexitedeventargs.exitcode
     * @type {Integer} 
     */
    ExitCode {
        get => this.get_ExitCode()
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
    get_ExitCode() {
        if (!this.HasProp("__IDesignerAppExitedEventArgs")) {
            if ((queryResult := this.QueryInterface(IDesignerAppExitedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDesignerAppExitedEventArgs := IDesignerAppExitedEventArgs(outPtr)
        }

        return this.__IDesignerAppExitedEventArgs.get_ExitCode()
    }

;@endregion Instance Methods
}
