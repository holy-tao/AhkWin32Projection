#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Input
 * @version WindowsRuntime 1.4
 */
class ITouchCapabilities extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITouchCapabilities
     * @type {Guid}
     */
    static IID => Guid("{20dd55f9-13f1-46c8-9285-2c05fa3eda6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TouchPresent", "get_Contacts"]

    /**
     * @type {Integer} 
     */
    TouchPresent {
        get => this.get_TouchPresent()
    }

    /**
     * @type {Integer} 
     */
    Contacts {
        get => this.get_Contacts()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TouchPresent() {
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
    get_Contacts() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
