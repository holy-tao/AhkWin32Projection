#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IAdaptiveDimmingOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAdaptiveDimmingOptions
     * @type {Guid}
     */
    static IID => Guid("{d3213cf7-89b5-5732-b2a0-aefe324f54e6}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowWhenExternalDisplayConnected", "put_AllowWhenExternalDisplayConnected"]

    /**
     * @type {Boolean} 
     */
    AllowWhenExternalDisplayConnected {
        get => this.get_AllowWhenExternalDisplayConnected()
        set => this.put_AllowWhenExternalDisplayConnected(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AllowWhenExternalDisplayConnected() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AllowWhenExternalDisplayConnected(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
