#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisualElementsRequest.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a method to delay the display of the **Pin to Start**  flyout, as well as methods through which you can set the visual elements of the secondary tile to be presented in that flyout as well as alternate versions of the tile that can also be presented as options.
  * 
  * > On Windows Phone 8.1, the secondary tile is created without showing the user a flyout, prompting them for confirmation, or allowing them to choose an alternate version of the tile.
 * @remarks
 * This object is obtained by calling the [Request](visualelementsrequestedeventargs_request.md) method of the [VisualElementsRequestedEventArgs](visualelementsrequestedeventargs.md) object obtained through the [VisualElementsRequested](secondarytile_visualelementsrequested.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequest
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class VisualElementsRequest extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualElementsRequest

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualElementsRequest.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a copy of the parent secondary tile's [SecondaryTileVisualElements](secondarytilevisualelements.md)object. The visual elements properties can be set or read through this object. When [deferral](visualelementsrequest_getdeferral_254836512.md) is complete (or the handler returns without a deferral), the properties in this object are verified and then reflected in the **Pin to Start**  flyout.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequest.visualelements
     * @type {SecondaryTileVisualElements} 
     */
    VisualElements {
        get => this.get_VisualElements()
    }

    /**
     * Gets a set of objects that provide alternate logo images, background and foreground colors, and display name. These alternates are shown to the user in the **Pin to Start**  flyout.
     * 
     * > On Windows Phone 8.1, the secondary tile is created without showing the user a flyout, prompting them for confirmation, or allowing them to choose an alternate version of the tile.
     * @remarks
     * For each [SecondaryTileVisualElements](secondarytilevisualelements.md) object in the array, any property left undeclared is given the default value. App name display properties should be specified for each alternate set because their default is **false**.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequest.alternatevisualelements
     * @type {IVectorView<SecondaryTileVisualElements>} 
     */
    AlternateVisualElements {
        get => this.get_AlternateVisualElements()
    }

    /**
     * Gets the approximate time at which the [deferral](visualelementsrequest_getdeferral_254836512.md) will time-out.
     * @remarks
     * If the deferral time-out is reached and the developer has not called the [Complete](visualelementsrequestdeferral_complete_1807836922.md) method, the tile properties present before the event was fired are used— all properties set in the handler are ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequest.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {SecondaryTileVisualElements} 
     */
    get_VisualElements() {
        if (!this.HasProp("__IVisualElementsRequest")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequest := IVisualElementsRequest(outPtr)
        }

        return this.__IVisualElementsRequest.get_VisualElements()
    }

    /**
     * 
     * @returns {IVectorView<SecondaryTileVisualElements>} 
     */
    get_AlternateVisualElements() {
        if (!this.HasProp("__IVisualElementsRequest")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequest := IVisualElementsRequest(outPtr)
        }

        return this.__IVisualElementsRequest.get_AlternateVisualElements()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__IVisualElementsRequest")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequest := IVisualElementsRequest(outPtr)
        }

        return this.__IVisualElementsRequest.get_Deadline()
    }

    /**
     * Retrieves a deferral object, which allows the app time to provide information and assets used in the **Pin to Start**  flyout.
     * @remarks
     * If you call this method, you must follow it with a call to [Complete](visualelementsrequestdeferral_complete_1807836922.md) before the deferral period times out. If you don't, any properties set during the deferral period are ignored.
     * @returns {VisualElementsRequestDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequest.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IVisualElementsRequest")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequest.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequest := IVisualElementsRequest(outPtr)
        }

        return this.__IVisualElementsRequest.GetDeferral()
    }

;@endregion Instance Methods
}
