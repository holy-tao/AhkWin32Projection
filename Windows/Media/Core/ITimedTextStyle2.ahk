#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextStyle2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextStyle2
     * @type {Guid}
     */
    static IID => Guid("{655f492d-6111-4787-89cc-686fece57e14}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontStyle", "put_FontStyle", "get_IsUnderlineEnabled", "put_IsUnderlineEnabled", "get_IsLineThroughEnabled", "put_IsLineThroughEnabled", "get_IsOverlineEnabled", "put_IsOverlineEnabled"]

    /**
     * @type {Integer} 
     */
    FontStyle {
        get => this.get_FontStyle()
        set => this.put_FontStyle(value)
    }

    /**
     * @type {Boolean} 
     */
    IsUnderlineEnabled {
        get => this.get_IsUnderlineEnabled()
        set => this.put_IsUnderlineEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsLineThroughEnabled {
        get => this.get_IsLineThroughEnabled()
        set => this.put_IsLineThroughEnabled(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOverlineEnabled {
        get => this.get_IsOverlineEnabled()
        set => this.put_IsOverlineEnabled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_FontStyle() {
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
    put_FontStyle(value) {
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
    get_IsUnderlineEnabled() {
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
    put_IsUnderlineEnabled(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsLineThroughEnabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
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
    put_IsLineThroughEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverlineEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_IsOverlineEnabled(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
