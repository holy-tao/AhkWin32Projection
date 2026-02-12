#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\BarcodeScannerProviderConnection.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService.Provider
 * @version WindowsRuntime 1.4
 */
class IBarcodeScannerProviderTriggerDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBarcodeScannerProviderTriggerDetails
     * @type {Guid}
     */
    static IID => Guid("{50856d82-24e3-48ce-99c7-70aac1cbc9f7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Connection"]

    /**
     * @type {BarcodeScannerProviderConnection} 
     */
    Connection {
        get => this.get_Connection()
    }

    /**
     * 
     * @returns {BarcodeScannerProviderConnection} 
     */
    get_Connection() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return BarcodeScannerProviderConnection(value)
    }
}
