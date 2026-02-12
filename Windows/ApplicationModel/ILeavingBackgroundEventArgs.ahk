#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Deferral.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Gets the deferral object when the app is leaving the background state.
 * @remarks
 * > [!TIP]
 * > This event is raised before any UI is shown and is a good place to ensure that any assets that you load programmatically are ready so that the UI will be presented correctly.
 * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.ileavingbackgroundeventargs
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class ILeavingBackgroundEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILeavingBackgroundEventArgs
     * @type {Guid}
     */
    static IID => Guid("{39c6ec9a-ae6e-46f9-a07a-cfc23f88733e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeferral"]

    /**
     * Gets the deferral object which delays the transition from running in the background to running in the foreground until the app calls [Deferral.Complete](../windows.foundation/deferral_complete_1807836922.md) or the deadline for navigation has passed.
     * @remarks
     * Deferrals are important if you call asynchronous methods from your event handler. Without the deferral, the app transitions to the next state when the event handler returns— which may happen before your asynchronous method has finished.
     * @returns {Deferral} 
     * @see https://learn.microsoft.com/uwp/api/windows.applicationmodel.ileavingbackgroundeventargs.getdeferral
     */
    GetDeferral() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}
