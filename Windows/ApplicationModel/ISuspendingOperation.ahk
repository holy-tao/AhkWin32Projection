#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\SuspendingDeferral.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides information about an app suspending operation.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.isuspendingoperation
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ISuspendingOperation extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISuspendingOperation
     * @type {Guid}
     */
    static IID => Guid("{9da4ca41-20e1-4e9b-9f65-a9f435340c3a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral", "get_Deadline"]

    /**
     * Gets the time remaining before a delayed app suspending operation continues.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.isuspendingoperation.deadline
     * @type {DateTime} 
     */
    Deadline {
        get => this.get_Deadline()
    }

    /**
     * Requests that the app suspending operation be delayed.
     * @returns {SuspendingDeferral} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/isuspendingoperation-getdeferral
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &deferral_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SuspendingDeferral(deferral_)
    }

    /**
     * Gets the time remaining before a delayed app suspending operation continues.
     * @returns {DateTime} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/isuspendingoperation-deadline
     */
    get_Deadline() {
        value := DateTime()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
