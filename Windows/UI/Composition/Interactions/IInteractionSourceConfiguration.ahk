#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Composition.Interactions
 * @version WindowsRuntime 1.4
 */
class IInteractionSourceConfiguration extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IInteractionSourceConfiguration
     * @type {Guid}
     */
    static IID => Guid("{a78347e5-a9d1-4d02-985e-b930cd0b9da4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PositionXSourceMode", "put_PositionXSourceMode", "get_PositionYSourceMode", "put_PositionYSourceMode", "get_ScaleSourceMode", "put_ScaleSourceMode"]

    /**
     * @type {Integer} 
     */
    PositionXSourceMode {
        get => this.get_PositionXSourceMode()
        set => this.put_PositionXSourceMode(value)
    }

    /**
     * @type {Integer} 
     */
    PositionYSourceMode {
        get => this.get_PositionYSourceMode()
        set => this.put_PositionYSourceMode(value)
    }

    /**
     * @type {Integer} 
     */
    ScaleSourceMode {
        get => this.get_ScaleSourceMode()
        set => this.put_ScaleSourceMode(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PositionXSourceMode() {
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
    put_PositionXSourceMode(value) {
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
    get_PositionYSourceMode() {
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
    put_PositionYSourceMode(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScaleSourceMode() {
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
    put_ScaleSourceMode(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
