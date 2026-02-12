#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\SuspendingOperation.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data for an app suspending event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.isuspendingeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ISuspendingEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISuspendingEventArgs
     * @type {Guid}
     */
    static IID => Guid("{96061c05-2dba-4d08-b0bd-2b30a131c6aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SuspendingOperation"]

    /**
     * Gets the app suspending operation.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.isuspendingeventargs.suspendingoperation
     * @type {SuspendingOperation} 
     */
    SuspendingOperation {
        get => this.get_SuspendingOperation()
    }

    /**
     * Gets the app suspending operation.
     * @returns {SuspendingOperation} 
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/isuspendingeventargs-suspendingoperation
     */
    get_SuspendingOperation() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SuspendingOperation(value)
    }
}
