#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class IContentPresenterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IContentPresenterStatics
     * @type {Guid}
     */
    static IID => Guid("{18c2893b-da2e-4426-b85a-2c7e2171bedf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ContentProperty", "get_ContentTemplateProperty", "get_ContentTemplateSelectorProperty", "get_ContentTransitionsProperty", "get_FontSizeProperty", "get_FontFamilyProperty", "get_FontWeightProperty", "get_FontStyleProperty", "get_FontStretchProperty", "get_CharacterSpacingProperty", "get_ForegroundProperty"]

    /**
     * @type {DependencyProperty} 
     */
    ContentProperty {
        get => this.get_ContentProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTemplateProperty {
        get => this.get_ContentTemplateProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTemplateSelectorProperty {
        get => this.get_ContentTemplateSelectorProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ContentTransitionsProperty {
        get => this.get_ContentTransitionsProperty()
    }

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
    CharacterSpacingProperty {
        get => this.get_CharacterSpacingProperty()
    }

    /**
     * @type {DependencyProperty} 
     */
    ForegroundProperty {
        get => this.get_ForegroundProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_ContentProperty() {
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
    get_ContentTemplateProperty() {
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
    get_ContentTemplateSelectorProperty() {
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
    get_ContentTransitionsProperty() {
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
    get_FontSizeProperty() {
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
    get_FontFamilyProperty() {
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
    get_FontWeightProperty() {
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
    get_FontStyleProperty() {
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
    get_FontStretchProperty() {
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
    get_CharacterSpacingProperty() {
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
    get_ForegroundProperty() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
