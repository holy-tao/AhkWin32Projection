#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Devices.Core
 * @version WindowsRuntime 1.4
 */
class IFrameFocusCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFrameFocusCapabilities
     * @type {Guid}
     */
    static IID => Guid("{7b25cd58-01c0-4065-9c40-c1a721425c1a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Supported", "get_Min", "get_Max", "get_Step"]

    /**
     * @type {Boolean} 
     */
    Supported {
        get => this.get_Supported()
    }

    /**
     * @type {Integer} 
     */
    Min {
        get => this.get_Min()
    }

    /**
     * @type {Integer} 
     */
    Max {
        get => this.get_Max()
    }

    /**
     * @type {Integer} 
     */
    Step {
        get => this.get_Step()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Supported() {
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
    get_Min() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Max() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Step() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
