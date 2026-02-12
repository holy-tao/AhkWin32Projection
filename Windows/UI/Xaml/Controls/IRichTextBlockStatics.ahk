#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IRichTextBlockStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRichTextBlockStatics
     * @type {Guid}
     */
    static IID => Guid("{492d883c-adea-433c-be1c-208a164262be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontSizeProperty", "get_FontFamilyProperty", "get_FontWeightProperty", "get_FontStyleProperty", "get_FontStretchProperty", "get_ForegroundProperty", "get_TextWrappingProperty", "get_TextTrimmingProperty", "get_TextAlignmentProperty", "get_PaddingProperty", "get_LineHeightProperty", "get_LineStackingStrategyProperty", "get_CharacterSpacingProperty", "get_OverflowContentTargetProperty", "get_IsTextSelectionEnabledProperty", "get_HasOverflowContentProperty", "get_SelectedTextProperty", "get_TextIndentProperty"]

    /**
     * @type {DependencyProperty} 
     */
    FontSizeProperty {
        get => this.get_FontSizeProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontFamilyProperty {
        get => this.get_FontFamilyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontWeightProperty {
        get => this.get_FontWeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontStyleProperty {
        get => this.get_FontStyleProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    FontStretchProperty {
        get => this.get_FontStretchProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ForegroundProperty {
        get => this.get_ForegroundProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextWrappingProperty {
        get => this.get_TextWrappingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextTrimmingProperty {
        get => this.get_TextTrimmingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextAlignmentProperty {
        get => this.get_TextAlignmentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    PaddingProperty {
        get => this.get_PaddingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineHeightProperty {
        get => this.get_LineHeightProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    LineStackingStrategyProperty {
        get => this.get_LineStackingStrategyProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    CharacterSpacingProperty {
        get => this.get_CharacterSpacingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    OverflowContentTargetProperty {
        get => this.get_OverflowContentTargetProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    IsTextSelectionEnabledProperty {
        get => this.get_IsTextSelectionEnabledProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    HasOverflowContentProperty {
        get => this.get_HasOverflowContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    SelectedTextProperty {
        get => this.get_SelectedTextProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    TextIndentProperty {
        get => this.get_TextIndentProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontSizeProperty() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontFamilyProperty() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontWeightProperty() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontStyleProperty() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_FontStretchProperty() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ForegroundProperty() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextWrappingProperty() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextTrimmingProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextAlignmentProperty() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_PaddingProperty() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LineHeightProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_LineStackingStrategyProperty() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_CharacterSpacingProperty() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_OverflowContentTargetProperty() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_IsTextSelectionEnabledProperty() {
        result := ComCall(20, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_HasOverflowContentProperty() {
        result := ComCall(21, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_SelectedTextProperty() {
        result := ComCall(22, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_TextIndentProperty() {
        result := ComCall(23, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
