#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to an instance of a background task.
  * 
  * > [!NOTE]
  * > Once the background task sets this property and has therefore completed its work, the task must explicitly call the Web Workers [close](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) method to terminate itself.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iwebuibackgroundtaskinstance
 * @namespace Windows.UI.WebUI
 * @version WindowsRuntime 1.4
 */
class IWebUIBackgroundTaskInstance extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebUIBackgroundTaskInstance
     * @type {Guid}
     */
    static IID => Guid("{23f12c25-e2f7-4741-bc9c-394595de24dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Succeeded", "put_Succeeded"]

    /**
     * Gets or sets the success value for the background task. The success value is what is returned to the foreground instance of your app in the [completed](../windows.applicationmodel.background/backgroundtaskregistration_completed.md) event.
     * @remarks
     * An app can set this property to false to indicate that the background task has failed. Otherwise this property is always true. The foreground instance of your app can check if the task succeeded using the [completed](../windows.applicationmodel.background/backgroundtaskregistration_completed.md) event. The [checkResult ](../windows.applicationmodel.background/backgroundtaskcompletedeventargs_checkresult_301563999.md) method on the event args will throw an exception if the succeeded property is set to false. 
     * 
     * > [!NOTE]
     * > Once the background task sets this property and has therefore completed its work, the task must explicitly call the Web Workers [close](/previous-versions/windows/internet-explorer/ie-developer/dev-guides/hh673568(v=vs.85)) method to terminate itself.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.webui.iwebuibackgroundtaskinstance.succeeded
     * @type {Boolean} 
     */
    Succeeded {
        get => this.get_Succeeded()
        set => this.put_Succeeded(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Succeeded() {
        result := ComCall(6, this, "int*", &succeeded := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return succeeded
    }

    /**
     * 
     * @param {Boolean} succeeded 
     * @returns {HRESULT} 
     */
    put_Succeeded(succeeded) {
        result := ComCall(7, this, "int", succeeded, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
