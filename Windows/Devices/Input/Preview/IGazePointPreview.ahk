#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\GazeDevicePreview.ahk
#Include ..\..\..\Foundation\IReference.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\HumanInterfaceDevice\HidInputReport.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input.Preview
 * @version WindowsRuntime 1.4
 */
class IGazePointPreview extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGazePointPreview
     * @type {Guid}
     */
    static IID => Guid("{e79e7eea-b389-11e7-b201-c8d3ffb75721}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceDevice", "get_EyeGazePosition", "get_HeadGazePosition", "get_Timestamp", "get_HidInputReport"]

    /**
     * @type {GazeDevicePreview} 
     */
    SourceDevice {
        get => this.get_SourceDevice()
    }

    /**
     * @type {IReference<POINT>} 
     */
    EyeGazePosition {
        get => this.get_EyeGazePosition()
    }

    /**
     * @type {IReference<POINT>} 
     */
    HeadGazePosition {
        get => this.get_HeadGazePosition()
    }

    /**
     * @type {Integer} 
     */
    Timestamp {
        get => this.get_Timestamp()
    }

    /**
     * @type {HidInputReport} 
     */
    HidInputReport {
        get => this.get_HidInputReport()
    }

    /**
     * 
     * @returns {GazeDevicePreview} 
     */
    get_SourceDevice() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return GazeDevicePreview(value)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_EyeGazePosition() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetPOINT(), value)
    }

    /**
     * 
     * @returns {IReference<POINT>} 
     */
    get_HeadGazePosition() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetPOINT(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timestamp() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HidInputReport} 
     */
    get_HidInputReport() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HidInputReport(value)
    }
}
