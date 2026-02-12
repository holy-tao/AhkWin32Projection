#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MobileBroadbandRadioStateChange.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IMobileBroadbandRadioStateChangeTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMobileBroadbandRadioStateChangeTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{71301ace-093c-42c6-b0db-ad1f75a65445}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RadioStateChanges"]

    /**
     * @type {IVectorView<MobileBroadbandRadioStateChange>} 
     */
    RadioStateChanges {
        get => this.get_RadioStateChanges()
    }

    /**
     * 
     * @returns {IVectorView<MobileBroadbandRadioStateChange>} 
     */
    get_RadioStateChanges() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MobileBroadbandRadioStateChange, value)
    }
}
