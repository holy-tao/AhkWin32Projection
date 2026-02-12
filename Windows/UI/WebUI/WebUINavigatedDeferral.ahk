#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUINavigatedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages delayed navigation for an app.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigateddeferral
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUINavigatedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebUINavigatedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebUINavigatedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has set up its state and UI and is ready to be displayed after a top level navigation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigateddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IWebUINavigatedDeferral")) {
            if ((queryResult := this.QueryInterface(IWebUINavigatedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUINavigatedDeferral := IWebUINavigatedDeferral(outPtr)
        }

        return this.__IWebUINavigatedDeferral.Complete()
    }

;@endregion Instance Methods
}
