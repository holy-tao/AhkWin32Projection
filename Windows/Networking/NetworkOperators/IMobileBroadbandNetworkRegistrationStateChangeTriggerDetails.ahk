#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandNetworkRegistrationStateChange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandNetworkRegistrationStateChangeTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{89135cff-28b8-46aa-b137-1c4b0f21edfe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NetworkRegistrationStateChanges"]

    /**
     * @type {IVectorView<MobileBroadbandNetworkRegistrationStateChange>} 
     */
    NetworkRegistrationStateChanges {
        get => this.get_NetworkRegistrationStateChanges()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandNetworkRegistrationStateChange>} 
     */
    get_NetworkRegistrationStateChanges() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandNetworkRegistrationStateChange, value)
    }
}
