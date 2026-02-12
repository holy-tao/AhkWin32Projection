#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class IPosPrinterPrintOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPosPrinterPrintOptions
     * @type {Guid}
     */
    static IID => Guid("{0a2e16fd-1d02-5a58-9d59-bfcde76fde86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TypeFace", "put_TypeFace", "get_CharacterHeight", "put_CharacterHeight", "get_Bold", "put_Bold", "get_Italic", "put_Italic", "get_Underline", "put_Underline", "get_ReverseVideo", "put_ReverseVideo", "get_Strikethrough", "put_Strikethrough", "get_Superscript", "put_Superscript", "get_Subscript", "put_Subscript", "get_DoubleWide", "put_DoubleWide", "get_DoubleHigh", "put_DoubleHigh", "get_Alignment", "put_Alignment", "get_CharacterSet", "put_CharacterSet"]

    /**
     * @type {HSTRING} 
     */
    TypeFace {
        get => this.get_TypeFace()
        set => this.put_TypeFace(value)
    }

    /**
     * @type {Integer} 
     */
    CharacterHeight {
        get => this.get_CharacterHeight()
        set => this.put_CharacterHeight(value)
    }

    /**
     * @type {Boolean} 
     */
    Bold {
        get => this.get_Bold()
        set => this.put_Bold(value)
    }

    /**
     * @type {Boolean} 
     */
    Italic {
        get => this.get_Italic()
        set => this.put_Italic(value)
    }

    /**
     * @type {Boolean} 
     */
    Underline {
        get => this.get_Underline()
        set => this.put_Underline(value)
    }

    /**
     * @type {Boolean} 
     */
    ReverseVideo {
        get => this.get_ReverseVideo()
        set => this.put_ReverseVideo(value)
    }

    /**
     * @type {Boolean} 
     */
    Strikethrough {
        get => this.get_Strikethrough()
        set => this.put_Strikethrough(value)
    }

    /**
     * @type {Boolean} 
     */
    Superscript {
        get => this.get_Superscript()
        set => this.put_Superscript(value)
    }

    /**
     * @type {Boolean} 
     */
    Subscript {
        get => this.get_Subscript()
        set => this.put_Subscript(value)
    }

    /**
     * @type {Boolean} 
     */
    DoubleWide {
        get => this.get_DoubleWide()
        set => this.put_DoubleWide(value)
    }

    /**
     * @type {Boolean} 
     */
    DoubleHigh {
        get => this.get_DoubleHigh()
        set => this.put_DoubleHigh(value)
    }

    /**
     * @type {Integer} 
     */
    Alignment {
        get => this.get_Alignment()
        set => this.put_Alignment(value)
    }

    /**
     * @type {Integer} 
     */
    CharacterSet {
        get => this.get_CharacterSet()
        set => this.put_CharacterSet(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TypeFace() {
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
    put_TypeFace(value) {
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
     * @returns {Integer} 
     */
    get_CharacterHeight() {
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
    put_CharacterHeight(value) {
        result := ComCall(9, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Bold() {
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
    put_Bold(value) {
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
    get_Italic() {
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
    put_Italic(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Underline() {
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
    put_Underline(value) {
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
    get_ReverseVideo() {
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
    put_ReverseVideo(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Strikethrough() {
        result := ComCall(18, this, "int*", &value := 0, "int")
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
    put_Strikethrough(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Superscript() {
        result := ComCall(20, this, "int*", &value := 0, "int")
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
    put_Superscript(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Subscript() {
        result := ComCall(22, this, "int*", &value := 0, "int")
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
    put_Subscript(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoubleWide() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_DoubleWide(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DoubleHigh() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_DoubleHigh(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Alignment() {
        result := ComCall(28, this, "int*", &value := 0, "int")
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
    put_Alignment(value) {
        result := ComCall(29, this, "int", value, "int")
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
        result := ComCall(30, this, "uint*", &value := 0, "int")
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
        result := ComCall(31, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
