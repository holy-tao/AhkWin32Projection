#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\UserDataTask.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.UserDataTasks
 * @version WindowsRuntime 1.4
 */
class IUserDataTaskBatch extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUserDataTaskBatch
     * @type {Guid}
     */
    static IID => Guid("{382da5fe-20b5-431c-8f42-a5d292ec930c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Tasks"]

    /**
     * @type {IVectorView<UserDataTask>} 
     */
    Tasks {
        get => this.get_Tasks()
    }

    /**
     * 
     * @returns {IVectorView<UserDataTask>} 
     */
    get_Tasks() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(UserDataTask, value)
    }
}
