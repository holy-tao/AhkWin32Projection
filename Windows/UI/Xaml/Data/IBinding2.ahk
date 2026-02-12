#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class IBinding2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBinding2
     * @type {Guid}
     */
    static IID => Guid("{34f96fcb-0406-48b3-9e82-f333ec4c6910}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FallbackValue", "put_FallbackValue", "get_TargetNullValue", "put_TargetNullValue", "get_UpdateSourceTrigger", "put_UpdateSourceTrigger"]

    /**
     * @type {IInspectable} 
     */
    FallbackValue {
        get => this.get_FallbackValue()
        set => this.put_FallbackValue(value)
    }

    /**
     * @type {IInspectable} 
     */
    TargetNullValue {
        get => this.get_TargetNullValue()
        set => this.put_TargetNullValue(value)
    }

    /**
     * @type {Integer} 
     */
    UpdateSourceTrigger {
        get => this.get_UpdateSourceTrigger()
        set => this.put_UpdateSourceTrigger(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_FallbackValue() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_FallbackValue(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TargetNullValue() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_TargetNullValue(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateSourceTrigger() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_UpdateSourceTrigger(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
