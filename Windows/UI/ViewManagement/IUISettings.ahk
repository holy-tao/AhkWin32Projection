#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\Foundation\SIZE.ahk
#Include ..\Color.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class IUISettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUISettings
     * @type {Guid}
     */
    static IID => Guid("{85361600-1c63-4627-bcb1-3a89e0bc9c55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_HandPreference", "get_CursorSize", "get_ScrollBarSize", "get_ScrollBarArrowSize", "get_ScrollBarThumbBoxSize", "get_MessageDuration", "get_AnimationsEnabled", "get_CaretBrowsingEnabled", "get_CaretBlinkRate", "get_CaretWidth", "get_DoubleClickTime", "get_MouseHoverTime", "UIElementColor"]

    /**
     * @type {Integer} 
     */
    HandPreference {
        get => this.get_HandPreference()
    }

    /**
     * @type {SIZE} 
     */
    CursorSize {
        get => this.get_CursorSize()
    }

    /**
     * @type {SIZE} 
     */
    ScrollBarSize {
        get => this.get_ScrollBarSize()
    }

    /**
     * @type {SIZE} 
     */
    ScrollBarArrowSize {
        get => this.get_ScrollBarArrowSize()
    }

    /**
     * @type {SIZE} 
     */
    ScrollBarThumbBoxSize {
        get => this.get_ScrollBarThumbBoxSize()
    }

    /**
     * @type {Integer} 
     */
    MessageDuration {
        get => this.get_MessageDuration()
    }

    /**
     * @type {Boolean} 
     */
    AnimationsEnabled {
        get => this.get_AnimationsEnabled()
    }

    /**
     * @type {Boolean} 
     */
    CaretBrowsingEnabled {
        get => this.get_CaretBrowsingEnabled()
    }

    /**
     * @type {Integer} 
     */
    CaretBlinkRate {
        get => this.get_CaretBlinkRate()
    }

    /**
     * @type {Integer} 
     */
    CaretWidth {
        get => this.get_CaretWidth()
    }

    /**
     * @type {Integer} 
     */
    DoubleClickTime {
        get => this.get_DoubleClickTime()
    }

    /**
     * @type {Integer} 
     */
    MouseHoverTime {
        get => this.get_MouseHoverTime()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HandPreference() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CursorSize() {
        value := SIZE()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarSize() {
        value := SIZE()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarArrowSize() {
        value := SIZE()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_ScrollBarThumbBoxSize() {
        value := SIZE()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MessageDuration() {
        result := ComCall(11, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AnimationsEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CaretBrowsingEnabled() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretBlinkRate() {
        result := ComCall(14, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CaretWidth() {
        result := ComCall(15, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DoubleClickTime() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MouseHoverTime() {
        result := ComCall(17, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} desiredElement 
     * @returns {Color} 
     */
    UIElementColor(desiredElement) {
        value := Color()
        result := ComCall(18, this, "int", desiredElement, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
