#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\Com\IUnknown.ahk

/**
 * Represents a method that handles completion events for a background task.
 * @remarks
 * Completion events are delivered only if the task completed while the application is in the foreground. If the application is suspended and then terminated, completion status is not delivered. If the application is suspended and then resumed, it is guaranteed to receive the completion notification.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.backgroundtaskcompletedeventhandler
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class BackgroundTaskCompletedEventHandler extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for BackgroundTaskCompletedEventHandler
     * @type {Guid}
     */
    static IID => Guid("{5b38e929-a086-46a7-a678-439135822bcf}")

    /**
     * The class identifier for BackgroundTaskCompletedEventHandler
     * @type {Guid}
     */
    static CLSID => Guid("{5b38e929-a086-46a7-a678-439135822bcf}")

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
     * @param {BackgroundTaskRegistration} sender 
     * @param {BackgroundTaskCompletedEventArgs} args 
     * @returns {HRESULT} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(sender, args) {
        result := ComCall(3, this, "ptr", sender, "ptr", args, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
