#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MobileBroadbandSlotInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandSlotInfoChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandSlotInfoChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3158839f-950c-54ce-a48d-ba4529b48f0f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SlotInfo"]

    /**
     * @type {MobileBroadbandSlotInfo} 
     */
    SlotInfo {
        get => this.get_SlotInfo()
    }

    /**
     * 
     * @returns {MobileBroadbandSlotInfo} 
     */
    get_SlotInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MobileBroadbandSlotInfo(value)
    }
}
