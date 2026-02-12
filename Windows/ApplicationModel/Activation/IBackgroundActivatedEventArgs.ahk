#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\Background\IBackgroundTaskInstance.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Makes all data available from the [IBackgroundTask.Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method available to your event handler when your app is activated by a background trigger.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ibackgroundactivatedeventargs
 * @namespace Windows.ApplicationModel.Activation
 * @version WindowsRuntime 1.4
 */
class IBackgroundActivatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundActivatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{ab14bee0-e760-440e-a91c-44796de3a92d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskInstance"]

    /**
     * Get the data that was available to the [IBackgroundTask.Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method that resulted in your app being activated.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.activation.ibackgroundactivatedeventargs.taskinstance
     * @type {IBackgroundTaskInstance} 
     */
    TaskInstance {
        get => this.get_TaskInstance()
    }

    /**
     * 
     * @returns {IBackgroundTaskInstance} 
     */
    get_TaskInstance() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBackgroundTaskInstance(value)
    }
}
