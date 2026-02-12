#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An object instantiated by the background broker infrastructure for a **ControlChannelReset** event to indicate that a [ControlChannelTrigger](controlchanneltrigger.md) was reset.
 * @remarks
 * The IControlChannelTriggerResetEventDetails object is instantiated by the background broker infrastructure for a [SystemTriggerType](../windows.applicationmodel.background/systemtriggertype.md) set to the **ControlChannelReset** event.
 * 
 * An app must register with the system event broker for a background task to receive a **ControlChannelReset** event. In the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md), the *taskInstance* parameter contains a [IBackgroundTaskInstance](../windows.applicationmodel.background/ibackgroundtaskinstance.md) that can be cast to the IControlChannelTriggerResetEventDetails interface. The app can then use the IControlChannelTriggerResetEventDetails object to determine the reason the [ControlChannelTrigger](controlchanneltrigger.md) was reset. The app can also use the IControlChannelTriggerResetEventDetails object to determine if a hardware slot or a software slot is affected by the **ControlChannelReset** event.
 * 
 * > [!NOTE]
 * > An app must be placed on the lock screen before it can successfully register a background task using the [SystemTriggerType](../windows.applicationmodel.background/systemtriggertype.md) set to the **ControlChannelReset** event.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggerreseteventdetails
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IControlChannelTriggerResetEventDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlChannelTriggerResetEventDetails
     * @type {Guid}
     */
    static IID => Guid("{6851038e-8ec4-42fe-9bb2-21e91b7bfcb1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ResetReason", "get_HardwareSlotReset", "get_SoftwareSlotReset"]

    /**
     * A value that indicates the reason why a [ControlChannelTrigger](controlchanneltrigger.md) was reset.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggerreseteventdetails.resetreason
     * @type {Integer} 
     */
    ResetReason {
        get => this.get_ResetReason()
    }

    /**
     * A value that indicates if a hardware slot was affected by a [ControlChannelTrigger](controlchanneltrigger.md) reset event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggerreseteventdetails.hardwareslotreset
     * @type {Boolean} 
     */
    HardwareSlotReset {
        get => this.get_HardwareSlotReset()
    }

    /**
     * A value that indicates if a software slot was affected by a [ControlChannelTrigger](controlchanneltrigger.md) reset event.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggerreseteventdetails.softwareslotreset
     * @type {Boolean} 
     */
    SoftwareSlotReset {
        get => this.get_SoftwareSlotReset()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResetReason() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HardwareSlotReset() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SoftwareSlotReset() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
