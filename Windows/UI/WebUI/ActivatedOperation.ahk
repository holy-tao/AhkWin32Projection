#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IActivatedOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages an app activation operation.
 * @remarks
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx)
 * <!--[jjacks - removed this link (https://go.microsoft.com/fwlink/p/?linkid=258277 404->http://msdn.microsoft.com/library/windows/apps/jj157115.aspx) because it doesn't work] and Using Windows Runtime objects in a multithreaded environment (.NET)-->
 * .
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.activatedoperation
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class ActivatedOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IActivatedOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IActivatedOperation.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Requests that the completion of app activation be delayed.
     * @remarks
     * When an app starts, the system displays its splash screen until the app indicates that it is ready to display its UI by returning from its activation handler. The app has several seconds to set up its state and initial UI. The UI for the app is displayed to the user when the app returns from its activation handler. However, some apps need to start asynchronous operations to retrieve state information and set up their UI (like using fragment loading to display app pages). Apps that must complete activation asynchronously can get a deferral object from the activation event arguments. This object enables the app to complete activation outside its handler. When the app acquires the deferral object, its activation is not completed when the activation handler returns.
     * 
     * An app can complete activation after its required asynchronous operations complete and it is ready to display its UI. App activation is delayed until the app calls the [ActivatedDeferral.complete](activateddeferral_complete_1807836922.md) method.
     * 
     * Requesting a deferral enables an app to display its static splash screen for up to 15 seconds. If the app hasn't completed activation after 15 seconds, the system considers the app hung and will terminate it if the user navigates away from the splash screen.
     * 
     * Note that in normal circumstances and app should take no more than a few seconds to finish activation. If your app requires more than 3 or 4 seconds to restore state and prepare its UI, then you should finish activation and display an [extended splash screen](/previous-versions/windows/apps/hh700390(v=win.10)) screen until your app is ready.
     * @returns {ActivatedDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.activatedoperation.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__IActivatedOperation")) {
            if ((queryResult := this.QueryInterface(IActivatedOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IActivatedOperation := IActivatedOperation(outPtr)
        }

        return this.__IActivatedOperation.GetDeferral()
    }

;@endregion Instance Methods
}
