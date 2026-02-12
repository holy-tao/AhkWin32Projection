#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivatedDeferral.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages delayed activation for an app.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.activateddeferral
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class ActivatedDeferral extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivatedDeferral

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivatedDeferral.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Notifies the system that the app has set up its state and initial UI and is ready to be displayed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.activateddeferral.complete
     */
    Complete() {
        if (!this.HasProp("__IActivatedDeferral")) {
            if ((queryResult := this.QueryInterface(IActivatedDeferral.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedDeferral := IActivatedDeferral(outPtr)
        }

        return this.__IActivatedDeferral.Complete()
    }

;@endregion Instance Methods
}
