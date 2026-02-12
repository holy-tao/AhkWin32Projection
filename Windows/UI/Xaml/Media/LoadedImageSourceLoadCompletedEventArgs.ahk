#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILoadedImageSourceLoadCompletedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [LoadedImageSurface.LoadCompleted](loadedimagesurface_loadcompleted.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesourceloadcompletedeventargs
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LoadedImageSourceLoadCompletedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILoadedImageSourceLoadCompletedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILoadedImageSourceLoadCompletedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates whether the operation was successful. If it failed, indicates the reason for the failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesourceloadcompletedeventargs.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
    get_Status() {
        if (!this.HasProp("__ILoadedImageSourceLoadCompletedEventArgs")) {
            if ((queryResult := this.QueryInterface(ILoadedImageSourceLoadCompletedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILoadedImageSourceLoadCompletedEventArgs := ILoadedImageSourceLoadCompletedEventArgs(outPtr)
        }

        return this.__ILoadedImageSourceLoadCompletedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
