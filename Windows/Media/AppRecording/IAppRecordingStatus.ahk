#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\AppRecordingStatusDetails.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class IAppRecordingStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppRecordingStatus
     * @type {Guid}
     */
    static IID => Guid("{1d0cc82c-bc18-4b8a-a6ef-127efab3b5d9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanRecord", "get_CanRecordTimeSpan", "get_HistoricalBufferDuration", "get_Details"]

    /**
     * @type {Boolean} 
     */
    CanRecord {
        get => this.get_CanRecord()
    }

    /**
     * @type {Boolean} 
     */
    CanRecordTimeSpan {
        get => this.get_CanRecordTimeSpan()
    }

    /**
     * @type {TimeSpan} 
     */
    HistoricalBufferDuration {
        get => this.get_HistoricalBufferDuration()
    }

    /**
     * @type {AppRecordingStatusDetails} 
     */
    Details {
        get => this.get_Details()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRecord() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRecordTimeSpan() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HistoricalBufferDuration() {
        value := TimeSpan()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {AppRecordingStatusDetails} 
     */
    get_Details() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppRecordingStatusDetails(value)
    }
}
