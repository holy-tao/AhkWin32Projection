#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include .\PerceptionCorrelation.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Perception.Provider
 * @version WindowsRuntime 1.4
 */
class IPerceptionCorrelationGroup extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionCorrelationGroup
     * @type {Guid}
     */
    static IID => Guid("{752a0906-36a7-47bb-9b79-56cc6b746770}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RelativeLocations"]

    /**
     * @type {IVectorView<PerceptionCorrelation>} 
     */
    RelativeLocations {
        get => this.get_RelativeLocations()
    }

    /**
     * 
     * @returns {IVectorView<PerceptionCorrelation>} 
     */
    get_RelativeLocations() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PerceptionCorrelation, value)
    }
}
