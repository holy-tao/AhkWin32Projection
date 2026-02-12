#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Foundation\Uri.ahk
#Include ..\Media\Brush.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class IGlyphs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGlyphs
     * @type {Guid}
     */
    static IID => Guid("{d079498b-f2b1-4281-99a2-e4d05932b2b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UnicodeString", "put_UnicodeString", "get_Indices", "put_Indices", "get_FontUri", "put_FontUri", "get_StyleSimulations", "put_StyleSimulations", "get_FontRenderingEmSize", "put_FontRenderingEmSize", "get_OriginX", "put_OriginX", "get_OriginY", "put_OriginY", "get_Fill", "put_Fill"]

    /**
     * @type {HSTRING} 
     */
    UnicodeString {
        get => this.get_UnicodeString()
        set => this.put_UnicodeString(value)
    }

    /**
     * @type {HSTRING} 
     */
    Indices {
        get => this.get_Indices()
        set => this.put_Indices(value)
    }

    /**
     * @type {Uri} 
     */
    FontUri {
        get => this.get_FontUri()
        set => this.put_FontUri(value)
    }

    /**
     * @type {Integer} 
     */
    StyleSimulations {
        get => this.get_StyleSimulations()
        set => this.put_StyleSimulations(value)
    }

    /**
     * @type {Float} 
     */
    FontRenderingEmSize {
        get => this.get_FontRenderingEmSize()
        set => this.put_FontRenderingEmSize(value)
    }

    /**
     * @type {Float} 
     */
    OriginX {
        get => this.get_OriginX()
        set => this.put_OriginX(value)
    }

    /**
     * @type {Float} 
     */
    OriginY {
        get => this.get_OriginY()
        set => this.put_OriginY(value)
    }

    /**
     * @type {Brush} 
     */
    Fill {
        get => this.get_Fill()
        set => this.put_Fill(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_UnicodeString() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_UnicodeString(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Indices() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Indices(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_FontUri() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_FontUri(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StyleSimulations() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_StyleSimulations(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_FontRenderingEmSize() {
        result := ComCall(14, this, "double*", &value := 0, "int")
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
    put_FontRenderingEmSize(value) {
        result := ComCall(15, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OriginX() {
        result := ComCall(16, this, "double*", &value := 0, "int")
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
    put_OriginX(value) {
        result := ComCall(17, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OriginY() {
        result := ComCall(18, this, "double*", &value := 0, "int")
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
    put_OriginY(value) {
        result := ComCall(19, this, "double", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Fill() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Brush(value)
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Fill(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
