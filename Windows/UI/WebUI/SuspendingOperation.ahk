#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include ..\..\ApplicationModel\ISuspendingOperation.ahk
#Include ..\..\..\Guid.ahk

/**
 * Manages an app suspension operation.
 * @remarks
 * Use the [SuspendingEventArgs.suspendingOperation](suspendingeventargs_suspendingoperation.md) property to get the object.
 * 
 * 
 * <!-- confirmed -->
 * > [!NOTE]
 * > This class is not agile, which means that you need to consider its threading model and marshaling behavior. For more info, see [Threading and Marshaling (C++/CX)](/cpp/cppcx/threading-and-marshaling-c-cx)
 * <!--[jjacks - removed this link (https://go.microsoft.com/fwlink/p/?linkid=258277 404->http://msdn.microsoft.com/library/windows/apps/jj157115.aspx) because it doesn't work] and Using Windows Runtime objects in a multithreaded environment (.NET)-->
 * .
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingoperation
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class SuspendingOperation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISuspendingOperation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISuspendingOperation.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the time remaining before a delayed app suspension operation continues.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingoperation.deadline
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
     * Requests that the app suspension operation be delayed.
     * @remarks
     * App suspension is delayed until the app calls the [SuspendingDeferral.complete](suspendingdeferral_complete_1807836922.md) method or the deadline for suspension has passed.
     * 
     * Use the deferral to complete asynchronous operations, such as saving data to a file, before the system suspends your app.
     * 
     * Note that requesting a deferral does not give your app more time to complete suspend, it simply allows you to complete asynchronous operations in the same amount of time that your app would normally get in the suspending event handler.
     * @returns {SuspendingDeferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.suspendingoperation.getdeferral
     */
    GetDeferral() {
        if (!this.HasProp("__ISuspendingOperation")) {
            if ((queryResult := this.QueryInterface(ISuspendingOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISuspendingOperation := ISuspendingOperation(outPtr)
        }

        return this.__ISuspendingOperation.GetDeferral()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Deadline() {
        if (!this.HasProp("__ISuspendingOperation")) {
            if ((queryResult := this.QueryInterface(ISuspendingOperation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISuspendingOperation := ISuspendingOperation(outPtr)
        }

        return this.__ISuspendingOperation.get_Deadline()
    }

;@endregion Instance Methods
}
