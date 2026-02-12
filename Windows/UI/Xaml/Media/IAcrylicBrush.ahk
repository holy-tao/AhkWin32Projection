#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Color.ahk
#Include ..\..\..\Foundation\TimeSpan.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class IAcrylicBrush extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAcrylicBrush
     * @type {Guid}
     */
    static IID => Guid("{79bbcf4e-cd66-4f1b-a8b6-cd6d2977c18d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_BackgroundSource", "put_BackgroundSource", "get_TintColor", "put_TintColor", "get_TintOpacity", "put_TintOpacity", "get_TintTransitionDuration", "put_TintTransitionDuration", "get_AlwaysUseFallback", "put_AlwaysUseFallback"]

    /**
     * @type {Integer} 
     */
    BackgroundSource {
        get => this.get_BackgroundSource()
        set => this.put_BackgroundSource(value)
    }

    /**
     * @type {Color} 
     */
    TintColor {
        get => this.get_TintColor()
        set => this.put_TintColor(value)
    }

    /**
     * @type {Float} 
     */
    TintOpacity {
        get => this.get_TintOpacity()
        set => this.put_TintOpacity(value)
    }

    /**
     * @type {TimeSpan} 
     */
    TintTransitionDuration {
        get => this.get_TintTransitionDuration()
        set => this.put_TintTransitionDuration(value)
    }

    /**
     * @type {Boolean} 
     */
    AlwaysUseFallback {
        get => this.get_AlwaysUseFallback()
        set => this.put_AlwaysUseFallback(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BackgroundSource() {
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
    put_BackgroundSource(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_TintColor() {
        value := Color()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Color} value 
     * @returns {HRESULT} 
     */
    put_TintColor(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_TintOpacity() {
        result := ComCall(10, this, "double*", &value := 0, "int")
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
    put_TintOpacity(value) {
        result := ComCall(11, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_TintTransitionDuration() {
        value := TimeSpan()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_TintTransitionDuration(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AlwaysUseFallback() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_AlwaysUseFallback(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
