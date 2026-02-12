#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IMagnetometerReading extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagnetometerReading
     * @type {Guid}
     */
    static IID => Guid("{0c2cc40d-ebfd-4e5c-bb11-afc29b3cae61}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Timestamp", "get_MagneticFieldX", "get_MagneticFieldY", "get_MagneticFieldZ", "get_DirectionalAccuracy"]

    /**
     * @type {DateTime} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {Float} 
     */
    MagneticFieldX {
        get => this.get_MagneticFieldX()
    }

    /**
     * @type {Float} 
     */
    MagneticFieldY {
        get => this.get_MagneticFieldY()
    }

    /**
     * @type {Float} 
     */
    MagneticFieldZ {
        get => this.get_MagneticFieldZ()
    }

    /**
     * @type {Integer} 
     */
    DirectionalAccuracy {
        get => this.get_DirectionalAccuracy()
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
     * @returns {Float} 
     */
    get_MagneticFieldX() {
        result := ComCall(7, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MagneticFieldY() {
        result := ComCall(8, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MagneticFieldZ() {
        result := ComCall(9, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DirectionalAccuracy() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
