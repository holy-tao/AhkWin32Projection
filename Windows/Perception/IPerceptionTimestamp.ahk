#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Foundation\TimeSpan.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Perception
 * @version WindowsRuntime 1.4
 */
class IPerceptionTimestamp extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPerceptionTimestamp
     * @type {Guid}
     */
    static IID => Guid("{87c24804-a22e-4adb-ba26-d78ef639bcf4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TargetTime", "get_PredictionAmount"]

    /**
     * @type {DateTime} 
     */
    TargetTime {
        get => this.get_TargetTime()
    }

    /**
     * @type {TimeSpan} 
     */
    PredictionAmount {
        get => this.get_PredictionAmount()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_TargetTime() {
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
    get_PredictionAmount() {
        value := TimeSpan()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
