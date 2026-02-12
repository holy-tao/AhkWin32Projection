#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderCardTypesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderCardTypesStatics
     * @type {Guid}
     */
    static IID => Guid("{528f2c5d-2986-474f-8454-7ccd05928d5f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Unknown", "get_Bank", "get_Aamva", "get_ExtendedBase"]

    /**
     * @type {Integer} 
     */
    Unknown {
        get => this.get_Unknown()
    }

    /**
     * @type {Integer} 
     */
    Bank {
        get => this.get_Bank()
    }

    /**
     * @type {Integer} 
     */
    Aamva {
        get => this.get_Aamva()
    }

    /**
     * @type {Integer} 
     */
    ExtendedBase {
        get => this.get_ExtendedBase()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Unknown() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Bank() {
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
    get_Aamva() {
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
    get_ExtendedBase() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
