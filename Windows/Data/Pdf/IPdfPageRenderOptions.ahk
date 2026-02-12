#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\RECT.ahk
#Include ..\..\UI\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Data.Pdf
 * @version WindowsRuntime 1.4
 */
class IPdfPageRenderOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPdfPageRenderOptions
     * @type {Guid}
     */
    static IID => Guid("{3c98056f-b7cf-4c29-9a04-52d90267f425}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SourceRect", "put_SourceRect", "get_DestinationWidth", "put_DestinationWidth", "get_DestinationHeight", "put_DestinationHeight", "get_BackgroundColor", "put_BackgroundColor", "get_IsIgnoringHighContrast", "put_IsIgnoringHighContrast", "get_BitmapEncoderId", "put_BitmapEncoderId"]

    /**
     * @type {RECT} 
     */
    SourceRect {
        get => this.get_SourceRect()
        set => this.put_SourceRect(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationWidth {
        get => this.get_DestinationWidth()
        set => this.put_DestinationWidth(value)
    }

    /**
     * @type {Integer} 
     */
    DestinationHeight {
        get => this.get_DestinationHeight()
        set => this.put_DestinationHeight(value)
    }

    /**
     * @type {Color} 
     */
    BackgroundColor {
        get => this.get_BackgroundColor()
        set => this.put_BackgroundColor(value)
    }

    /**
     * @type {Boolean} 
     */
    IsIgnoringHighContrast {
        get => this.get_IsIgnoringHighContrast()
        set => this.put_IsIgnoringHighContrast(value)
    }

    /**
     * @type {Guid} 
     */
    BitmapEncoderId {
        get => this.get_BitmapEncoderId()
        set => this.put_BitmapEncoderId(value)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_SourceRect() {
        value := RECT()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {RECT} value 
     * @returns {HRESULT} 
     */
    put_SourceRect(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DestinationWidth() {
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
    put_DestinationWidth(value) {
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
    get_DestinationHeight() {
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
    put_DestinationHeight(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_BackgroundColor() {
        value := Color()
        result := ComCall(12, this, "ptr", value, "int")
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
    put_BackgroundColor(value) {
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
    get_IsIgnoringHighContrast() {
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
    put_IsIgnoringHighContrast(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BitmapEncoderId() {
        value := Guid()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_BitmapEncoderId(value) {
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
