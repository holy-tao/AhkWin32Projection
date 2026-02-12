#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\ISuspendingDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages delayed suspension for an app. GetDeferral
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingdeferral
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class SuspendingDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISuspendingDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISuspendingDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has saved its data and is ready to be suspended.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingdeferral.complete
     */
    Complete() {
        if (!this.HasProp("__ISuspendingDeferral")) {
            if ((queryResult := this.QueryInterface(ISuspendingDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISuspendingDeferral := ISuspendingDeferral(outPtr)
        }

        return this.__ISuspendingDeferral.Complete()
    }

;@endregion Instance Methods
}
