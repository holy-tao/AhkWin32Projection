#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTaskRegistrationGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskBuilder4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskBuilder4
     * @type {Guid}
     */
    static IID => Guid("{4755e522-cba2-4e35-bd16-a6da7f1c19aa}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskGroup", "put_TaskGroup"]

    /**
     * @type {BackgroundTaskRegistrationGroup} 
     */
    TaskGroup {
        get => this.get_TaskGroup()
        set => this.put_TaskGroup(value)
    }

    /**
     * 
     * @returns {BackgroundTaskRegistrationGroup} 
     */
    get_TaskGroup() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BackgroundTaskRegistrationGroup(value)
    }

    /**
     * 
     * @param {BackgroundTaskRegistrationGroup} value 
     * @returns {HRESULT} 
     */
    put_TaskGroup(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
