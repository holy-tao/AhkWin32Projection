#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\HumanPresenceSensorReadingUpdate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Defines the implementation for a type that supports inspecting and modifying human presence sensor readings in the pipeline between the sensor and the system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IHumanPresenceSensorExtension extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHumanPresenceSensorExtension
     * @type {Guid}
     */
    static IID => Guid("{3e526a71-2d1d-5d43-8a8e-a434a8242ef0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Start", "ProcessReading", "ProcessReadingTimeoutExpired", "Stop", "Uninitialize", "Reset"]

    /**
     * Initializes a **[HumanPresenceSensor](humanpresencesensor.md)** plugin for the specified sensor.
     * @param {HSTRING} deviceInterface The **[HumanPresenceSensor](humanpresencesensor.md)**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.initialize
     */
    Initialize(deviceInterface) {
        if(deviceInterface is String) {
            pin := HSTRING.Create(deviceInterface)
            deviceInterface := pin.Value
        }
        deviceInterface := deviceInterface is Win32Handle ? NumGet(deviceInterface, "ptr") : deviceInterface

        result := ComCall(6, this, "ptr", deviceInterface, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Starts a **[HumanPresenceSensor](humanpresencesensor.md)** stream.
     * @remarks
     * Any code required to start the plugin should go here.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.start
     */
    Start() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Updates a **[HumanPresenceSensor](humanpresencesensor.md)** reading from the sensor stack and returns an updated reading to the sensor stack for processing.
     * @remarks
     * This method will not be called for a new sensor reading until any previous sensor reading has been processed or timed out.
     * @param {HumanPresenceSensorReading} reading 
     * @returns {HumanPresenceSensorReadingUpdate} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.processreading
     */
    ProcessReading(reading) {
        result := ComCall(8, this, "ptr", reading, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HumanPresenceSensorReadingUpdate(result_)
    }

    /**
     * Called when the plugin does not complete a call to **[ProcessReading(Windows.Devices.Sensors.HumanPresenceSensorReading)](ihumanpresencesensorextensionplugin_processreading_1396978893.md)** within a pre-defined timeout.
     * @remarks
     * After calling this method, the sensor stack will proceed with the original reading. If the plugin eventually completes **[ProcessReading(Windows.Devices.Sensors.HumanPresenceSensorReading)](ihumanpresencesensorextensionplugin_processreading_1396978893.md)** for this reading with no errors, the resulting **[HumanPresenceSensorReadingUpdate](humanpresencesensorreadingupdate.md)** object will be ignored.
     * @param {HumanPresenceSensorReading} reading 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.processreadingtimeoutexpired
     */
    ProcessReadingTimeoutExpired(reading) {
        result := ComCall(9, this, "ptr", reading, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Stops a **[HumanPresenceSensor](humanpresencesensor.md)** stream.
     * @remarks
     * Any code required to stop the plugin should go here.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.stop
     */
    Stop() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Uninitializes a **[HumanPresenceSensor](humanpresencesensor.md)** plugin.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.uninitialize
     */
    Uninitialize() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resets a **[HumanPresenceSensor](humanpresencesensor.md)** stream if not responding correctly.
     * @remarks
     * Any code required to reset the plugin should go here.
     * 
     * If Reset fails, the sensor stack will bypass the plugin for subsequent sensor readings. The plugin is considered in a bad state when three calls in a row to **[ProcessReading(Windows.Devices.Sensors.HumanPresenceSensorReading)](ihumanpresencesensorextensionplugin_processreading_1396978893.md)** result in a timeout.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.ihumanpresencesensorextension.reset
     */
    Reset() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
