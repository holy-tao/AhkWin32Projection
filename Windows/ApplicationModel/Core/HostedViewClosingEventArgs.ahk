#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IHostedViewClosingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a [Deferral](../windows.foundation/deferral.md) you can call when the [HostedViewClosing](coreapplicationview_hostedviewclosing.md) event fires to defer the tear down of the hosted view.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.hostedviewclosingeventargs
 * @namespace Windows.ApplicationModel.Core
 * @version WindowsRuntime 1.4
 */
class HostedViewClosingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IHostedViewClosingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IHostedViewClosingEventArgs.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Provides an opportunity for hosted window scenarios to defer the tear down of the window, dispatcher, and Application Single-Threaded Apartment (ASTA) thread of the hosted view.
     * @remarks
     * If the deferral is taken, the hosted view's window, dispatcher, and Application Single-Threaded Apartment (ASTA) thread will not be torn down until the deferral is completed or a timeout value expires.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.core.hostedviewclosingeventargs.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IHostedViewClosingEventArgs")) {
            if ((queryResult := this.QueryInterface(IHostedViewClosingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IHostedViewClosingEventArgs := IHostedViewClosingEventArgs(outPtr)
        }

        return this.__IHostedViewClosingEventArgs.GetDeferral()
    }

;@endregion Instance Methods
}
