#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class IMouseCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMouseCapabilities
     * @type {Guid}
     */
    static IID => Guid("{bca5e023-7dd9-4b6b-9a92-55d43cb38f73}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MousePresent", "get_VerticalWheelPresent", "get_HorizontalWheelPresent", "get_SwapButtons", "get_NumberOfButtons"]

    /**
     * @type {Integer} 
     */
    MousePresent {
        get => this.get_MousePresent()
    }

    /**
     * @type {Integer} 
     */
    VerticalWheelPresent {
        get => this.get_VerticalWheelPresent()
    }

    /**
     * @type {Integer} 
     */
    HorizontalWheelPresent {
        get => this.get_HorizontalWheelPresent()
    }

    /**
     * @type {Integer} 
     */
    SwapButtons {
        get => this.get_SwapButtons()
    }

    /**
     * @type {Integer} 
     */
    NumberOfButtons {
        get => this.get_NumberOfButtons()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MousePresent() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_VerticalWheelPresent() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HorizontalWheelPresent() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SwapButtons() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NumberOfButtons() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
