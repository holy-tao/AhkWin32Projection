#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\SensorRotationMatrix.ahk
#Include .\SensorQuaternion.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IOrientationSensorReading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOrientationSensorReading
     * @type {Guid}
     */
    static IID => Guid("{4756c993-6595-4897-bcc6-d537ee757564}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_RotationMatrix", "get_Quaternion"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {SensorRotationMatrix} 
     */
    RotationMatrix {
        get => this.get_RotationMatrix()
    }

    /**
     * @type {SensorQuaternion} 
     */
    Quaternion {
        get => this.get_Quaternion()
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_Timestamp() {
        value := DateTime()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SensorRotationMatrix} 
     */
    get_RotationMatrix() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SensorRotationMatrix(value)
    }

    /**
     * 
     * @returns {SensorQuaternion} 
     */
    get_Quaternion() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return SensorQuaternion(value)
    }
}
