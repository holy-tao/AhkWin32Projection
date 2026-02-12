#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUINavigatedOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages an app navigation operation.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigatedoperation
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUINavigatedOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebUINavigatedOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebUINavigatedOperation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests that the completion of app navigation be delayed.
     * @remarks
     * When an app navigates or reloads its top level document, the system freezes the app’s visuals until the app indicates that it is ready to display its UI. The system transitions back to the app’s live UI when the app returns from its navigated event handler. However, some apps need to start asynchronous operations to retrieve state information and set up their UI (like using fragment loading to display app pages). Apps that must complete navigation asynchronously can get a deferral object from the navigated event arguments. This object enables the app to complete navigation outside its handler. When the app acquires the deferral object, its navigation is not completed when the navigation handler returns.
     * 
     * An app can complete navigation after its required asynchronous operations complete and it is ready to display its UI. App navigation is delayed until the app calls the [WebUINavigatedDeferral.complete](webuinavigateddeferral_complete_1807836922.md) method.
     * 
     * Note that before an app completes navigation the app will appear hung to the user. It is important for the app to complete navigation as quickly as possible.
     * @returns {WebUINavigatedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigatedoperation.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IWebUINavigatedOperation")) {
            if ((queryResult := this.QueryInterface(IWebUINavigatedOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUINavigatedOperation := IWebUINavigatedOperation(outPtr)
        }

        return this.__IWebUINavigatedOperation.GetDeferral()
    }

;@endregion Instance Methods
}
