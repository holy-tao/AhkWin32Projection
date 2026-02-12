#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents the method that will handle the [Suspending](application_suspending.md) event.
 * @remarks
 * The system suspends your app whenever the user switches to another app or to the desktop, and resumes your app whenever the user switches back to it. However, the system can also terminate your app while it is suspended in order to free up resources. Therefore, you should handle the [Suspending](application_suspending.md) event to perform the following operations:
 * 
 * 
 * + Preserve user session state.
 * + Release any exclusive locks on resources.
 * + Reduce memory usage if possible. For example, serialize any data that is easy to reconstruct in object form upon reactivation.
 * + Save app state.
 * The [Suspending](application_suspending.md) event is the only indication your app will receive prior to termination (if it happens). Because of this, you should store enough session state (such as the current article being read or the current movie playback position) to recreate the exact same experience during activation. The guidance for content creation apps is to save a user’s work early and often but also commit one final save during [Suspending](application_suspending.md). Saving data prior to suspension is useful because the [Suspending](application_suspending.md) event handler has only 5 seconds to complete its operation.
 * 
 * If your app is terminated, you can restore the app state in an [OnLaunched](application_onlaunched_859642554.md) method override. If your app resumes before it is terminated, the system restores the app state automatically. You should handle the [Resuming](application_resuming.md) event only if you need to refresh any displayed content that might have changed while the app is suspended, such as news feeds or the user's location.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.suspendingeventhandler
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class SuspendingEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for SuspendingEventHandler
     * @type {Guid}
     */
    static IID => Guid("{23429465-e36a-40e2-b139-a4704602a6e1}")

    /**
     * The class identifier for SuspendingEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{23429465-e36a-40e2-b139-a4704602a6e1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {IInspectable} sender 
     * @param {SuspendingEventArgs} e 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, e) {
        result := ComCall(3, this, "ptr", sender, "ptr", e, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
