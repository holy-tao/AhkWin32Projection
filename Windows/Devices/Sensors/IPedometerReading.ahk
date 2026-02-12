#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IPedometerReading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPedometerReading
     * @type {Guid}
     */
    static IID => Guid("{2245dcf4-a8e1-432f-896a-be0dd9b02d24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_StepKind", "get_CumulativeSteps", "get_Timestamp", "get_CumulativeStepsDuration"]

    /**
     * @type {Integer} 
     */
    StepKind {
        get => this.get_StepKind()
    }

    /**
     * @type {Integer} 
     */
    CumulativeSteps {
        get => this.get_CumulativeSteps()
    }

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {TimeSpan} 
     */
    CumulativeStepsDuration {
        get => this.get_CumulativeStepsDuration()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StepKind() {
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
    get_CumulativeSteps() {
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
    get_Timestamp() {
        value := DateTime()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_CumulativeStepsDuration() {
        value := TimeSpan()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
