#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IMagneticStripeReaderEncryptionAlgorithmsStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMagneticStripeReaderEncryptionAlgorithmsStatics
     * @type {Guid}
     */
    static IID => Guid("{53b57350-c3db-4754-9c00-41392374a109}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_None", "get_TripleDesDukpt", "get_ExtendedBase"]

    /**
     * @type {Integer} 
     */
    None {
        get => this.get_None()
    }

    /**
     * @type {Integer} 
     */
    TripleDesDukpt {
        get => this.get_TripleDesDukpt()
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
    get_None() {
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
    get_TripleDesDukpt() {
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
    get_ExtendedBase() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
