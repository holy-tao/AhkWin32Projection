#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Inking
 * @version WindowsRuntime 1.4
 */
class IInkInputConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInkInputConfiguration
     * @type {Guid}
     */
    static IID => Guid("{93a68dc4-0b7b-49d7-b34f-9901e524dcf2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPrimaryBarrelButtonInputEnabled", "put_IsPrimaryBarrelButtonInputEnabled", "get_IsEraserInputEnabled", "put_IsEraserInputEnabled"]

    /**
     * @type {Boolean} 
     */
    IsPrimaryBarrelButtonInputEnabled {
        get => this.get_IsPrimaryBarrelButtonInputEnabled()
        set => this.put_IsPrimaryBarrelButtonInputEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsEraserInputEnabled {
        get => this.get_IsEraserInputEnabled()
        set => this.put_IsEraserInputEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPrimaryBarrelButtonInputEnabled() {
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
    put_IsPrimaryBarrelButtonInputEnabled(value) {
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
    get_IsEraserInputEnabled() {
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
    put_IsEraserInputEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
