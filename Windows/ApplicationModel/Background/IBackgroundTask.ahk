#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a method to perform the work of a background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtask
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTask extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTask
     * @type {Guid}
     */
    static IID => Guid("{7d13d534-fd12-43ce-8c22-ea1ff13c06df}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Run"]

    /**
     * Performs the work of a background task. The system calls this method when the associated background task has been triggered.
     * @param {IBackgroundTaskInstance} taskInstance An interface to an instance of the background task. The system creates this instance when the task has been triggered to run.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtask.run
     */
    Run(taskInstance) {
        result := ComCall(6, this, "ptr", taskInstance, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
