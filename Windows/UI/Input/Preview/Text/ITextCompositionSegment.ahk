#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Text\Core\CoreTextRange.ahk
#Include .\TextCompositionSegment.ahk
#Include .\TextStyle.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Input.Preview.Text
 * @version WindowsRuntime 1.4
 */
class ITextCompositionSegment extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextCompositionSegment
     * @type {Guid}
     */
    static IID => Guid("{0543f6c6-eb98-56d6-8808-2eca6d02f6a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Text", "put_Text", "get_ConvertedText", "put_ConvertedText", "get_UnconvertedText", "put_UnconvertedText", "get_Range", "get_ConversionState", "put_ConversionState", "get_Next", "get_Previous", "GetTextStyle", "SetTextStyle"]

    /**
     * @type {HSTRING} 
     */
    Text {
        get => this.get_Text()
        set => this.put_Text(value)
    }

    /**
     * @type {HSTRING} 
     */
    ConvertedText {
        get => this.get_ConvertedText()
        set => this.put_ConvertedText(value)
    }

    /**
     * @type {HSTRING} 
     */
    UnconvertedText {
        get => this.get_UnconvertedText()
        set => this.put_UnconvertedText(value)
    }

    /**
     * @type {CoreTextRange} 
     */
    Range {
        get => this.get_Range()
    }

    /**
     * @type {Integer} 
     */
    ConversionState {
        get => this.get_ConversionState()
        set => this.put_ConversionState(value)
    }

    /**
     * @type {TextCompositionSegment} 
     */
    Next {
        get => this.get_Next()
    }

    /**
     * @type {TextCompositionSegment} 
     */
    Previous {
        get => this.get_Previous()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Text() {
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
    put_Text(value) {
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
    get_ConvertedText() {
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
    put_ConvertedText(value) {
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
     * @returns {HSTRING} 
     */
    get_UnconvertedText() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
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
    put_UnconvertedText(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {CoreTextRange} 
     */
    get_Range() {
        value := CoreTextRange()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ConversionState() {
        result := ComCall(13, this, "int*", &value := 0, "int")
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
    put_ConversionState(value) {
        result := ComCall(14, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_Next() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextCompositionSegment(value)
    }

    /**
     * 
     * @returns {TextCompositionSegment} 
     */
    get_Previous() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextCompositionSegment(value)
    }

    /**
     * 
     * @returns {TextStyle} 
     */
    GetTextStyle() {
        result_ := TextStyle()
        result := ComCall(17, this, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {TextStyle} value 
     * @returns {HRESULT} 
     */
    SetTextStyle(value) {
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
