#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\Foundation\RECT.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class ICommandBarFlyoutCommandBarTemplateSettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICommandBarFlyoutCommandBarTemplateSettings
     * @type {Guid}
     */
    static IID => Guid("{47642c44-26ff-5d14-9cfc-77dc64f3a447}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OpenAnimationStartPosition", "get_OpenAnimationEndPosition", "get_CloseAnimationEndPosition", "get_CurrentWidth", "get_ExpandedWidth", "get_WidthExpansionDelta", "get_WidthExpansionAnimationStartPosition", "get_WidthExpansionAnimationEndPosition", "get_WidthExpansionMoreButtonAnimationStartPosition", "get_WidthExpansionMoreButtonAnimationEndPosition", "get_ExpandUpOverflowVerticalPosition", "get_ExpandDownOverflowVerticalPosition", "get_ExpandUpAnimationStartPosition", "get_ExpandUpAnimationEndPosition", "get_ExpandUpAnimationHoldPosition", "get_ExpandDownAnimationStartPosition", "get_ExpandDownAnimationEndPosition", "get_ExpandDownAnimationHoldPosition", "get_ContentClipRect", "get_OverflowContentClipRect"]

    /**
     * @type {Float} 
     */
    OpenAnimationStartPosition {
        get => this.get_OpenAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    OpenAnimationEndPosition {
        get => this.get_OpenAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    CloseAnimationEndPosition {
        get => this.get_CloseAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    CurrentWidth {
        get => this.get_CurrentWidth()
    }

    /**
     * @type {Float} 
     */
    ExpandedWidth {
        get => this.get_ExpandedWidth()
    }

    /**
     * @type {Float} 
     */
    WidthExpansionDelta {
        get => this.get_WidthExpansionDelta()
    }

    /**
     * @type {Float} 
     */
    WidthExpansionAnimationStartPosition {
        get => this.get_WidthExpansionAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    WidthExpansionAnimationEndPosition {
        get => this.get_WidthExpansionAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    WidthExpansionMoreButtonAnimationStartPosition {
        get => this.get_WidthExpansionMoreButtonAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    WidthExpansionMoreButtonAnimationEndPosition {
        get => this.get_WidthExpansionMoreButtonAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandUpOverflowVerticalPosition {
        get => this.get_ExpandUpOverflowVerticalPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandDownOverflowVerticalPosition {
        get => this.get_ExpandDownOverflowVerticalPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandUpAnimationStartPosition {
        get => this.get_ExpandUpAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandUpAnimationEndPosition {
        get => this.get_ExpandUpAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandUpAnimationHoldPosition {
        get => this.get_ExpandUpAnimationHoldPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandDownAnimationStartPosition {
        get => this.get_ExpandDownAnimationStartPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandDownAnimationEndPosition {
        get => this.get_ExpandDownAnimationEndPosition()
    }

    /**
     * @type {Float} 
     */
    ExpandDownAnimationHoldPosition {
        get => this.get_ExpandDownAnimationHoldPosition()
    }

    /**
     * @type {RECT} 
     */
    ContentClipRect {
        get => this.get_ContentClipRect()
    }

    /**
     * @type {RECT} 
     */
    OverflowContentClipRect {
        get => this.get_OverflowContentClipRect()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenAnimationStartPosition() {
        result := ComCall(6, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_OpenAnimationEndPosition() {
        result := ComCall(7, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_CloseAnimationEndPosition() {
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
    get_CurrentWidth() {
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
    get_ExpandedWidth() {
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
    get_WidthExpansionDelta() {
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
    get_WidthExpansionAnimationStartPosition() {
        result := ComCall(12, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionAnimationEndPosition() {
        result := ComCall(13, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionMoreButtonAnimationStartPosition() {
        result := ComCall(14, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_WidthExpansionMoreButtonAnimationEndPosition() {
        result := ComCall(15, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpOverflowVerticalPosition() {
        result := ComCall(16, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownOverflowVerticalPosition() {
        result := ComCall(17, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationStartPosition() {
        result := ComCall(18, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationEndPosition() {
        result := ComCall(19, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandUpAnimationHoldPosition() {
        result := ComCall(20, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationStartPosition() {
        result := ComCall(21, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationEndPosition() {
        result := ComCall(22, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ExpandDownAnimationHoldPosition() {
        result := ComCall(23, this, "double*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_ContentClipRect() {
        value := RECT()
        result := ComCall(24, this, "ptr", value, "int")
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
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
