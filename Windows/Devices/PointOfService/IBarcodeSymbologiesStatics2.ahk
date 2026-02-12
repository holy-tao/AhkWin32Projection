#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IBarcodeSymbologiesStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeSymbologiesStatics2
     * @type {Guid}
     */
    static IID => Guid("{8b7518f4-99d0-40bf-9424-b91d6dd4c6e0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Gs1DWCode"]

    /**
     * @type {Integer} 
     */
    Gs1DWCode {
        get => this.get_Gs1DWCode()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Gs1DWCode() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
