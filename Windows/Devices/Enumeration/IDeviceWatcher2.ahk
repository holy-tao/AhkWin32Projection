#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\Background\DeviceWatcherTrigger.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Enumeration
 * @version WindowsRuntime 1.4
 */
class IDeviceWatcher2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeviceWatcher2
     * @type {Guid}
     */
    static IID => Guid("{ff08456e-ed14-49e9-9a69-8117c54ae971}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBackgroundTrigger"]

    /**
     * 
     * @param {IIterable<Integer>} requestedEventKinds 
     * @returns {DeviceWatcherTrigger} 
     */
    GetBackgroundTrigger(requestedEventKinds) {
        result := ComCall(6, this, "ptr", requestedEventKinds, "ptr*", &trigger := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DeviceWatcherTrigger(trigger)
    }
}
