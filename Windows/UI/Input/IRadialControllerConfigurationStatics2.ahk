#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RadialController.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IRadialControllerConfigurationStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRadialControllerConfigurationStatics2
     * @type {Guid}
     */
    static IID => Guid("{53e08b17-e205-48d3-9caf-80ff47c4d7c7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_AppController", "get_AppController", "put_IsAppControllerEnabled", "get_IsAppControllerEnabled"]

    /**
     * @type {RadialController} 
     */
    AppController {
        get => this.get_AppController()
        set => this.put_AppController(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAppControllerEnabled {
        get => this.get_IsAppControllerEnabled()
        set => this.put_IsAppControllerEnabled(value)
    }

    /**
     * 
     * @param {RadialController} value 
     * @returns {HRESULT} 
     */
    put_AppController(value) {
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {RadialController} 
     */
    get_AppController() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RadialController(value)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAppControllerEnabled(value) {
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
    get_IsAppControllerEnabled() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
