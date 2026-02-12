#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebUINavigatedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides data for an app navigation event.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigatedeventargs
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class WebUINavigatedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebUINavigatedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebUINavigatedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the app navigation operation.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.webuinavigatedeventargs.navigatedoperation
     * @type {WebUINavigatedOperation} 
     */
    NavigatedOperation {
        get => this.get_NavigatedOperation()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {WebUINavigatedOperation} 
     */
    get_NavigatedOperation() {
        if (!this.HasProp("__IWebUINavigatedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebUINavigatedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebUINavigatedEventArgs := IWebUINavigatedEventArgs(outPtr)
        }

        return this.__IWebUINavigatedEventArgs.get_NavigatedOperation()
    }

;@endregion Instance Methods
}
