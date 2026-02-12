#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.Background
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderConnection2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderConnection2
     * @type {Guid}
     */
    static IID => Guid("{90d12be0-ebc0-484f-ae0a-7eb8b6266bac}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UpdateAdvertisingParameters"]

    /**
     * 
     * @param {GattServiceProviderAdvertisingParameters} parameters 
     * @returns {HRESULT} 
     */
    UpdateAdvertisingParameters(parameters) {
        result := ComCall(6, this, "ptr", parameters, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
