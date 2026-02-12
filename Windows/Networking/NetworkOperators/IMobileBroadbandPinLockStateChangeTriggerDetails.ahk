#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandPinLockStateChange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandPinLockStateChangeTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandPinLockStateChangeTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{d338c091-3e91-4d38-9036-aee83a6e79ad}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinLockStateChanges"]

    /**
     * @type {IVectorView<MobileBroadbandPinLockStateChange>} 
     */
    PinLockStateChanges {
        get => this.get_PinLockStateChanges()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandPinLockStateChange>} 
     */
    get_PinLockStateChanges() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandPinLockStateChange, value)
    }
}
