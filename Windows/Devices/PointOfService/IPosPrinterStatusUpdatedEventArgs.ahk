#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\PosPrinterStatus.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterStatusUpdatedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterStatusUpdatedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{2edb87df-13a6-428d-ba81-b0e7c3e5a3cd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status"]

    /**
     * @type {PosPrinterStatus} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {PosPrinterStatus} 
     */
    get_Status() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PosPrinterStatus(value)
    }
}
