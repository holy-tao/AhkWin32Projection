#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MobileBroadbandSlotManager.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandDeviceInformation4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandDeviceInformation4
     * @type {Guid}
     */
    static IID => Guid("{263f3152-7b9d-582c-b17c-f80a60b50031}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SlotManager"]

    /**
     * @type {MobileBroadbandSlotManager} 
     */
    SlotManager {
        get => this.get_SlotManager()
    }

    /**
     * 
     * @returns {MobileBroadbandSlotManager} 
     */
    get_SlotManager() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandSlotManager(value)
    }
}
