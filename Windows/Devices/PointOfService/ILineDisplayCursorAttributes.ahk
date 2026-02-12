#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\POINT.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayCursorAttributes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayCursorAttributes
     * @type {Guid}
     */
    static IID => Guid("{4e2d54fe-4ffd-4190-aae1-ce285f20c896}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsBlinkEnabled", "put_IsBlinkEnabled", "get_CursorType", "put_CursorType", "get_IsAutoAdvanceEnabled", "put_IsAutoAdvanceEnabled", "get_Position", "put_Position"]

    /**
     * @type {Boolean} 
     */
    IsBlinkEnabled {
        get => this.get_IsBlinkEnabled()
        set => this.put_IsBlinkEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    CursorType {
        get => this.get_CursorType()
        set => this.put_CursorType(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAutoAdvanceEnabled {
        get => this.get_IsAutoAdvanceEnabled()
        set => this.put_IsAutoAdvanceEnabled(value)
    }

    /**
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBlinkEnabled() {
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
    put_IsBlinkEnabled(value) {
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
    get_CursorType() {
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
    put_CursorType(value) {
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
    get_IsAutoAdvanceEnabled() {
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
    put_IsAutoAdvanceEnabled(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        value := POINT()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {POINT} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
