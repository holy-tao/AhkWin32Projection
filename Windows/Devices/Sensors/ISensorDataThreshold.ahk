#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Identifies a threshold for sensor data. When this threshold is crossed, the sensor trigger will activate.
 * @remarks
 * Sensors can support different types of thresholds depending on the type of sensor involved. For example, a pedometer could support having a threshold that will trigger if the number of steps exceeds a set value. On the other hand, a proximity could have a threshold that is activated when the sensor state changes.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.isensordatathreshold
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class ISensorDataThreshold extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorDataThreshold
     * @type {Guid}
     */
    static IID => Guid("{54daec61-fe4b-4e07-b260-3a4cdfbe396e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => []
}
