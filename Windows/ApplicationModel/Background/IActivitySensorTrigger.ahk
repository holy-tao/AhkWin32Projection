#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Background
 * @version WindowsRuntime 1.4
 */
class IActivitySensorTrigger extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActivitySensorTrigger
     * @type {Guid}
     */
    static IID => Guid("{d0dd4342-e37b-4823-a5fe-6b31dfefdeb0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubscribedActivities", "get_ReportInterval", "get_SupportedActivities", "get_MinimumReportInterval"]

    /**
     * @type {IVector<Integer>} 
     */
    SubscribedActivities {
        get => this.get_SubscribedActivities()
    }

    /**
     * @type {Integer} 
     */
    ReportInterval {
        get => this.get_ReportInterval()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    SupportedActivities {
        get => this.get_SupportedActivities()
    }

    /**
     * @type {Integer} 
     */
    MinimumReportInterval {
        get => this.get_MinimumReportInterval()
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_SubscribedActivities() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ReportInterval() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_SupportedActivities() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinimumReportInterval() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
