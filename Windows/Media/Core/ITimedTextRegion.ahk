#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\TimedTextPoint.ahk
#Include .\TimedTextSize.ahk
#Include ..\..\UI\Color.ahk
#Include .\TimedTextDouble.ahk
#Include .\TimedTextPadding.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class ITimedTextRegion extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITimedTextRegion
     * @type {Guid}
     */
    static IID => Guid("{1ed0881f-8a06-4222-9f59-b21bf40124b4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "put_Name", "get_Position", "put_Position", "get_Extent", "put_Extent", "get_Background", "put_Background", "get_WritingMode", "put_WritingMode", "get_DisplayAlignment", "put_DisplayAlignment", "get_LineHeight", "put_LineHeight", "get_IsOverflowClipped", "put_IsOverflowClipped", "get_Padding", "put_Padding", "get_TextWrapping", "put_TextWrapping", "get_ZIndex", "put_ZIndex", "get_ScrollMode", "put_ScrollMode"]

    /**
     * @type {HSTRING} 
     */
    Name {
        get => this.get_Name()
        set => this.put_Name(value)
    }

    /**
     * @type {TimedTextPoint} 
     */
    Position {
        get => this.get_Position()
        set => this.put_Position(value)
    }

    /**
     * @type {TimedTextSize} 
     */
    Extent {
        get => this.get_Extent()
        set => this.put_Extent(value)
    }

    /**
     * @type {Color} 
     */
    Background {
        get => this.get_Background()
        set => this.put_Background(value)
    }

    /**
     * @type {Integer} 
     */
    WritingMode {
        get => this.get_WritingMode()
        set => this.put_WritingMode(value)
    }

    /**
     * @type {Integer} 
     */
    DisplayAlignment {
        get => this.get_DisplayAlignment()
        set => this.put_DisplayAlignment(value)
    }

    /**
     * @type {TimedTextDouble} 
     */
    LineHeight {
        get => this.get_LineHeight()
        set => this.put_LineHeight(value)
    }

    /**
     * @type {Boolean} 
     */
    IsOverflowClipped {
        get => this.get_IsOverflowClipped()
        set => this.put_IsOverflowClipped(value)
    }

    /**
     * @type {TimedTextPadding} 
     */
    Padding {
        get => this.get_Padding()
        set => this.put_Padding(value)
    }

    /**
     * @type {Integer} 
     */
    TextWrapping {
        get => this.get_TextWrapping()
        set => this.put_TextWrapping(value)
    }

    /**
     * @type {Integer} 
     */
    ZIndex {
        get => this.get_ZIndex()
        set => this.put_ZIndex(value)
    }

    /**
     * @type {Integer} 
     */
    ScrollMode {
        get => this.get_ScrollMode()
        set => this.put_ScrollMode(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Name() {
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
    put_Name(value) {
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
     * @returns {TimedTextPoint} 
     */
    get_Position() {
        value := TimedTextPoint()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextPoint} value 
     * @returns {HRESULT} 
     */
    put_Position(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextSize} 
     */
    get_Extent() {
        value := TimedTextSize()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextSize} value 
     * @returns {HRESULT} 
     */
    put_Extent(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Color} 
     */
    get_Background() {
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
    put_Background(value) {
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
    get_WritingMode() {
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
    put_WritingMode(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisplayAlignment() {
        result := ComCall(16, this, "int*", &value := 0, "int")
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
    put_DisplayAlignment(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextDouble} 
     */
    get_LineHeight() {
        value := TimedTextDouble()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextDouble} value 
     * @returns {HRESULT} 
     */
    put_LineHeight(value) {
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsOverflowClipped() {
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
    put_IsOverflowClipped(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimedTextPadding} 
     */
    get_Padding() {
        value := TimedTextPadding()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimedTextPadding} value 
     * @returns {HRESULT} 
     */
    put_Padding(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_TextWrapping() {
        result := ComCall(24, this, "int*", &value := 0, "int")
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
    put_TextWrapping(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ZIndex() {
        result := ComCall(26, this, "int*", &value := 0, "int")
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
    put_ZIndex(value) {
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
    get_ScrollMode() {
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
    put_ScrollMode(value) {
        result := ComCall(29, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
