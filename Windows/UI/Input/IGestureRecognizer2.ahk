#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class IGestureRecognizer2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGestureRecognizer2
     * @type {Guid}
     */
    static IID => Guid("{d646097f-6ef7-5746-8ba8-8ff2206e6f3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TapMinContactCount", "put_TapMinContactCount", "get_TapMaxContactCount", "put_TapMaxContactCount", "get_HoldMinContactCount", "put_HoldMinContactCount", "get_HoldMaxContactCount", "put_HoldMaxContactCount", "get_HoldRadius", "put_HoldRadius", "get_HoldStartDelay", "put_HoldStartDelay", "get_TranslationMinContactCount", "put_TranslationMinContactCount", "get_TranslationMaxContactCount", "put_TranslationMaxContactCount"]

    /**
     * @type {Integer} 
     */
    TapMinContactCount {
        get => this.get_TapMinContactCount()
        set => this.put_TapMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TapMaxContactCount {
        get => this.get_TapMaxContactCount()
        set => this.put_TapMaxContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMinContactCount {
        get => this.get_HoldMinContactCount()
        set => this.put_HoldMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    HoldMaxContactCount {
        get => this.get_HoldMaxContactCount()
        set => this.put_HoldMaxContactCount(value)
    }

    /**
     * @type {Float} 
     */
    HoldRadius {
        get => this.get_HoldRadius()
        set => this.put_HoldRadius(value)
    }

    /**
     * @type {TimeSpan} 
     */
    HoldStartDelay {
        get => this.get_HoldStartDelay()
        set => this.put_HoldStartDelay(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMinContactCount {
        get => this.get_TranslationMinContactCount()
        set => this.put_TranslationMinContactCount(value)
    }

    /**
     * @type {Integer} 
     */
    TranslationMaxContactCount {
        get => this.get_TranslationMaxContactCount()
        set => this.put_TranslationMaxContactCount(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMinContactCount() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
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
    put_TapMinContactCount(value) {
        result := ComCall(7, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TapMaxContactCount() {
        result := ComCall(8, this, "uint*", &value := 0, "int")
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
    put_TapMaxContactCount(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMinContactCount() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
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
    put_HoldMinContactCount(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoldMaxContactCount() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
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
    put_HoldMaxContactCount(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_HoldRadius() {
        result := ComCall(14, this, "float*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_HoldRadius(value) {
        result := ComCall(15, this, "float", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_HoldStartDelay() {
        value := TimeSpan()
        result := ComCall(16, this, "ptr", value, "int")
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
    put_HoldStartDelay(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMinContactCount() {
        result := ComCall(18, this, "uint*", &value := 0, "int")
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
    put_TranslationMinContactCount(value) {
        result := ComCall(19, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TranslationMaxContactCount() {
        result := ComCall(20, this, "uint*", &value := 0, "int")
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
    put_TranslationMaxContactCount(value) {
        result := ComCall(21, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
