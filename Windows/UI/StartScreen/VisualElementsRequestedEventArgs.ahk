#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisualElementsRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Passed to the [SecondaryTile.VisualElementsRequested](secondarytile_visualelementsrequested.md) event handler to provide the visual elements details.
 * @remarks
 * Your app receives this object when it processes the [SecondaryTile.VisualElementsRequested](secondarytile_visualelementsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequestedeventargs
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class VisualElementsRequestedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualElementsRequestedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualElementsRequestedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [VisualElementsRequest](visualelementsrequest.md) object for the event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequestedeventargs.request
     * @type {VisualElementsRequest} 
     */
    Request {
        get => this.get_Request()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {VisualElementsRequest} 
     */
    get_Request() {
        if (!this.HasProp("__IVisualElementsRequestedEventArgs")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequestedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequestedEventArgs := IVisualElementsRequestedEventArgs(outPtr)
        }

        return this.__IVisualElementsRequestedEventArgs.get_Request()
    }

;@endregion Instance Methods
}
