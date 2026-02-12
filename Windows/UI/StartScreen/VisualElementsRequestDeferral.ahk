#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IVisualElementsRequestDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * A deferral object used during the creation of the **Pin to Start**  flyout. By using this object, the app can delay the display of the flyout while it gathers the information and assets that will be shown in that flyout.
 * @remarks
 * An instance of this object is obtained when you call [VisualElementsRequest.getDeferral](visualelementsrequest_getdeferral_254836512.md).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequestdeferral
 * @namespace Windows.UI.StartScreen
 * @version WindowsRuntime 1.4
 */
class VisualElementsRequestDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IVisualElementsRequestDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IVisualElementsRequestDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Tells Windows that the app is ready to display the **Pin to Start**  flyout. The app calls this method when it has finished setting the properties that specify what to show in that flyout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.startscreen.visualelementsrequestdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IVisualElementsRequestDeferral")) {
            if ((queryResult := this.QueryInterface(IVisualElementsRequestDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IVisualElementsRequestDeferral := IVisualElementsRequestDeferral(outPtr)
        }

        return this.__IVisualElementsRequestDeferral.Complete()
    }

;@endregion Instance Methods
}
