#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\DeviceWatcherEvent.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceWatcherTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceWatcherTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{38808119-4cb7-4e57-a56d-776d07cbfef9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DeviceWatcherEvents"]

    /**
     * @type {IVectorView<DeviceWatcherEvent>} 
     */
    DeviceWatcherEvents {
        get => this.get_DeviceWatcherEvents()
    }

    /**
     * 
     * @returns {IVectorView<DeviceWatcherEvent>} 
     */
    get_DeviceWatcherEvents() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(DeviceWatcherEvent, value)
    }
}
