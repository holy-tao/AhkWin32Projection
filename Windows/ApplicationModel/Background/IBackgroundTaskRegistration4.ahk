#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IBackgroundTaskRegistration4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBackgroundTaskRegistration4
     * @type {Guid}
     */
    static IID => Guid("{169c09c9-b0de-5576-a05b-a02067989879}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TaskLastThrottledInStandbyTimestamp", "get_AppEnergyUsePredictionContribution"]

    /**
     * @type {DateTime} 
     */
    TaskLastThrottledInStandbyTimestamp {
        get => this.get_TaskLastThrottledInStandbyTimestamp()
    }

    /**
     * @type {Float} 
     */
    AppEnergyUsePredictionContribution {
        get => this.get_AppEnergyUsePredictionContribution()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_TaskLastThrottledInStandbyTimestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_AppEnergyUsePredictionContribution() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
