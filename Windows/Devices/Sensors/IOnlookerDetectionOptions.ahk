#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class IOnlookerDetectionOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IOnlookerDetectionOptions
     * @type {Guid}
     */
    static IID => Guid("{0412b36f-36e6-51e2-876e-65197cc53c12}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Action", "put_Action", "get_BackOnMode", "put_BackOnMode"]

    /**
     * @type {Integer} 
     */
    Action {
        get => this.get_Action()
        set => this.put_Action(value)
    }

    /**
     * @type {Integer} 
     */
    BackOnMode {
        get => this.get_BackOnMode()
        set => this.put_BackOnMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Action() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_Action(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackOnMode() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_BackOnMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
