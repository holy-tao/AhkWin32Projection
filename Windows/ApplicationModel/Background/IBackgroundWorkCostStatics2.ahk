#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundWorkCostStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundWorkCostStatics2
     * @type {Guid}
     */
    static IID => Guid("{d868c976-81f6-57c8-ab2b-400b749e21d6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AppEnergyUseLevel", "get_AppEnergyUsePrediction", "get_AppLastThrottledInStandbyTimestamp"]

    /**
     * @type {Integer} 
     */
    AppEnergyUseLevel {
        get => this.get_AppEnergyUseLevel()
    }

    /**
     * @type {Integer} 
     */
    AppEnergyUsePrediction {
        get => this.get_AppEnergyUsePrediction()
    }

    /**
     * @type {DateTime} 
     */
    AppLastThrottledInStandbyTimestamp {
        get => this.get_AppLastThrottledInStandbyTimestamp()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppEnergyUseLevel() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppEnergyUsePrediction() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_AppLastThrottledInStandbyTimestamp() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
