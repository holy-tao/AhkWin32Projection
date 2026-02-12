#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISvgImageSourceFailedEventArgs.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides event data for the [SvgImageSource.OpenFailed](svgimagesource_openfailed.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesourcefailedeventargs
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class SvgImageSourceFailedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISvgImageSourceFailedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISvgImageSourceFailedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates the reason for the SVG loading failure.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesourcefailedeventargs.status
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
        if (!this.HasProp("__ISvgImageSourceFailedEventArgs")) {
            if ((queryResult := this.QueryInterface(ISvgImageSourceFailedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISvgImageSourceFailedEventArgs := ISvgImageSourceFailedEventArgs(outPtr)
        }

        return this.__ISvgImageSourceFailedEventArgs.get_Status()
    }

;@endregion Instance Methods
}
