#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\PowerGridData.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Power
 * @version WindowsRuntime 1.4
 */
class IPowerGridForecast extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPowerGridForecast
     * @type {Guid}
     */
    static IID => Guid("{077e4de9-ed60-58bb-a850-003c6a138685}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StartTime", "get_BlockDuration", "get_Forecast"]

    /**
     * @type {DateTime} 
     */
    StartTime {
        get => this.get_StartTime()
    }

    /**
     * @type {TimeSpan} 
     */
    BlockDuration {
        get => this.get_BlockDuration()
    }

    /**
     * @type {IVectorView<PowerGridData>} 
     */
    Forecast {
        get => this.get_Forecast()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_StartTime() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BlockDuration() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<PowerGridData>} 
     */
    get_Forecast() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(PowerGridData, value)
    }
}
