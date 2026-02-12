#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides access to a background task instance. Inherits from the [IBackgroundTaskInstance](ibackgroundtaskinstance.md) interface and adds the [GetThrottleCount](ibackgroundtaskinstance2_getthrottlecount_730175295.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance2
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskInstance2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskInstance2
     * @type {Guid}
     */
    static IID => Guid("{4f7d0176-0c76-4fb4-896d-5de1864122f6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetThrottleCount"]

    /**
     * Retrieves the number of times the background task has been suspended for using too many resources.
     * @param {Integer} counter Indicates the type of resource to include in the throttle count: network, CPU, or both.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.background.ibackgroundtaskinstance2.getthrottlecount
     */
    GetThrottleCount(counter) {
        result := ComCall(6, this, "int", counter, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
