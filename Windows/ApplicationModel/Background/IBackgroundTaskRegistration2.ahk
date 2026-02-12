#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IBackgroundTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to a registered background task. Inherits from the [IBackgroundTaskRegistration](ibackgroundtaskregistration.md) interface and adds the [Trigger](ibackgroundtaskregistration2_trigger.md) property.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration2
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistration2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistration2
     * @type {Guid}
     */
    static IID => Guid("{6138c703-bb86-4112-afc3-7f939b166e3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Trigger"]

    /**
     * Gets the trigger associated with the background task.
     * @remarks
     * For all unsupported trigger types, this property returns null.
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskregistration2.trigger
     * @type {IBackgroundTrigger} 
     */
    Trigger {
        get => this.get_Trigger()
    }

    /**
     * 
     * @returns {IBackgroundTrigger} 
     */
    get_Trigger() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBackgroundTrigger(value)
    }
}
