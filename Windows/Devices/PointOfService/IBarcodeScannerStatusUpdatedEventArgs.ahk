#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerStatusUpdatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerStatusUpdatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{355d8586-9c43-462b-a91a-816dc97f452c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_ExtendedStatus"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * @type {Integer} 
     */
    ExtendedStatus {
        get => this.get_ExtendedStatus()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
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
    get_ExtendedStatus() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
