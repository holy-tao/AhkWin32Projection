#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include .\LineDisplayWindow.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class ILineDisplayAttributes extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILineDisplayAttributes
     * @type {Guid}
     */
    static IID => Guid("{c17de99c-229a-4c14-a6f1-b4e4b1fead92}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsPowerNotifyEnabled", "put_IsPowerNotifyEnabled", "get_Brightness", "put_Brightness", "get_BlinkRate", "put_BlinkRate", "get_ScreenSizeInCharacters", "put_ScreenSizeInCharacters", "get_CharacterSet", "put_CharacterSet", "get_IsCharacterSetMappingEnabled", "put_IsCharacterSetMappingEnabled", "get_CurrentWindow", "put_CurrentWindow"]

    /**
     * @type {Boolean} 
     */
    IsPowerNotifyEnabled {
        get => this.get_IsPowerNotifyEnabled()
        set => this.put_IsPowerNotifyEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    Brightness {
        get => this.get_Brightness()
        set => this.put_Brightness(value)
    }

    /**
     * @type {TimeSpan} 
     */
    BlinkRate {
        get => this.get_BlinkRate()
        set => this.put_BlinkRate(value)
    }

    /**
     * @type {SIZE} 
     */
    ScreenSizeInCharacters {
        get => this.get_ScreenSizeInCharacters()
        set => this.put_ScreenSizeInCharacters(value)
    }

    /**
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

    /**
     * @type {Boolean} 
     */
    IsCharacterSetMappingEnabled {
        get => this.get_IsCharacterSetMappingEnabled()
        set => this.put_IsCharacterSetMappingEnabled(value)
    }

    /**
     * @type {LineDisplayWindow} 
     */
    CurrentWindow {
        get => this.get_CurrentWindow()
        set => this.put_CurrentWindow(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsPowerNotifyEnabled() {
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
    put_IsPowerNotifyEnabled(value) {
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
    get_Brightness() {
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
    put_Brightness(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_BlinkRate() {
        value := TimeSpan()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_BlinkRate(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScreenSizeInCharacters() {
        value := SIZE()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_ScreenSizeInCharacters(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CharacterSet() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_CharacterSet(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCharacterSetMappingEnabled() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_IsCharacterSetMappingEnabled(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {LineDisplayWindow} 
     */
    get_CurrentWindow() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return LineDisplayWindow(value)
    }

    /**
     * 
     * @param {LineDisplayWindow} value 
     * @returns {HRESULT} 
     */
    put_CurrentWindow(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
