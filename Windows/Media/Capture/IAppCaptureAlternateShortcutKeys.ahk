#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class IAppCaptureAlternateShortcutKeys extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppCaptureAlternateShortcutKeys
     * @type {Guid}
     */
    static IID => Guid("{19e8e0ef-236c-40f9-b38f-9b7dd65d1ccc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["put_ToggleGameBarKey", "get_ToggleGameBarKey", "put_ToggleGameBarKeyModifiers", "get_ToggleGameBarKeyModifiers", "put_SaveHistoricalVideoKey", "get_SaveHistoricalVideoKey", "put_SaveHistoricalVideoKeyModifiers", "get_SaveHistoricalVideoKeyModifiers", "put_ToggleRecordingKey", "get_ToggleRecordingKey", "put_ToggleRecordingKeyModifiers", "get_ToggleRecordingKeyModifiers", "put_TakeScreenshotKey", "get_TakeScreenshotKey", "put_TakeScreenshotKeyModifiers", "get_TakeScreenshotKeyModifiers", "put_ToggleRecordingIndicatorKey", "get_ToggleRecordingIndicatorKey", "put_ToggleRecordingIndicatorKeyModifiers", "get_ToggleRecordingIndicatorKeyModifiers"]

    /**
     * @type {Integer} 
     */
    ToggleGameBarKey {
        get => this.get_ToggleGameBarKey()
        set => this.put_ToggleGameBarKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleGameBarKeyModifiers {
        get => this.get_ToggleGameBarKeyModifiers()
        set => this.put_ToggleGameBarKeyModifiers(value)
    }

    /**
     * @type {Integer} 
     */
    SaveHistoricalVideoKey {
        get => this.get_SaveHistoricalVideoKey()
        set => this.put_SaveHistoricalVideoKey(value)
    }

    /**
     * @type {Integer} 
     */
    SaveHistoricalVideoKeyModifiers {
        get => this.get_SaveHistoricalVideoKeyModifiers()
        set => this.put_SaveHistoricalVideoKeyModifiers(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleRecordingKey {
        get => this.get_ToggleRecordingKey()
        set => this.put_ToggleRecordingKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleRecordingKeyModifiers {
        get => this.get_ToggleRecordingKeyModifiers()
        set => this.put_ToggleRecordingKeyModifiers(value)
    }

    /**
     * @type {Integer} 
     */
    TakeScreenshotKey {
        get => this.get_TakeScreenshotKey()
        set => this.put_TakeScreenshotKey(value)
    }

    /**
     * @type {Integer} 
     */
    TakeScreenshotKeyModifiers {
        get => this.get_TakeScreenshotKeyModifiers()
        set => this.put_TakeScreenshotKeyModifiers(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleRecordingIndicatorKey {
        get => this.get_ToggleRecordingIndicatorKey()
        set => this.put_ToggleRecordingIndicatorKey(value)
    }

    /**
     * @type {Integer} 
     */
    ToggleRecordingIndicatorKeyModifiers {
        get => this.get_ToggleRecordingIndicatorKeyModifiers()
        set => this.put_ToggleRecordingIndicatorKeyModifiers(value)
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ToggleGameBarKey(value) {
        result := ComCall(6, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleGameBarKey() {
        result := ComCall(7, this, "int*", &value := 0, "int")
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
    put_ToggleGameBarKeyModifiers(value) {
        result := ComCall(8, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleGameBarKeyModifiers() {
        result := ComCall(9, this, "uint*", &value := 0, "int")
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
    put_SaveHistoricalVideoKey(value) {
        result := ComCall(10, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SaveHistoricalVideoKey() {
        result := ComCall(11, this, "int*", &value := 0, "int")
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
    put_SaveHistoricalVideoKeyModifiers(value) {
        result := ComCall(12, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SaveHistoricalVideoKeyModifiers() {
        result := ComCall(13, this, "uint*", &value := 0, "int")
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
    put_ToggleRecordingKey(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingKey() {
        result := ComCall(15, this, "int*", &value := 0, "int")
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
    put_ToggleRecordingKeyModifiers(value) {
        result := ComCall(16, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingKeyModifiers() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
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
    put_TakeScreenshotKey(value) {
        result := ComCall(18, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TakeScreenshotKey() {
        result := ComCall(19, this, "int*", &value := 0, "int")
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
    put_TakeScreenshotKeyModifiers(value) {
        result := ComCall(20, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TakeScreenshotKeyModifiers() {
        result := ComCall(21, this, "uint*", &value := 0, "int")
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
    put_ToggleRecordingIndicatorKey(value) {
        result := ComCall(22, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingIndicatorKey() {
        result := ComCall(23, this, "int*", &value := 0, "int")
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
    put_ToggleRecordingIndicatorKeyModifiers(value) {
        result := ComCall(24, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ToggleRecordingIndicatorKeyModifiers() {
        result := ComCall(25, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
