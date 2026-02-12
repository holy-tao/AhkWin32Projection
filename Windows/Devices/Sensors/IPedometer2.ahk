#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IMapView.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\PedometerReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IPedometer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPedometer2
     * @type {Guid}
     */
    static IID => Guid("{e5a406df-2b81-4add-b2ff-77ab6c98ba19}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentReadings"]

    /**
     * 
     * @returns {IMapView<Integer, PedometerReading>} 
     */
    GetCurrentReadings() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView((ptr) => IPropertyValue(ptr).GetInt32(), PedometerReading, value)
    }
}
