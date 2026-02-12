#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AdcController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Adc
 * @version WindowsRuntime 1.4
 */
class IAdcChannel extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdcChannel
     * @type {Guid}
     */
    static IID => Guid("{040bf414-2588-4a56-abef-73a260acc60a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Controller", "ReadValue", "ReadRatio"]

    /**
     * @type {AdcController} 
     */
    Controller {
        get => this.get_Controller()
    }

    /**
     * 
     * @returns {AdcController} 
     */
    get_Controller() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AdcController(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    ReadValue() {
        result := ComCall(7, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @returns {Float} 
     */
    ReadRatio() {
        result := ComCall(8, this, "double*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
