#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.WiFiDirect
 * @version WindowsRuntime 1.4
 */
class IWiFiDirectConnectionParameters2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiFiDirectConnectionParameters2
     * @type {Guid}
     */
    static IID => Guid("{ab3b0fbe-aa82-44b4-88c8-e3056b89801d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PreferenceOrderedConfigurationMethods", "get_PreferredPairingProcedure", "put_PreferredPairingProcedure"]

    /**
     * @type {IVector<Integer>} 
     */
    PreferenceOrderedConfigurationMethods {
        get => this.get_PreferenceOrderedConfigurationMethods()
    }

    /**
     * @type {Integer} 
     */
    PreferredPairingProcedure {
        get => this.get_PreferredPairingProcedure()
        set => this.put_PreferredPairingProcedure(value)
    }

    /**
     * 
     * @returns {IVector<Integer>} 
     */
    get_PreferenceOrderedConfigurationMethods() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PreferredPairingProcedure() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PreferredPairingProcedure(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
