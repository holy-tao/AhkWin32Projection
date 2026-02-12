#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICommandBarTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{61c8f92c-05aa-414a-a2ae-482c5a46c08e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentHeight", "get_OverflowContentClipRect", "get_OverflowContentMinWidth", "get_OverflowContentMaxHeight", "get_OverflowContentHorizontalOffset", "get_OverflowContentHeight", "get_NegativeOverflowContentHeight"]

    /**
     * @type {Float} 
     */
    ContentHeight {
        get => this.get_ContentHeight()
    }

    /**
     * @type {RECT} 
     */
    OverflowContentClipRect {
        get => this.get_OverflowContentClipRect()
    }

    /**
     * @type {Float} 
     */
    OverflowContentMinWidth {
        get => this.get_OverflowContentMinWidth()
    }

    /**
     * @type {Float} 
     */
    OverflowContentMaxHeight {
        get => this.get_OverflowContentMaxHeight()
    }

    /**
     * @type {Float} 
     */
    OverflowContentHorizontalOffset {
        get => this.get_OverflowContentHorizontalOffset()
    }

    /**
     * @type {Float} 
     */
    OverflowContentHeight {
        get => this.get_OverflowContentHeight()
    }

    /**
     * @type {Float} 
     */
    NegativeOverflowContentHeight {
        get => this.get_NegativeOverflowContentHeight()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ContentHeight() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_OverflowContentClipRect() {
        value := RECT()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMinWidth() {
        result := ComCall(8, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentMaxHeight() {
        result := ComCall(9, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHorizontalOffset() {
        result := ComCall(10, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OverflowContentHeight() {
        result := ComCall(11, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NegativeOverflowContentHeight() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
