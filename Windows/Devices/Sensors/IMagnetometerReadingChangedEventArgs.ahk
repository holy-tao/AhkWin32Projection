#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MagnetometerReading.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IMagnetometerReadingChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagnetometerReadingChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{17eae872-2eb9-4ee7-8ad0-3127537d949b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Reading"]

    /**
     * @type {MagnetometerReading} 
     */
    Reading {
        get => this.get_Reading()
    }

    /**
     * 
     * @returns {MagnetometerReading} 
     */
    get_Reading() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MagnetometerReading(value)
    }
}
