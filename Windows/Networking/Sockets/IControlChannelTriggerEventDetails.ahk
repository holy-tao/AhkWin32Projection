#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\ControlChannelTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * An object instantiated by the background broker infrastructure that is used to differentiate control channel triggers.
 * @remarks
 * The background broker infrastructure instantiates an object of this type when a background task is initialized. Applications receive a reference to this object in the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md). Applications can use the ControlChannelTrigger property on the IControlChannelTriggerEventDetails object to retrieve the [ControlChannelTrigger](controlchanneltrigger.md) object associated with the control channel trigger event. This allows an application to map a specific control channel trigger event to a specific [ControlChannelTrigger](controlchanneltrigger.md) object and any other associated objects such as the [StreamSocket](streamsocket.md) object on which an application has registered to enable real-time network status and triggers.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggereventdetails
 * @namespace Windows.Networking.Sockets
 * @version WindowsRuntime 1.4
 */
class IControlChannelTriggerEventDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IControlChannelTriggerEventDetails
     * @type {Guid}
     */
    static IID => Guid("{1b36e047-89bb-4236-96ac-71d012bb4869}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ControlChannelTrigger"]

    /**
     * Gets the [ControlChannelTrigger](controlchanneltrigger.md) object associated with an [IControlChannelTriggerEventDetails](icontrolchanneltriggereventdetails.md) object.
     * @remarks
     * The background broker infrastructure instantiates an [IControlChannelTriggerEventDetails](icontrolchanneltriggereventdetails.md) object when a background task is initialized. Applications receive a reference to this object in the [Run](../windows.applicationmodel.background/ibackgroundtask_run_2017283929.md) method of the [IBackgroundTask](../windows.applicationmodel.background/ibackgroundtask.md). Applications can use the [ControlChannelTrigger](icontrolchanneltriggereventdetails.md) property to retrieve the [ControlChannelTrigger](controlchanneltrigger.md) object associated with the control channel trigger event. This allows an application to map a specific control channel trigger event to a specific [ControlChannelTrigger](controlchanneltrigger.md) object and any other associated objects such as the [StreamSocket](streamsocket.md) object on which an application has registered to enable real-time network status and triggers.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.sockets.icontrolchanneltriggereventdetails.controlchanneltrigger
     * @type {ControlChannelTrigger} 
     */
    ControlChannelTrigger {
        get => this.get_ControlChannelTrigger()
    }

    /**
     * 
     * @returns {ControlChannelTrigger} 
     */
    get_ControlChannelTrigger() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ControlChannelTrigger(value)
    }
}
