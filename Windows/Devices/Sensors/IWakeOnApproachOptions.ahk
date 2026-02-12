#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IWakeOnApproachOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWakeOnApproachOptions
     * @type {Guid}
     */
    static IID => Guid("{f0b87ae7-7e1f-5ea5-814d-6b7e07defc2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AllowWhenExternalDisplayConnected", "put_AllowWhenExternalDisplayConnected", "get_DisableWhenBatterySaverOn", "put_DisableWhenBatterySaverOn"]

    /**
     * @type {Boolean} 
     */
    AllowWhenExternalDisplayConnected {
        get => this.get_AllowWhenExternalDisplayConnected()
        set => this.put_AllowWhenExternalDisplayConnected(value)
    }

    /**
     * @type {Boolean} 
     */
    DisableWhenBatterySaverOn {
        get => this.get_DisableWhenBatterySaverOn()
        set => this.put_DisableWhenBatterySaverOn(value)
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

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisableWhenBatterySaverOn() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_DisableWhenBatterySaverOn(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
