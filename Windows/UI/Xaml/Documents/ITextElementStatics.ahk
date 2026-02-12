#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\DependencyProperty.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ITextElementStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITextElementStatics
     * @type {Guid}
     */
    static IID => Guid("{0a2f9b98-6c03-4470-a79b-3298a10482ce}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FontSizeProperty", "get_FontFamilyProperty", "get_FontWeightProperty", "get_FontStyleProperty", "get_FontStretchProperty", "get_CharacterSpacingProperty", "get_ForegroundProperty", "get_LanguageProperty"]

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
     * @type {DependencyProperty} 
     */
    LanguageProperty {
        get => this.get_LanguageProperty()
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
    get_CharacterSpacingProperty() {
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
    get_ForegroundProperty() {
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
    get_LanguageProperty() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return DependencyProperty(value)
    }
}
