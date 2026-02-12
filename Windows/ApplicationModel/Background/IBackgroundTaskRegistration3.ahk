#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\BackgroundTaskRegistrationGroup.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a background task that has been registered as part of a group of related background tasks.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration3
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistration3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistration3
     * @type {Guid}
     */
    static IID => Guid("{fe338195-9423-4d8b-830d-b1dd2c7badd5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskGroup"]

    /**
     * Gets the [BackgroundTaskRegistrationGroup](backgroundtaskregistrationgroup.md) that this **BackgroundTaskRegistration** is a part of.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration3.taskgroup
     * @type {BackgroundTaskRegistrationGroup} 
     */
    TaskGroup {
        get => this.get_TaskGroup()
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
}
