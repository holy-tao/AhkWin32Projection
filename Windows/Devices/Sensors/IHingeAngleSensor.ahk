#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\HingeAngleReading.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHingeAngleSensor extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHingeAngleSensor
     * @type {Guid}
     */
    static IID => Guid("{e9d3be02-bfdf-437f-8c29-88c77393d309}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentReadingAsync", "get_DeviceId", "get_MinReportThresholdInDegrees", "get_ReportThresholdInDegrees", "put_ReportThresholdInDegrees", "add_ReadingChanged", "remove_ReadingChanged"]

    /**
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
    }

    /**
     * @type {Float} 
     */
    MinReportThresholdInDegrees {
        get => this.get_MinReportThresholdInDegrees()
    }

    /**
     * @type {Float} 
     */
    ReportThresholdInDegrees {
        get => this.get_ReportThresholdInDegrees()
        set => this.put_ReportThresholdInDegrees(value)
    }

    /**
     * 
     * @returns {IAsyncOperation<HingeAngleReading>} 
     */
    GetCurrentReadingAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(HingeAngleReading, value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinReportThresholdInDegrees() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ReportThresholdInDegrees() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_ReportThresholdInDegrees(value) {
        result := ComCall(10, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<HingeAngleSensor, HingeAngleSensorReadingChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ReadingChanged(handler) {
        token := EventRegistrationToken()
        result := ComCall(11, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ReadingChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(12, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
