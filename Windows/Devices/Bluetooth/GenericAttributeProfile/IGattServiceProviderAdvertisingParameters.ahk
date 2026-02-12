#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattServiceProviderAdvertisingParameters extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattServiceProviderAdvertisingParameters
     * @type {Guid}
     */
    static IID => Guid("{e2ce31ab-6315-4c22-9bd7-781dbc3d8d82}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_IsConnectable", "get_IsConnectable", "put_IsDiscoverable", "get_IsDiscoverable"]

    /**
     * @type {Boolean} 
     */
    IsConnectable {
        get => this.get_IsConnectable()
        set => this.put_IsConnectable(value)
    }

    /**
     * @type {Boolean} 
     */
    IsDiscoverable {
        get => this.get_IsDiscoverable()
        set => this.put_IsDiscoverable(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsConnectable(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsConnectable() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_IsDiscoverable(value) {
        result := ComCall(8, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDiscoverable() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
