#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to a registered background task.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistration
     * @type {Guid}
     */
    static IID => Guid("{10654cc2-a26e-43bf-8c12-1fb40dbfbfa0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskId", "get_Name", "add_Progress", "remove_Progress", "add_Completed", "remove_Completed", "Unregister"]

    /**
     * Gets the identifier of a registered background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration.taskid
     * @type {Guid} 
     */
    TaskId {
        get => this.get_TaskId()
    }

    /**
     * Gets the name of a registered background task.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration.name
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TaskId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {BackgroundTaskProgressEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Progress(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Progress(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(9, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {BackgroundTaskCompletedEventHandler} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Completed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(10, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Completed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(11, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Unregisters a registered background task.
     * @param {Boolean} cancelTask True if currently running instances of this background task should be canceled. If this parameter is false, currently running instances of this background task should be allowed to finish. Canceled instances receive a Canceled event with a [BackgroundTaskCancellationReason](backgroundtaskcancellationreason.md) of **Abort**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration.unregister
     */
    Unregister(cancelTask) {
        result := ComCall(12, this, "int", cancelTask, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
